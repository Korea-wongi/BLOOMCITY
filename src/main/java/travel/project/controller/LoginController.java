package travel.project.controller;

import java.util.Optional;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;
import travel.project.domain.KakaoProfile;
import travel.project.domain.OAutoToken;
import travel.project.service.LoginService;
import travel.project.service.customer.CustomerService;

@Slf4j
@RequiredArgsConstructor
@Controller
public class LoginController {

	private final LoginService loginService;
	private final CustomerService customerService;
	HttpServletRequest request;
	HttpSession session;
	String main = "main/main";

	@GetMapping("/login")
	public String loginForm(Model model) {
		model.addAttribute("center", "../member/loginForm.jsp");
		return main;
	}

	@PostMapping("/login")
	public String login(@ModelAttribute Customer customer, Model model, HttpServletRequest request) {
		String id = null;
		// Optional로 받아 service 계층에서 filter 사용
		Optional<Customer> loginCustomer = loginService.login(customer.getCustomerId(), customer.getPassword());
		// Optional이 있으면
		if (loginCustomer.isPresent()) {
			id = loginCustomer.get().getCustomerId();
			// id 사용
		} else {
			// Optional이 비어있을 경우의 처리
			loginCustomer.orElseThrow(() -> new RuntimeException("Customer not Found")).getCustomerId();
		}
		session = request.getSession();
		session.setAttribute("id", id);
		return "redirect:/";
	}

	@GetMapping("/login/naver")
	public String naverLogin(@RequestParam String code, Model model, HttpServletRequest request) {
		session = request.getSession();
		Customer customer = loginService.naverLogin(code, session);
		// 리턴받은 Customer가 != null -> Model에 담아 넘길 DTO가 반환
		if (customer != null) {
			model.addAttribute("customer", customer);
			return "member/naverJoin";
		} else {
			return "redirect:/";
		}
	}

	@PostMapping("/login/naver/join")
	public String naverJoin(@ModelAttribute Customer customer, @RequestParam String address1,
			@RequestParam String address2, @RequestParam String address3, @RequestParam String address4,
			@RequestParam String address5, HttpServletRequest request) {
		// join 폼에서 입력받은 값 바인딩 및 DB저장
		String address = address1 + address2 + address3 + address4 + address5;
		customer.setAddress(address);
		loginService.naverJoin(customer);
		session = request.getSession();
		session.setAttribute("id", customer.getCustomerId());
		return "redirect:/";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}




	@GetMapping("/editForm")
	public String editForm(Model model, HttpServletRequest request) {
		session = request.getSession();
		String id = (String) session.getAttribute("id");
		Optional<Customer> customer = customerService.findById(id);
		if (customer.isPresent()) {
			log.info("확인");
			model.addAttribute("customer", customer.get());
			model.addAttribute("center", "../member/editForm.jsp");
		}
		return main;
	}

	@PutMapping("/editForm")
	public String editCustomer(@ModelAttribute Customer customer) {
		// 폼에서 입력받은 customer의 정보 수정
		customerService.update(customer);
		return "redirect:/";
	}

	//카카오 로그인
	@RequestMapping(value = "/member/KaKaoCallback", produces = "application/json;charset-UTF-8", method = RequestMethod.GET)
	public ModelAndView /*@ResponseBody String*/ KaKaoLoginCallBack(String code, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		RestTemplate rt = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "9e9c47f1553d5454adc41705006331a5");
		params.add("redirect_uri", "http://localhost:8081/member/KaKaoCallback");
		params.add("code", code);
		log.info("받은 인가 코드 확인 : " + code);
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
		ResponseEntity<String> responseEntity = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST,
				kakaoTokenRequest, String.class);
		ObjectMapper objectMapper = new ObjectMapper();
		OAutoToken oauthToken = objectMapper.readValue(responseEntity.getBody(), OAutoToken.class);
		log.info("kakaoLogin_access_token : " + oauthToken.getAccess_token());

		RestTemplate rt2 = new RestTemplate();
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		log.info("oauthToken.getAccess_token() : " + oauthToken.getAccess_token());
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = new HttpEntity<>(headers2);
		ResponseEntity<String> response2 = rt2.exchange("https://kapi.kakao.com/v2/user/me", HttpMethod.POST,
				kakaoProfileRequest2, String.class);
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile KakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);

		log.info("카카오 아이디(번호) : " + KakaoProfile.getId());
		log.info("카카오 이름 : " + KakaoProfile.getKakao_account().getName());
		log.info("카카오 이메일 : " + KakaoProfile.getKakao_account().getEmail());

		String customerId = String.valueOf(KakaoProfile.getId());
		String name = KakaoProfile.getKakao_account().getName();
		String email = KakaoProfile.getKakao_account().getEmail();


		String result = customerService.verificationId(customerId);
		log.info("result의 값 : "+result);

		ModelAndView mav = new ModelAndView(main);

		//카카오 로그인 서비스로 처음 로그인시 회원정보 입력받아서 로그인
		if(result.equals("false")){
		Customer customer1= customerService.kakaologin(customerId,name,email);

		mav.addObject("center", "../member/kakaoMembershipJoin.jsp");
		mav.addObject("customer",customer1);

		return mav;

		}else {//카카오 로그인 서비스를 이전에 이용하여 회원정보가 DB에 있을경우 바로 로그인처리
			Customer customer = customerService.kakaoFindById(customerId);
			log.info("customerName : "+customer.getName());
			session = request.getSession();
			session.setAttribute("id", customer.getCustomerId());
			mav.addObject(customer);

		}

		return mav;
//		return  response2.getBody().toString();
//		return  responseEntity.getBody().toString();

	}
	//카카오 로그인 서비스 처음이용시 추가 회원정보 받을 메소드로 회원정보 업데이트 후 로그인처리
	@PostMapping("/member/kakaoMembershipUpdate")
	public String kakaoMembershipUpdate(@ModelAttribute Customer customer,HttpServletRequest request, HttpServletResponse response) {
		customerService.kakaoUpdate(customer);

		session = request.getSession();
		session.setAttribute("id", customer.getCustomerId());


		return main;
	}


}
