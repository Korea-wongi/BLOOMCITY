package travel.project;


import static org.assertj.core.api.Assertions.assertThat;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import travel.project.domain.Customer;
import travel.project.repository.customer.CustomerRepository;

@Transactional
@SpringBootTest(properties = {"spring.config.location=classpath:application-test.yml"})
 class CustomerRepositoryTest {


    @Autowired
    private CustomerRepository customerRepository;


    @Test
    void save(){
        Customer customer = new Customer("jdm2131", "qwer1234", "길동", "test@test.com",
                "01012341234","부산시");
        Customer savedOne = customerRepository.save(customer);
        assertThat(customer.getCustomerId()).isEqualTo(savedOne.getCustomerId());
    }

    @Test
    void verificationId() {
    	String id = "id1";
    	String result = customerRepository.verificationId(id);
    	assertThat(result).isEqualTo("true");
    }

    @Test
    void verificationEmail() {
    	String email = "test1@test.com";
    	String result = customerRepository.verificationEmail(email);
    	assertThat(result).isEqualTo("true");
    }


    @Test
    void verificationPhoneNumber() {
    	String phoneNumber = "01012341235";
    	String result = customerRepository.verificationPhoneNumber(phoneNumber);
    	assertThat(result).isEqualTo("true");
    }


    void findById(){
        String id1 = "id1";
        String id2 = "id2";
        Optional<Customer> customer1 = customerRepository.findById(id1);
        Optional<Customer> customer2 = customerRepository.findById(id2);
        Map<String, Customer> map = new LinkedHashMap<>();
        if(customer1.isPresent()){
            map.put("홍길동", customer1.get());
        }else{
            throw new RuntimeException("customer not found");
        }
        if(customer2.isPresent()){
            map.put("김첨지", customer1.get());
        }else{
            throw new RuntimeException("customer not found");
        }
        assertThat(map.size()).isEqualTo(2);

    }

    @Test
    void updateCustomer(){
        // id가 id1인 회원 조회후
        Optional<Customer> customer1 = customerRepository.findById("id1");
        Customer changeCustomer = new Customer("id1", "qwer1234", "홍길동1", "change@test.com", "01023452345", "서울시");
        if(customer1.isPresent()){
            // db업데이트
                customerRepository.updateCustomer(changeCustomer);
            // customer1 도 변경 후로 다시 update
            customer1 = customerRepository.findById("id1");
            assertThat(customer1.get().getName()).isEqualTo(changeCustomer.getName());
            assertThat(customer1.get().getEmail()).isEqualTo(changeCustomer.getEmail());
            assertThat(customer1.get().getPhoneNumber()).isEqualTo(changeCustomer.getPhoneNumber());
            assertThat(customer1.get().getAddress()).isEqualTo(changeCustomer.getAddress());
        }

    }

}
