package travel.project.service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import travel.project.domain.Customer;
import travel.project.repository.customer.CustomerRepository;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@Slf4j
@RequiredArgsConstructor
@Service
public class LoginServiceImpl implements LoginService{

    private final CustomerRepository customerRepository;


    @Override
    public Optional<Customer> login(String customerId, String password) {
        // filter로 로그인 폼에서 입력받은 password와 db에서 select 해온 customer의 password가 같은지 검증
        return customerRepository.login(customerId, password)
                .filter(m -> m.getPassword().equals(password));

    }

    @Override
    public Customer naverLogin(String code,HttpSession session) {
        String apiURL;
        apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
        apiURL += "client_id=" + "e8WGcOTLKR6mfuHWudqi";
        apiURL += "&client_secret=" + "GJOWDTuQU1";
        apiURL += "&redirect_uri=" + "http://localhost:8083/Project/project1/naverJoin.jsp";
        apiURL += "&code=" + code;
        Optional<Customer> customer = null;
        Customer customer1 = null;
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            log.debug("responseCode = {}", responseCode);
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            if(responseCode==200) {
                log.debug("access token data : {}" , res.toString());
            }

            Gson gson = new Gson();

            //액세스 토큰정보가 포함된 문자열을 json데이터로 변환
            JsonObject jo = gson.fromJson(res.toString(), JsonObject.class);

            //액세스 토큰을 얻어옴
            String accessToken = jo.get("access_token").getAsString();

            String token = accessToken; // 네이버 로그인 접근 토큰;
            String header = "Bearer " + token; // Bearer 다음에 공백 추가


            apiURL = "https://openapi.naver.com/v1/nid/me";


            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put("Authorization", header);
            requestHeaders.put("Accept-Charset", "UTF-8");
            //이름 값을 한글로 받아오기 위해서 설정해주어야 함

            //회원 프로필 정보(id, gender 등)가 저장되어 있는 json데이터 형식의 문자열
            String responseBody = get(apiURL,requestHeaders);


//            request.setAttribute("JSONDATA", responseBody);

            JsonObject jsonObject = gson.fromJson(responseBody, JsonObject.class);

            //JSON데이터의 "response" 객체 내부의 데이터 추출
            JsonObject responseData = jsonObject.getAsJsonObject("response");
            //필요한 데이터 추출
            String id = responseData.get("id").getAsString();
            String email = responseData.get("email").getAsString();
            String mobile = responseData.get("mobile").getAsString().replace("-", "");
            String name = responseData.get("name").getAsString();
            log.debug("API 반환 데이터 : {}",responseBody);
            // id로 회원 존재 여부를 검색해서 Optional로 반환한다
            customer = customerRepository.findById(id);
            if(customer.isPresent()){
                // DB에 회원으로 저장되어 있으면 id를 세션에 걸어줌
                session.setAttribute("id",customer.get().getCustomerId());
                return null;
            }else {
                // DB에 없을경우 model로 넘겨줄 DTO를 만들어줌
                Customer joinCustomer = new Customer();
                joinCustomer.setCustomerId(id);
                joinCustomer.setEmail(email);
                joinCustomer.setPhoneNumber(mobile);
                joinCustomer.setName(name);
                customer1 = customer.orElseGet(() -> joinCustomer);
            }
        }catch (Exception e){
            log.debug("에러 : {}" , e);
        }
        return customer1;
    }


    public static String get(String apiUrl, Map<String, String> requestHeaders){
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
                con.setRequestProperty("Content-Type", "text/json;charset=utf-8");
            }


            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }

    public static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }


    public static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);


        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();


            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }


            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }



    public void NaverLogin(String m_id, HttpServletRequest request) {

        log.debug("로그인할 아이디 : {}", m_id);
        HttpSession session = request.getSession();
        session.setAttribute("id", m_id);

    }

    public void naverJoin(Customer customer) {
        customerRepository.save(customer);
    }
}

