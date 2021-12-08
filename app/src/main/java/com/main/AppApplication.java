package com.main;
import org.springframework.context.ApplicationContext;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import com.controllers.Mail;
import com.service.MailService;
@SpringBootApplication(exclude = HibernateJpaAutoConfiguration.class)
@ComponentScan({"com"})
public class AppApplication {

	public static void main(String[] args) {
		 Mail mail = new Mail();
	        mail.setMailFrom("sriyazhinidevi12@gmail.com");
	        mail.setMailTo("sriyazhinidevim.18cse@kongu.edu");
	        mail.setMailSubject("Spring Boot - Email Example");
	        mail.setMailContent("Learn How to send Email using Spring Boot!!!\n\nThanks\nwww.technicalkeeda.com");
	 
		
		ApplicationContext ctx= SpringApplication.run(AppApplication.class, args);
		 MailService mailService = (MailService) ctx.getBean("mailService");
	        mailService.sendEmail(mail);
	}

}
