<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

.button1 {
	background-color: white;
	width: 100%;
	color: black;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}
</style>
<title>Apply home Loan</title>
</head>
<body ng-app="myApp">
	<center>
		<h3>Apply home Loan</h3>
	</center>
	<hr>
	<form:form method="POST"
		commandName="/BaseCodeSlice_BankManagementSystem/mvc/applyHomeLoan?accountNumber=${accountNumber}"
		modelAttribute="homeLoan" name="userForm">
		<table>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.loanAmount.$invalid && !userForm.loanAmount.$pristine }">
					<td>Loan Amount :</td>
					<td><form:input path="loanAmount" ng-model="loanAmount"
							required="true" ng-pattern="/^[0-9]+$/" /><span
						ng-show="userForm.loanAmount.$invalid && !userForm.loanAmount.$pristine"
						class="help-block" style="color: red">Please Enter valid
							Amount </span></td>
					<td><form:errors path="loanAmount" cssClass="error"
							style="color:red" /></td>
			</tr>
			<tr>
				
				<td>Loan Apply Date :</td>
				
				<td><div ng-controller="AppCtrl"><form:input path="loanApplyDate" type="date" ng-model="StartDate" name="StartDate" min="{{today}}" />
				<span ng-show="userForm.StartDate.$dirty && myForm.StartDate.$invalid">
    			<span ng-show="userForm.StartDate.$error.required">Start Date is required</span>
    			<span ng-show="userForm.StartDate.$error.min">Start Date should not be less than current date</span></div></td> 
				<td><form:errors path="loanApplyDate" cssClass="error" style="color:red" /></td>
			</tr>
			<tr>
				<td>Duration of the loan :</td>
				<td><form:select path="loanDuration">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
					</form:select></td>
				<td><form:errors path="loanDuration" cssClass="error"
						style="color:red" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.annualIncome.$invalid && !userForm.annualIncome.$pristine }">
					<td>Annual Income :</td>
					<td><form:input path="annualIncome" ng-model="annualIncome"
							required="true" ng-pattern="/^[0-9]+$/" /><span
						ng-show="userForm.annualIncome.$invalid && !userForm.annualIncome.$pristine"
						class="help-block" style="color: red">Please Enter Valid
							Income </span></td>
					<td><form:errors path="annualIncome" cssClass="error"
							style="color:red" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.companyName.$invalid && !userForm.companyName.$pristine }">
					<td>Company Name :</td>
					<td><form:input path="companyName" ng-model="companyName"
							required="true" ng-pattern="/^[ A-za-z]+$/" /><span
						ng-show="userForm.companyName.$invalid && !userForm.companyName.$pristine"
						class="help-block" style="color: red">Please Enter valid
							Company Name</span></td>
					<td><form:errors path="companyName" cssClass="error"
							style="color:red" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.designation.$invalid && !userForm.designation.$pristine }">
					<td>Designation :</td>
					<td><form:input path="designation" ng-model="designation"
							required="true" ng-pattern="/^[ A-za-z]+$/" /><span
						ng-show="userForm.designation.$invalid && !userForm.designation.$pristine"
						class="help-block" style="color: red">Please Enter valid
							Designation</span></td>
					<td><form:errors path="designation" cssClass="error"
							style="color:red" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.totalExperience.$invalid && !userForm.totalExperience.$pristine }">
					<td>Total Exp :</td>
					<td><form:input path="totalExperience"
							ng-model="totalExperience" required="true" type="number"
							ng-pattern="/^[0-9]+$/" /><span
						ng-show="userForm.totalExperience.$invalid && !userForm.totalExperience.$pristine"
						class="help-block" style="color: red">Please Enter valid
							details </span></td>
					<td><form:errors path="totalExperience" cssClass="error"
							style="color:red" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.currentExperience.$invalid && !userForm.currentExperience.$pristine }">
					<td>Exp with Current company :</td>
					<td><form:input path="currentExperience"
							ng-model="currentExperience" required="true" type="number"
							ng-pattern="/^[0-9]+$/" /><span
						ng-show="userForm.currentExperience.$invalid && !userForm.currentExperience.$pristine"
						class="help-block" style="color: red">Please Enter valid
							details </span></td>
					<td><form:errors path="currentExperience" cssClass="error"
							style="color:red" /></td>
			</tr>
		</table>
		<button class="button button1" type="submit" value="Add"
			ng-disabled="userForm.$invalid">Submit</button>
	</form:form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);

		app.controller('AppCtrl', function($scope) {
			$scope.loanAmount = "";
			$scope.loanDuration = "";
			$scope.annualIncome = "";
			$scope.companyName = "";
			$scope.designation = "";
			$scope.totalExperience = "";
			$scope.currentExperience = "";
			
			var today=new Date();
		  	$scope.today = today.toISOString();
		})
		
	</script>
</body>

<script type="text/javascript">
	function validateDate() {
		var mydate = document.getElementById('date').value = Date("yyyy-MM-dd");
		var today = new Date();
		if (myDate < today) {

			document.getElementById('errfn').innerHTML = "date should be greater or equals to todays date";
			return false;
		}
	}
</script>
</html>