package com.file.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;

import com.file.entities.User;

public class EmailTemplate {
	
	/** The environment. */
	@Autowired
	private Environment environment;
	
	
	
	/** The email username. */
	private static String email_username;
	

	String contactEmail=environment.getRequiredProperty("email_username");
	

	String email_password=environment.getRequiredProperty("email_password");

	public static String createAppointmentConfirmationEmailToCustomer(User user, String reason, String url) {
		String header = "<!DOCTYPE html>\r\n" + "<html><body>\r\n" + "<h1><strong>Appointment Confirmation Mail</strong></h1><hr>";

		String body = "<label>Hello," + " " + user.getFirstName() + "</label>\r\n"
				+ "<p>&nbsp;&nbsp;&nbsp;&nbsp;\r\n"
				+ "  Your Apointment on date :"+ user.getBooking() +" has been confirmed.<br>\r\n"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;\r\n"
				+ "Please send us any questions regarding to Appointment or feedback revert back to mail"
				
				+ "</p>"
				+ "</body></html>";

		String message = header + body;
		return message;
	}

}
