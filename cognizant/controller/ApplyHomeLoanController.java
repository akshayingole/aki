package com.cognizant.controller;

import java.util.Iterator;
import java.util.Set;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cognizant.entity.HomeLoan;
import com.cognizant.exception.HomeLoanEligibility;
import com.cognizant.service.ApplyHomeLoanService;

@Controller
public class ApplyHomeLoanController {
	@Autowired
	ApplyHomeLoanService applyHomeLoanService;

	private static final Logger LOG = Logger.getLogger(ApplyHomeLoanController.class);

	@RequestMapping(value = "/applyHomeLoan", method = RequestMethod.GET)
	public String getHOmeLoan(Model model,@RequestParam("accountNumber") Long accountNumber) {
		
		model.addAttribute("homeLoan", new HomeLoan());
		return "applyHomeLoan";
	}

	@RequestMapping(value = "/applyHomeLoan", method = RequestMethod.POST)
	public String initiateHomeLoan(@ModelAttribute("homeLoan") @Valid HomeLoan homeLoan, BindingResult result,
			Model model,@RequestParam("accountNumber") Long accountNumber) {
		long loanAccNum = applyHomeLoanService.generateLoanAccNumber();
		String id = applyHomeLoanService.generateRandomNumber(accountNumber);
		homeLoan.setLoanAccountNumber(loanAccNum);
		homeLoan.setHomeLoanId(id);
		LOG.info(homeLoan);

		try {
			applyHomeLoanService.updateHomeLoanDetails(accountNumber, homeLoan);
		} catch (ConstraintViolationException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			Set<ConstraintViolation<?>> constraintViolations = e.getConstraintViolations();
			Iterator<ConstraintViolation<?>> iterator = constraintViolations.iterator();
			while (iterator.hasNext()) {
				ConstraintViolation<?> next = iterator.next();
				LOG.info("Validation message: " + next.getMessage());
				LOG.info("Invalid field: " + next.getPropertyPath());
				LOG.info("Validation class/bean: " + next.getRootBean());
				// result.reject(next.getPropertyPath(), next.getMessage());
				result.rejectValue(next.getPropertyPath().toString(), "", next.getMessage());
				// result.rejectValue(arg0, arg1, arg2);
			}
		} catch (HomeLoanEligibility e) {
			String s[]=e.getMessage().split(":");
			result.rejectValue(s[0].toString(),"",s[1].toString());
			return "applyHomeLoan";
		}
		catch(Exception e){
			e.printStackTrace();
		}
		model.addAttribute("m1", homeLoan.getLoanAccountNumber());
		model.addAttribute("m2", homeLoan.getHomeLoanId());

		if (result.hasErrors()) {
			return "applyHomeLoan";
		}
		return "successHomeLoan";

	}
}
