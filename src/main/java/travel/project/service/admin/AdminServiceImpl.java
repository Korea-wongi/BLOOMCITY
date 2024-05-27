package travel.project.service.admin;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;
import travel.project.repository.admin.AdminRepository;

@Slf4j
@RequiredArgsConstructor
@Service
public class AdminServiceImpl implements AdminService {

	private final AdminRepository adminRepository;
	
	// 모든 회원정보 보기
	@Override
	public List<Customer> allCustomers() {
		return adminRepository.allCustomers();
	}

}
