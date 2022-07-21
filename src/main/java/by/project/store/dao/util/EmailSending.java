package by.project.store.dao.util;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailSending {

	private static final String ROOT_PATH = "src\\main\\webapp\\resources\\mail\\";
	
	private JavaMailSender mailSender;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void sendMail(List<String> to, final String subject, final String path) {
	
		try {
			MimeMessage message = mailSender.createMimeMessage();

			MimeMessageHelper helper = new MimeMessageHelper(message, true);
 			helper.setTo(to.toArray(new String[(to.size())]));
			helper.setSubject(subject);
 
			FileSystemResource file = new FileSystemResource(new File(ROOT_PATH.concat(path)));

			helper.addInline("em.html", file);

			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
