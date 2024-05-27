package travel.project.service.customer;

import java.util.Optional;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;
import travel.project.repository.customer.CustomerRepository;

@Slf4j
@AllArgsConstructor
@Service
public class CustomerServiceImpl implements CustomerService{

    private final CustomerRepository customerRepository;


    @Override
    public Optional<Customer> findById(String id) {
        return customerRepository.findById(id);
    }

    @Override
    public void update(Customer customer) {
        customerRepository.updateCustomer(customer);
    }


  //회원가입시 아이디 중복검사
  	@Override
  	public String verificationId(String customerId) {
  		return customerRepository.verificationId(customerId);
  	}

  	//회원가입시 이메일 중복검사
  	@Override
  	public String verificationEmail(String email) {
  		return  customerRepository.verificationEmail(email);
  	}

  	//회원가입시 전화번호 중복검사
  	@Override
  	public String verificationPhoneNumber(String phoneNumber) {
  		return customerRepository.verificationPhoneNumber(phoneNumber);
  	}

  	//회원가입 요청
  	@Override
  	public void membershipJoin(Customer customer) {
  		customerRepository.save(customer);
  	}

  	//카카오 로그인 요청
  	@Override
  	public Customer kakaologin(String customerId, String name, String email) {
  		return customerRepository.kakaologin(customerId,name,email);
  	}
  	@Override
  	public void kakaoUpdate(Customer customer) {
  		 customerRepository.kakaoUpdate(customer);
  	}

  	@Override
  	public Customer kakaoFindById(String id) {
  		return customerRepository.kakaoFindById(id);
  	}
}
