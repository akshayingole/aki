package com.cognizant.service;

import java.util.List;

import java.util.Random;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.cognizant.dao.ApplyHomeLoanDao;
import com.cognizant.entity.HomeLoan;
import com.cognizant.entity.UserDetails;
import com.cognizant.exception.HomeLoanEligibility;

@Component
@Transactional
public class ApplyHomeLoanService {
	@Autowired
	ApplyHomeLoanDao applyHomeLoanDao;

	private static final Logger LOG = Logger.getLogger(ApplyHomeLoanService.class);

	Random random = new Random();
	UserDetails userDetails = new UserDetails();
	ApplyHomeLoanService applyHomeLoanService;

	public void insertHomeDetails(UserDetails userDetails) {

		applyHomeLoanDao.insertHomeDetails(userDetails);

	}

	public String generateRandomNumber(long accoNum) {

		String a = String.valueOf(accoNum).substring(13);
		String id = "HL-" + a;
		return id;
	}

	public long generateLoanAccNumber() {
		Long num = (long) (Math.random() * 100000000000000L);
		return num;
	}

	public void updateHomeLoanDetails(long l, HomeLoan e6) {
		checkLoanDuration(e6);
		if (checkIfEligible(e6))
			userDetails = applyHomeLoanDao.updateHomeLoanDetails(l);
		LOG.info("again");

		List<HomeLoan> list = userDetails.getHomeLoan();

		e6.setUser(userDetails);

		list.add(e6);
		userDetails.setHomeLoan(list);
		LOG.info(userDetails);

	}

	private void checkLoanDuration(HomeLoan e6) {
		if(!(e6.getLoanDuration()==5 || e6.getLoanDuration()==10 ||e6.getLoanDuration()==15 ||e6.getLoanDuration()==20 )){
			throw new HomeLoanEligibility("annualIncome:Loan duration must be 5 or 10 or 15 or 20 !!!!!");
		}
		
	}

	private boolean checkIfEligible(HomeLoan e6) {
		boolean flag = true;
		if (e6.getAnnualIncome() <= e6.getLoanAmount() * .10) {
			flag = false;
			throw new HomeLoanEligibility("annualIncome:Income must be greater than 10 percent of the loan amount");

		}
		return flag;
	}

}
