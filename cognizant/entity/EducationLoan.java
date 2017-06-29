package com.cognizant.entity;

import java.util.Date;


import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "EDUCATION_LOAN_DETAILS")
public class EducationLoan {

	@Column(name = "EDUCATION_LOAN_ID")
	private String educationLoanID;

	@Id
	@Column(name = "Edu_Loan_Account_Number")
	private Long eduLoanAccountNumber;

	@NotNull(message = "Mandatory field")
	@Column(name = "Edu_Loan_Amount")
	@Min(1)
	private Double eduLoanAmount;

	@NotNull(message = "Mandatory field")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "Loan_Apply_Date")
	private Date loanApplyDate;

	@NotNull(message = "Mandatory field")
	@Column(name = "Edu_Loan_Duration")
	private Integer eduLoanDuration;

	@Column(name = "Father_Annual_Income")
	@Min(1)
	private Double fatherAnnualIncome;

	@NotNull
	@Min(1)
	@Max(2000000)
	@Column(name = "Course_Fee")
	private Double courseFee;

	@NotEmpty(message = "Mandatory field")
	@Column(name = "Course_Name")
	private String courseName;

	@NotNull(message = "Mandatory field")
	@Pattern(regexp="[a-zA-Z ]+$",message="Father's name can contain only alphabets and whitespaces")
	@Column(name = "Father_Name")
	private String fatherName;
	
	@NotNull(message = "Mandatory field")
	@Range(min=10000,max=9999999999999999l)
	@Column(name = "ID_Card_Number")
	private Long idCardNumber;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinColumn(name = "Account_Number")
	private UserDetails user;

	public EducationLoan() {

	}

	/*
	 * @Override public String toString() { return
	 * "EducationLoan [educationLoanID=" + educationLoanID +
	 * ", eduLoanAccountNumber=" + eduLoanAccountNumber + ", eduLoanAmount=" +
	 * eduLoanAmount + ", loanApplyDate=" + loanApplyDate + ", eduLoanDuration="
	 * + eduLoanDuration + ", fatherAnnualIncome=" + fatherAnnualIncome +
	 * ", courseFee=" + courseFee + ", courseName=" + courseName +
	 * ", fatherName=" + fatherName + ", idCardNumber=" + idCardNumber +
	 * ", user=" + user + "]"; }
	 */

	public EducationLoan(double eduLoanAmount, Date loanApplyDate, Integer eduLoanDuration, Double fatherAnnualIncome,
			Double courseFee, String courseName, String fatherName, Long idCardNumber, UserDetails user) {
		super();

		// this.eduLoanAccountNumber = eduLoanAccountNumber;
		this.eduLoanAmount = eduLoanAmount;
		this.loanApplyDate = loanApplyDate;
		this.eduLoanDuration = eduLoanDuration;
		this.fatherAnnualIncome = fatherAnnualIncome;
		this.courseFee = courseFee;
		this.courseName = courseName;
		this.fatherName = fatherName;
		this.idCardNumber = idCardNumber;
		this.user = user;
	}

	public String getEducationLoanID() {
		return educationLoanID;
	}

	public void setEducationLoanID(String educationLoanID) {
		this.educationLoanID = educationLoanID;
	}

	public Long getEduLoanAccountNumber() {
		return eduLoanAccountNumber;
	}

	public void setEduLoanAccountNumber(Long eduLoanAccountNumber) {
		this.eduLoanAccountNumber = eduLoanAccountNumber;
	}

	public Double getEduLoanAmount() {
		return eduLoanAmount;
	}

	public void setEduLoanAmount(Double eduLoanAmount) {
		this.eduLoanAmount = eduLoanAmount;
	}

	public Date getLoanApplyDate() {
		return loanApplyDate;
	}

	public void setLoanApplyDate(Date loanApplyDate) {
		this.loanApplyDate = loanApplyDate;
	}

	public Integer getEduLoanDuration() {
		return eduLoanDuration;
	}

	public void setEduLoanDuration(Integer eduLoanDuration) {
		this.eduLoanDuration = eduLoanDuration;
	}

	public Double getFatherAnnualIncome() {
		return fatherAnnualIncome;
	}

	public void setFatherAnnualIncome(Double fatherAnnualIncome) {
		this.fatherAnnualIncome = fatherAnnualIncome;
	}

	public Double getCourseFee() {
		return courseFee;
	}

	public void setCourseFee(Double courseFee) {
		this.courseFee = courseFee;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	public Long getIdCardNumber() {
		return idCardNumber;
	}

	public void setIdCardNumber(Long idCardNumber) {
		this.idCardNumber = idCardNumber;
	}

	public UserDetails getUser() {
		return user;
	}

	public void setUser(UserDetails user) {
		this.user = user;
	}
}
