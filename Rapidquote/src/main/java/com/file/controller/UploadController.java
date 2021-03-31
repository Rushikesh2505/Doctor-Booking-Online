package com.file.controller;

import java.text.DecimalFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.file.beans.SupplierBean;
import com.file.service.SupplierService;
import com.file.service.UploadService;
import com.file.service.UserService;

@Controller
@Scope("session")
public class UploadController {

	@Autowired
	ServletContext servletContext;

	@Autowired
	private UploadService uploadService;

	
	

	/** The user service. */
	@Autowired
	private UserService userService;



	
	
	@Autowired
	HttpSession httpSession;

	@Autowired
	private Environment environment;

	@Autowired
	SupplierService supplierService;

	private String demo;

	private static final Logger logger = Logger.getLogger(UploadController.class);

	

	private static DecimalFormat df2 = new DecimalFormat(".##");

	/**
	 * @param session
	 * @param request
	 * @return view "uploadFile"
	 */
	@RequestMapping(value = "/")
	public ModelAndView home(HttpSession session, HttpServletRequest request) {
		this.demo = "";
		String action = null;
		ModelAndView model = new ModelAndView();
		String contactEmail = environment.getRequiredProperty("supplier_Email");

		try {

			/*
			 * SupplierBean supplierBean =
			 * LicenceCheck.callWebServiceCustomer(environment.getRequiredProperty("guid"),
			 * environment.getRequiredProperty("uri_path")); action =
			 * supplierBean.getExpiryStatus();
			 */

			SupplierBean supplierBean = supplierService.checkSupplier(contactEmail);
			action = "NotExpired";
			if (action.equals("Expired")) {
				model.setViewName("expiry");
				logger.info("INFO : Licence Expired");
				return model;
			} else if (action.equals("NotExpired")) {
				if (!(request.getParameter("lang") == "null")) {
					model.addObject("language", request.getParameter("lang"));
					session.setAttribute("language", request.getParameter("lang"));
				} else {
					session.setAttribute("language", session.getAttribute("language"));
				}
				logger.info("INFO : Licence Not Expired");
				session.setAttribute("supplierBean", supplierBean);
				model.setViewName("uploadFile");
				logger.debug("Rendering home page.");
				return model;

			}
		} catch (Exception e) {
			e.printStackTrace();
			model.setViewName("error");
			return model;

		}
		return model;
	}

	
}