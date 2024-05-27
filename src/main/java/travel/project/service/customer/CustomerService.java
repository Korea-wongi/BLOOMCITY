package travel.project.service.customer;

import java.util.Optional;

import travel.project.domain.Customer;

public interface CustomerService {

    Optional<Customer> findById(String id);

    void update(Customer customer);

  //회원가입시 아이디 중복검사
  	public String verificationId(String customerId);

  	//회원가입시 이메일 중복검사
  	public String verificationEmail(String email);

  	//회원가입시 전화번호 중복검사
  	public String verificationPhoneNumber(String phoneNumber);

  	//회원가입 요청
  	public void membershipJoin(Customer customer);

  	//카카오 로그인 회원가입 요청
	Customer kakaologin(String customerId, String name, String email);

	//카카오 로그인 회원정보 update
	void kakaoUpdate(Customer customer);

	Customer kakaoFindById(String id);

}
