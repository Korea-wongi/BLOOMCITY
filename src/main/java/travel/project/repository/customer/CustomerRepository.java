package travel.project.repository.customer;

import java.util.Optional;

import travel.project.domain.Customer;

public interface CustomerRepository {

	//회원가입 요청
    Customer save(Customer customer);

    //회원가입시 아이디 중복검사
    String verificationId(String customerId);
    //회원가입시 이메일 중복검사
    String verificationEmail(String email);

    //회원가입시 핸드폰번호 중복검사
    String verificationPhoneNumber(String phoneNumber);




    Optional<Customer> login(String customerId, String password);

    Optional<Customer> findById(String id);

    void updateCustomer(Customer customer);

    //카카오 로그인 회원가입 요청
	Customer kakaologin(String customerId, String name, String email);

	//카카오 회원정보 update
	void kakaoUpdate(Customer customer);

	Customer kakaoFindById(String id);

}
