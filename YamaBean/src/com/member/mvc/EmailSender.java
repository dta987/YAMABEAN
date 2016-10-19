package com.member.mvc;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import com.member.dto.Email;

@Component
public class EmailSender {

	@Autowired
	protected JavaMailSender mailSender;

	public void SendEmail(Email email) throws Exception {
		
		System.out.println("¿©±â ±îÁö¿È");
		
		System.out.println(email.toString());

		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(email.getSubject());
		msg.setText(email.getContent());
		msg.setRecipient(RecipientType.TO,
				new InternetAddress(email.getReciver()));

		mailSender.send(msg);
	}

}
