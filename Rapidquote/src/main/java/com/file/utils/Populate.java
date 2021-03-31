package com.file.utils;

import java.util.ArrayList;
import java.util.List;

import com.file.beans.UserBean;
import com.file.entities.User;

/**
 * @author pooja.gaikwad
 *
 */
public class Populate {



	public static User poulateUserBeanToUser(UserBean userBean) {
		User user = new User();
		user.setFirstName(userBean.getFirstName());
		user.setAge(userBean.getAge());
		user.setContactEmail(userBean.getContactEmail());
		user.setContactNumber(Long.valueOf(userBean.getContactNumber()));
		user.setAddress(userBean.getAddress());
		user.setBooking(userBean.getBooking());
user.setBirthdate(userBean.getBirthdate());
		
		
		return user;
	}

	public static List<UserBean> poulateListUserToListUserBean(List<User> users) {
		List<UserBean> userBeans = new ArrayList<>();
		for (User user : users) {
			UserBean userBean = new UserBean();
			userBean.setFirstName(user.getFirstName());
			userBean.setAge(user.getAge());
			userBean.setContactEmail(user.getContactEmail());
			userBean.setContactNumber(String.valueOf(user.getContactNumber()));
			userBean.setAddress(user.getAddress());
			userBean.setUserId(String.valueOf(user.getUserId()));
			userBean.setBirthdate(String.valueOf(user.getBirthdate()));
			userBean.setBooking(user.getBooking());
			userBeans.add(userBean);
		}
		return userBeans;
	}

	
}
