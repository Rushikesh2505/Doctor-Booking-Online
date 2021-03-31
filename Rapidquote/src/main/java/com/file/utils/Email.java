package com.file.utils;

import com.file.configuration.HibernateConfig;

public class Email {

	public static void sendEmail(String toEmailAddr, String emailSubject, String emailBody) {
		SendMail sendMail = new SendMail();
		sendMail.sendEmail(HibernateConfig.getEmail_user(), HibernateConfig.getEmail_password(), toEmailAddr,
				emailSubject, emailBody);
	}

}
