package travel.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import travel.project.domain.Customer;

@Mapper
public interface AdminMapper {
	
	// 모든 회원정보 보이기
	List<Customer> allCustomers();
}
