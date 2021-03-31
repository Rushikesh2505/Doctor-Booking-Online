package com.file.serviceImpl;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.file.beans.UserBean;
import com.file.dao.GenericDao;
import com.file.entities.User;
import com.file.service.UserService;
import com.file.utils.Email;
import com.file.utils.EmailTemplate;
import com.file.utils.Populate;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	GenericDao genericDao;



	/** The df 2. */
	private static DecimalFormat df2 = new DecimalFormat(".##");

	public static final String TOKEN_INVALID = "invalidToken";
	public static final String TOKEN_EXPIRED = "expired";
	public static final String TOKEN_VALID = "valid";


	@Override
	public Long addUser(UserBean userBean) {
		User user = Populate.poulateUserBeanToUser(userBean);
		Long id = null;
		if (genericDao.findMaxCountByColumn(User.class, "userId") != null) {
			id = (Long) genericDao.findMaxCountByColumn(User.class, "userId") + 1;
		} else {
			id = (long) 1;
		}

		Long userId = genericDao.addEntity(user);

		return userId;
	}

	
	@Override
	public List<UserBean> viewUsers() {
		List<User> users = genericDao.findAll(User.class);
		List<UserBean> userBeans = Populate.poulateListUserToListUserBean(users);
		return userBeans;
	}


	@Override
	public boolean updateAppointmentStatus(String userId, String url) {
User user = (User) genericDao.findEntityById(User.class, Long.parseLong(userId));
	
	
		String reason=" Hello"+user.getFirstName()+" "
				+ " your appointment is Confirmed." 
				+"on Date :"+user.getBooking();
		
			
		
				String msg = EmailTemplate.createAppointmentConfirmationEmailToCustomer(user,reason, url);
				Email.sendEmail(user.getContactEmail(), "Appointment Confirmation", msg);


		return true;
	}

}
