package com.cognizant.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import com.cognizant.dao.UserLoginDAO;
import com.cognizant.entity.UserDetails;
@Component
public class UserLoginService {
	@Autowired
	UserLoginDAO user;
	
	public UserDetails validateUser(long accountNumber) {
		UserDetails userDetails=user.validateUser(accountNumber);
		return userDetails;
	}
	@Primary
	public boolean checkAccountNumber(Long accountNumber) {
		return user.checkAccountNumber(accountNumber);
		
	}

}
