package com.file.service;

import java.util.List;

import com.file.beans.UserBean;

public interface UserService {

	
	Long addUser(UserBean userBean);

	List<UserBean> viewUsers();

	boolean updateAppointmentStatus(String userId, String url);


}
