package travel.project.repository.customer;

import java.util.Optional;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;
import travel.project.mapper.CustomerMapper;

// 뭐 시발

@Slf4j
@RequiredArgsConstructor
@Repository
public class CustomerRepositoryImpl implements CustomerRepository{

    private final CustomerMapper customerMapper;



    // 회원 한명 insert 하고 다시 리턴
    @Override
    public Customer save(Customer customer) {
        customerMapper.save(customer);
        return customer;
    }

    //회원가입시 아이디 중복검사
	@Override
	public String verificationId(String customerId) {
		return customerMapper.verificationId(customerId);
	}

	//회원가입시 이메일 중복검사
	@Override
	public String verificationEmail(String email) {
		return customerMapper.verificationEmail(email);
	}

	//회원가입시 핸드폰번호 중복검사
	@Override
	public String verificationPhoneNumber(String phoneNumber) {
		return customerMapper.verificationPhoneNumber(phoneNumber);
	}


    // 로그인하는 id, pwd 받고 Optional로 리턴
    @Override
    public Optional<Customer> login(String customerId, String password) {
        return Optional.ofNullable(customerMapper.findById(customerId));
    }

    @Override
    public Optional<Customer> findById(String id) {
        return Optional.ofNullable(customerMapper.findById(id));
    }

    @Override
    public void updateCustomer(Customer customer) {
        customerMapper.update(customer);
    }

    //카카오 로그인
    @Override
    public Customer kakaologin(String customerId, String name, String email) {

    	 customerMapper.kakao(customerId,name,email);

    	 return customerMapper.findById(customerId);
    }

    //카카오 로그인 회원정보 update
    @Override
    public void kakaoUpdate(Customer customer) {
    	customerMapper.kakaoUpdate(customer);
    }

    //카카오 로그인 아이디가 DB에 저장되어있는지 확인
    @Override
    public Customer kakaoFindById(String id) {
    	return customerMapper.findById(id);
    }

}
