package com.cognizant.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.cognizant.entity.TransactionDetails;
import com.cognizant.entity.UserDetails;

@Component
public class RetrieveDAO {
	@PersistenceContext
	private EntityManager em;
	
	public List<TransactionDetails> retrieveDetails(Long accountNumber, Long loanAccountNumber) {
		UserDetails user = em.find(UserDetails.class, accountNumber);
		
		List<TransactionDetails> transaction = user.getTdDetails();
		
		return transaction;
		
	}

}
