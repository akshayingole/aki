package com.cognizant.service;

import java.util.ArrayList;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.cognizant.dao.PerformTransactionDAO;
import com.cognizant.entity.TransactionDetails;
import com.cognizant.entity.UserDetails;
import com.cognizant.exception.InvalidAccountBalance;

@Component
public class PerformTransactionService {

	private static final Logger LOG = Logger.getLogger(PerformTransactionService.class);

	@Autowired
	PerformTransactionDAO ptDAO;
	InvalidAccountBalance invalidAccountBalance;

	@Transactional
	public Long updateTransactionDetails(TransactionDetails transaction, Long accountNumber)
			throws InvalidAccountBalance {
		LOG.info("inside service");
		UserDetails user = ptDAO.updateTransactionDetails(accountNumber);

		transaction.setUser(user);

		List<TransactionDetails> transactionList = new ArrayList<TransactionDetails>();
		LOG.info(transaction);
		transactionList.add(transaction);
		user.setTdDetails(transactionList);
		LOG.info(user);
		// updates the balance in user table
		updateUser(transaction.getTransactionAmount(), user, transaction.getTransactionType());
		return user.getAccountBalance();

	}

	public void updateUser(long transactionAmount, UserDetails user, String transactionType)
			throws InvalidAccountBalance {
		long newBalance = 0;

		if (transactionType.equals("DEPOSIT")) {
			newBalance = user.getAccountBalance() + transactionAmount;
			user.setAccountBalance(newBalance);
		}

		else {
			newBalance = user.getAccountBalance() - transactionAmount;

			if (newBalance < 5000 && user.getAccountType().equals("SAVINGS")) {

				throw new InvalidAccountBalance("transactionAmount:Saving Account's Balance can't be less than 5000");

			} else if (newBalance < 0) {

				throw new InvalidAccountBalance("transactionAmount:Insufficient Balance");
			}

			else {

				user.setAccountBalance(newBalance);
			}
		}

	}

	@Transactional
	public List<TransactionDetails> retrieveTransactionDetails(Long accountNumber) {
		List<TransactionDetails> transactionDetails = ptDAO.retrieveTransactionDetails(accountNumber);
		return transactionDetails;

	}

}
