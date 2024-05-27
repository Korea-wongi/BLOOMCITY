package travel.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Customer;

@Slf4j
@RequiredArgsConstructor
@Controller
public class MainController {


	String main = "main/main";


	@RequestMapping("/")
	public String home() {
		log.info("home controller");
		return main;
	}

	@GetMapping("/reservation")
	public String res(Model model){
		model.addAttribute("center", "../reservation.jsp");
		return "main/main";
	}

	@GetMapping("/aboutus")
	public String aboutus(Model model){
		model.addAttribute("center", "aboutus.jsp");
		return main;
	}


	@GetMapping("/member")
	public String join(Model model) {
		model.addAttribute("customer", new Customer());
		model.addAttribute("center", "../member/MembershipJoin.jsp");
		return main;
	}



}
