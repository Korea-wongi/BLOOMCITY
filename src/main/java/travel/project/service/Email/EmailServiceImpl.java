package travel.project.service.Email;

import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class EmailServiceImpl implements EmailService {
	
	
	private final JavaMailSender javaMailSender;
	
	@Override
	public void sendMail(String emailRecipient, String emailTitle, String emailContent) {
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				 // MimeMessageHelper 생성
                MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                // 보내는 사람 메일
                helper.setFrom("team.project.adm333@gmail.com");
                
                // 받는 사람 이메일 
                helper.setTo(emailRecipient);
                // 이메일 제목
                helper.setSubject(emailTitle);
                // 메일 내용
                helper.setText(emailContent);

                // 첨부 파일 추가
//                ClassPathResource imageResource = new ClassPathResource("images/test.png");
//                helper.addAttachment("test.png", imageResource);
			}
		};
		
		try {
            // 메일 전송
            javaMailSender.send(preparator);
        } catch (MailException e) {
        	log.error("에러 : {}" , e);
        }
	}

}
