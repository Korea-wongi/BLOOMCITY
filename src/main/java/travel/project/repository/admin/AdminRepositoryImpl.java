package travel.project.repository.admin;

import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;
import travel.project.mapper.AdminMapper;

@Slf4j
@RequiredArgsConstructor
@Repository
public class AdminRepositoryImpl implements AdminRepository {

	private final AdminMapper adminMapper;
	
	// 모든 회원을 조회할 수 있게 customer리턴
	@Override
	public List<Customer> allCustomers() {
		
		return adminMapper.allCustomers();
	}

}
