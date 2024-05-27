package travel.project.controller;

import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;
import travel.project.service.customer.CustomerService;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/member")
public class CustomerController {


	private final CustomerService customerService;


	//회원가입시 회원이 입력한 아이디가 DB에 있는지 확인하는 유효성 검사
	@PostMapping("/verificationid")
	@ResponseBody
	public ResponseEntity<String> verificationid(@RequestParam("customerId") String customerId){
	    String result = customerService.verificationId(customerId);
	    return new ResponseEntity<>(result, HttpStatus.OK);
	}
	//회원가입시 회원이 입력한 email값이 DB에 있는지 확인하는 유효성 검사
	@PostMapping("/verificationemail")
	@ResponseBody
	public ResponseEntity<String> verificationEmail(@RequestParam("email") String email){
	    String result = customerService.verificationEmail(email);
	    return new ResponseEntity<>(result, HttpStatus.OK);
	}

	//회원가입시 회원이 입력한 핸드폰번호가 DB에 있는지 확인하는 유효성 검사
	@PostMapping("/verificationphonenumber")
	@ResponseBody
	public ResponseEntity<String> verificationPhoneNumber(@RequestParam("phoneNumber") String phoneNumber){
	    String result = customerService.verificationPhoneNumber(phoneNumber);
	    return new ResponseEntity<>(result, HttpStatus.OK);
	}


	//회원가입 요청처리 메소드
	@PostMapping("/membershipJoin")
	public String membershipJoin(@ModelAttribute("customer") Customer customer,Model model) {
			customerService.membershipJoin(customer);
		return "redirect:/login";
	}


}
