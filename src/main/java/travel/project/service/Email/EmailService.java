package travel.project.service.Email;


public interface EmailService {
	
	public void sendMail(String emailRecipient, String emailTitle, String emailContent);
}
