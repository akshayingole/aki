<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<title>Apply Education Loan</title>
<STYLE>
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
</STYLE>
</head>
<body ng-app="myApp">
	<center>
		<h3>Apply Education Loan</h3>
	</center>
	<hr>
	<form:form method="POST"
		commandName="/BaseCodeSlice_BankManagementSystem/mvc/insertEducationLoan?accountNumber=${accountNumber}"
		modelAttribute="educationLoan" name="userForm">
		<table>



			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.eduLoanAmount.$invalid && !userForm.eduLoanAmount.$pristine }">
				<td>Loan Amount</td>
				<td><form:input path="eduLoanAmount" ng-model="eduLoanAmount"
						required="true" ng-pattern="/^[0-9]+$/" /><span
					ng-show="userForm.eduLoanAmount.$invalid && !userForm.eduLoanAmount.$pristine"
					class="help-block" style="color: red">Please Enter valid
						Amount </span></td>
				</td>
				<td><form:errors path="eduLoanAmount" cssClass="error"
						style="color:red" /></td>
			</tr>

			<tr>
				<td>Loan Apply Date</td>
				<td><form:input path="loanApplyDate" id="date"
						placeholder="yyyy-MM-dd" /></td>
				<td><form:errors path="loanApplyDate" cssClass="error"
						style="color:red" /></td>
			</tr>

			<tr>
				<td>Loan Duration</td>
				<td><form:select path="eduLoanDuration">
						<option value="5">5</option>
						<option value="10">10</option>
					</form:select></td>
				<td><form:errors path="eduLoanDuration" cssClass="error"
						style="color:red" /></td>
			</tr>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.courseName.$invalid && !userForm.courseName.$pristine }">
				<td>Course name</td>
				<td><form:input path="courseName" ng-model="courseName"
						required="true" ng-pattern="/^[A-za-z]+$/" /> <span
					ng-show="userForm.courseName.$invalid && !userForm.courseName.$pristine"
					class="help-block" style="color: red">Please Enter valid
						Course Name </span></td>
				</td>
				<td><form:errors path="courseName" cssClass="error"
						style="color:red" /></td>
			</tr>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.courseFee.$invalid && !userForm.courseFee.$pristine }">
				<td>Course Fee</td>
				<td><form:input type="number" path="courseFee"
						ng-model="courseFee" required="true" ng-pattern="/^[0-9]+$/" /><span
					ng-show="userForm.courseFee.$invalid && !userForm.courseFee.$pristine"
					class="help-block" style="color: red">Please Enter valid
						Course Fee </span></td>
				</td>
				<td><form:errors path="courseFee" cssClass="error"
						style="color:red" /></td>
			</tr>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.fatherName.$invalid && !userForm.fatherName.$pristine }">
				<td>Father Name</td>
				<td><form:input path="fatherName" ng-model="fatherName"
						required="true" ng-pattern="/^[ a-zA-Z]+$/" /><span
					ng-show="userForm.fatherName.$invalid && !userForm.fatherName.$pristine"
					class="help-block" style="color: red">Please Enter a valid
						Father Name </span></td>
				</td>
				<td><form:errors path="fatherName" cssClass="error"
						style="color:red" /></td>
			</tr>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.idCardNumber.$invalid && !userForm.idCardNumber.$pristine }">
				<td>ID Number</td>
				<td><form:input path="idCardNumber" ng-model="idCardNumber"
						required="true" ng-pattern="/^[0-9]+$/" /> <span
					ng-show="userForm.idCardNumber.$invalid && !userForm.idCardNumber.$pristine"
					class="help-block" style="color: red">Please Enter Valid Id
						Card number </span></td>
				<td><form:errors path="idCardNumber" cssClass="error"
						style="color:red" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.fatherAnnualIncome.$invalid && !userForm.fatherAnnualIncome.$pristine }">
				<td>Father's Annual Income</td>
				<td><form:input path="fatherAnnualIncome" type="number"
						ng-model="fatherAnnualIncome" required="true"
						ng-pattern="/^[0-9]+$/" /><span
					ng-show="userForm.fatherAnnualIncome.$invalid && !userForm.fatherAnnualIncome.$pristine"
					class="help-block" style="color: red">Please Enter Valid
						Income </span></td>
				<td><form:errors path="fatherAnnualIncome" cssClass="error"
						style="color:red" /></td>
			</tr>
		</table>
		<button class="button button1" type="submit" value="Add" ng-disabled="userForm.$invalid">Submit</button>
	</form:form>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);

		app.controller('AppCtrl', function($scope) {
			$scope.eduLoanAmount = "";
			$scope.courseName = "";
			$scope.courseFee = "";
			$scope.fatherName = "";
			$scope.idCardNumber = "";
			$scope.fatherAnnualIncome = "";

		})
	</script>
</body>
</html>