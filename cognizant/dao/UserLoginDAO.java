package com.cognizant.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.cognizant.entity.UserDetails;

@Component
public class UserLoginDAO {
	@PersistenceContext
	private EntityManager em;

	public UserDetails validateUser(long accountNumber) {
		UserDetails user = em.find(UserDetails.class, accountNumber);

		return user;

	}

	public boolean checkAccountNumber(Long accountNumber) {
		UserDetails user = em.find(UserDetails.class, accountNumber);
		if (user == null) {
			return false;
		} else
			return true;
	}

}
