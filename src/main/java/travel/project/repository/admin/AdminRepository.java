package travel.project.repository.admin;

import java.util.List;

import travel.project.domain.Customer;

public interface AdminRepository {
	
	List<Customer> allCustomers();
	
	
}
