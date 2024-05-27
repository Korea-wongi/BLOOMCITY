package travel.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import travel.project.domain.Customer;

@Mapper
public interface CustomerMapper {

    void save(Customer customer);

    //DB에서 ID 중복확인
	String verificationId(String customerId);
	//DB에서 email 중복확인
	String verificationEmail(String email);
	//DB에서 phoneNumber 중복확인
	String verificationPhoneNumber(String phoneNumber);
    // 로그인하는 Id로
   Customer findById(String customerId);

   void update(Customer customer);

   //카카오 로그인 회원가입 요청
    void kakao(String customerId, String name, String email);
    //카카오 로그인 회원정보 업데이트 요청
	void kakaoUpdate(Customer customer);




}
