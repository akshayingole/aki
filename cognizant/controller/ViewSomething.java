package com.cognizant.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cognizant.dao.PerformTransactionDAO;
import com.cognizant.dao.RetrieveDAO;
import com.cognizant.entity.TransactionDetails;



@Controller
public class ViewSomething {
	@Autowired
	RetrieveDAO dao;
	private static final Logger LOG = Logger.getLogger(ViewSomething.class);
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model, @RequestParam("accountNumber") Long accountNumber,@RequestParam("loanAccountNumber") Long loanAccountNumber) {

		// model.addAttribute("accountNumber",accountNumber);
		model.addAttribute("accountNumber",accountNumber);
		model.addAttribute("loanAaccountNumber",loanAccountNumber);

		return "view";
	}
	
	@RequestMapping(value = "/viewDetails", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<TransactionDetails> getDetails(@RequestParam("accountNumber") Long accountNumber,@RequestParam Long loanAccountNumber ) {

		List<TransactionDetails> transactionDetailsList = dao.retrieveDetails(accountNumber,loanAccountNumber);

		LOG.info("controller:" + transactionDetailsList);
		return transactionDetailsList;

	}
}
