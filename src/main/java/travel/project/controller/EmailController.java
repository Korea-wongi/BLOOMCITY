package travel.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.service.Email.EmailService;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/email")
public class EmailController {

	private final EmailService emailService;

	
	// 이메일 보낼때 폼 요청
	@GetMapping
	public String showEmailForm() {
        return "admin/emailForm"; // Assuming you have an emailForm.html template
    }
	
	//이메일 보내기 요청
	@PostMapping("/sendEmail")
    public String sendEmail(@RequestParam("emailRecipient") String recipientEmail,
    						@RequestParam("emailSubject") String emailTitle,
    						@RequestParam("emailContent") String emailContent,
                            RedirectAttributes redirectAttributes) {
		
		// 제대로 나오는지 확인
//		System.out.println(recipientEmail+" "+emailTitle+" "+emailContent);
		
        try {
            emailService.sendMail(recipientEmail, emailTitle, emailContent);
            // 보내기 버튼 옆에 띄워줌
            redirectAttributes.addFlashAttribute("successMessage", "Email sent successfully!");
        } catch (Exception e) {
            log.error("Failed to send email to {}: {}", recipientEmail, e.getMessage());
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to send email. Please try again.");
        }
        return "redirect:/email";
    }
}
