package com.file.listener;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.file.entities.User;
import com.file.event.OnRegistrationCompleteEvent;
import com.file.service.UserService;
import com.file.utils.Email;
import com.file.utils.EmailTemplate;

@Component
public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {
	@Autowired
	private UserService userService;

	@Override
	public void onApplicationEvent(OnRegistrationCompleteEvent event) {
		// TODO Auto-generated method stub
		
	}

	
	/*
	 * private final SimpleMailMessage constructEmailMessage(final
	 * OnRegistrationCompleteEvent event, final User user, final String token) {
	 * final String recipientAddress = user.getContactEmail(); final String subject
	 * = "Registration Confirmation"; final String confirmationUrl =
	 * event.getAppUrl() + "/registrationConfirm.html?token=" + token; final String
	 * message = messages.getMessage("message.regSucc", null, event.getLocale());
	 * final SimpleMailMessage email = new SimpleMailMessage();
	 * email.setTo(recipientAddress); email.setSubject(subject);
	 * email.setText(message + " \r\n" + confirmationUrl);
	 * email.setFrom(env.getProperty("support.email")); return email; }
	 */

}
