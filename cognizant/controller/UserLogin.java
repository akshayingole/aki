package com.cognizant.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cognizant.entity.UserDetails;
import com.cognizant.service.UserLoginService;

@Controller
public class UserLogin {
	@Autowired
	UserLoginService service;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String loginUser(Model model, @RequestParam("accountNumber") Long accountNumber) {
		
		model.addAttribute("accountNumber", accountNumber);
		if(service.checkAccountNumber(accountNumber)){
			return "home";
		}
		else{
			model.addAttribute("message","account number not found");
			return "loginFailed";
		}
	}

	@RequestMapping(value = "/homepage", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody List<UserDetails> getList(Model model, @RequestParam("accountNumber") String msg) {
		// String accNum=request.getParameter("AccNo");
		// System.out.println(" AccNo=" + AccNo);

		long accountNumber = Long.parseLong(msg);

		UserDetails userDetails = service.validateUser(accountNumber);

		List<UserDetails> list = new ArrayList<UserDetails>();
		userDetails.setEduLoan(null);
		userDetails.setTdDetails(null);
		userDetails.setHomeLoan(null);
		list.add(userDetails);
		// System.out.println(userDetails.getAcountHolderName());
		model.addAttribute("userName", userDetails.getAcountHolderName());
		return list;

	}

}
