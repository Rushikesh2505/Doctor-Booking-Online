package com.file.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.file.beans.SupplierBean;
import com.file.service.SupplierService;

@Controller
@Scope("session")
@RequestMapping("/admin")

public class AdminController {

	@Autowired
	private Environment environment;

	private static final Logger logger = Logger.getLogger(AdminController.class);

	@Autowired
	SupplierService supplierService;
	
	
	@RequestMapping(value = "/")
	public ModelAndView home(HttpSession session, HttpServletRequest request) {

		logger.debug("Rendering Home Page for Admin");

		String action = null;
		ModelAndView model = new ModelAndView();
		String contactEmail=environment.getRequiredProperty("supplier_Email");

		try {
			logger.info("Validaiting the Admin From Technisure");
			/*
			 * action =
			 * LicenceCheck.callWebServiceAdmin(environment.getRequiredProperty("guid"),
			 * environment.getRequiredProperty("uri_path"));
			 */
			SupplierBean supplierBean = supplierService.checkSupplier(contactEmail);	
			action = "NotExpired";
			if (action.equals("Expired")) {
				model.setViewName("expiry");
				logger.info("Validated. Status : Licence Expired");
				return model;
			} else {
				if (!(request.getParameter("lang") == "null")) {
					model.addObject("language", request.getParameter("lang"));
					session.setAttribute("language", request.getParameter("lang"));
				} else {
					session.setAttribute("language", session.getAttribute("language"));
				}
				if (action.equals("unset")) {
					model.addObject("status", "unset");
				} else {
					model.addObject("status", "set");
				}
				logger.info("Validated. Status : Licence Not Expired");
				model.setViewName("admin");
				logger.info("Home Page rendered");
				return model;
			}

		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Exception : " + e);
			model.setViewName("error");
			return model;

		}

	}

	@RequestMapping(value = "/setauthenticate", method = RequestMethod.GET)
	public @ResponseBody String adminSetLogin(HttpSession session, HttpServletRequest request,
			@RequestParam("username") String username, @RequestParam("password") String password) {
		logger.debug("Authenticating Admin");
		logger.info("username : " + username);
		logger.info("password : " + password);
		String contactEmail=environment.getRequiredProperty("supplier_Email");
		/*	SupplierBean supplierBean = LicenceCheck.setAdminWebServiceCall(environment.getProperty("guid"), username,
					password, environment.getRequiredProperty("uri_path"));*/
			SupplierBean supplierBean = supplierService.checkSupplier(contactEmail);
		if (supplierBean != null) {
			session.setAttribute("admin", supplierBean);
			session.setAttribute("adminId", "Admin");
			logger.info("Authenticated. Status : Admin Signed in");
			return "Admin";
		}
		logger.info("Authenticated. Status : Failed");
		return "Error";
	}

	@RequestMapping(value = "/authenticate", method = RequestMethod.GET)
	public @ResponseBody String adminLogin(HttpSession session, HttpServletRequest request,
			@RequestParam("username") String username, @RequestParam("password") String password) {
		logger.debug("Authenticating Admin");
		logger.info("username : " + username);
		logger.info("password : " + password);
		String contactEmail=environment.getRequiredProperty("supplier_Email");
		/*
		 * SupplierBean supplierBean =
		 * LicenceCheck.authenticateAdminWebServiceCall(environment.getProperty("guid"),
		 * username, password, environment.getRequiredProperty("uri_path"));
		 */
		SupplierBean supplierBean = supplierService.checkSupplier(contactEmail);	
		String pass=supplierBean.getPassword();
		String usernam=supplierBean.getContactEmail();
		if(pass.equals(password)&& usernam.equalsIgnoreCase(username )) {
			if (supplierBean != null) {
				session.setAttribute("admin", supplierBean);
				session.setAttribute("adminId", "Admin");
				logger.info("Authenticated. Status : Admin Signed in");
				return "Success";
			}
		}else {
			return "Error";
		}
		
		//logger.info("Authenticated. Status : Failed");
		return "Error";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView adminLogOut(HttpSession session, HttpServletRequest request) {
		session.invalidate();
		return new ModelAndView("admin");
	}
	
	
	

}
