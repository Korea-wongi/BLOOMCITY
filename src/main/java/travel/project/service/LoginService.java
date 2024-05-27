package travel.project.service;


import jakarta.servlet.http.HttpSession;
import travel.project.domain.Customer;

import java.util.Optional;

public interface LoginService {

    Optional<Customer> login(String customerId, String password);

    public Customer naverLogin(String code, HttpSession session);
    public void naverJoin(Customer customer);
}
