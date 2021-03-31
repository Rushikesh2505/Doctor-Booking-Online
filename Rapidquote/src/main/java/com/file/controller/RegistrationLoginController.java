package com.file.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.file.beans.UserBean;
import com.file.service.UserService;

@Controller
public class RegistrationLoginController {


	@Autowired
	UserService userService;

	@Autowired
	private MessageSource messages;

	@Autowired
	private ApplicationEventPublisher eventPublisher;

	private final Logger LOGGER = Logger.getLogger(getClass());
	/**
	 * @param Materiabean This method adds a MATERIAL in MATERIAL Table
	 */
	@RequestMapping(value = "/user/register", method = RequestMethod.POST)
	public @ResponseBody String addMaterial(HttpServletRequest request, @ModelAttribute("userBean") UserBean userBean) {

		String directory = request.getServletContext().getAttribute("FILESIMG_DIR") + File.separator;
		//String path = directory + orderNo + ".pdf";
		if (userBean.getReport() != null) {

			File file = new File(directory +Math.random()+ userBean.getReport().getOriginalFilename());
	String sss=file.getName();
			if (file.exists()) {
				return "reportFaild";
			} else
				try {

					IOUtils.copy(userBean.getReport().getInputStream(), new FileOutputStream(file));

				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			userBean.setImageFile(userBean.getReport().getOriginalFilename());
		}
		if (userService.addUser(userBean) != null)
			return "saved";
		else
			return "failed";
	}

	 private String getAppUrl(HttpServletRequest request) {
		return "http://" + request.getServerName() + request.getContextPath();
	}

	
}
