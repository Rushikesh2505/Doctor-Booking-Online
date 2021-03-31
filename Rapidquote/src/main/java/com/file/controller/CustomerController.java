package com.file.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.file.beans.UserBean;
import com.file.service.UserService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	UserService userService;
	


	
	private String getAppUrl(HttpServletRequest request) {
		return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	}

	@RequestMapping(value = "/viewCustomers", method = RequestMethod.GET)
	public ModelAndView viewUsers(ModelMap model) {
		ModelAndView modelAndView = new ModelAndView("viewPetiont");
		List<UserBean> beans = userService.viewUsers();
		model.addAttribute("list", beans);
		return modelAndView;
	}

	
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public @ResponseBody String updateStatus(HttpServletRequest request,
			@RequestParam(value = "userId", required = false) String userId)
	{
		userService.updateAppointmentStatus(userId,getAppUrl(request));
		System.out.println("UserID : " + userId);
		return "success";

	}

	
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public ModelAndView error() {
		return new ModelAndView("error");
	}

}
