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
		commandName="/BaseCodeSlice_BankManagementSystem/mvc/view?accountNumber=${accountNumber}&loanAccountNumber=${loanAccountNumber}"
		modelAttribute="homeLoanView" name="userForm">
		<table>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error': userForm.loanAmount.$invalid && !userForm.loanAmount.$pristine }">
					<td>Account Number :</td>
					<td><form:input path="accountNumber" ng-model="accountNumber"
							required="true" ng-pattern="/^[0-9]+$/" /><span
						ng-show="userForm.accountNumber.$invalid && !userForm.accountNumber.$pristine"
						class="help-block" style="color: red">invalid </span></td>
					<td><form:errors path="accountNumber" cssClass="error"
							style="color:red" /></td>
			</tr>
			
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.annualIncome.$invalid && !userForm.annualIncome.$pristine }">
					<td>Annual Income :</td>
					<td><form:input path="loanAccountNumber" ng-model="loanAccountNumber"
							required="true" ng-pattern="/^[0-9]+$/" /><span
						ng-show="userForm.loanAccountNumber.$invalid && !userForm.loanAccountNumber.$pristine"
						class="help-block" style="color: red">invalid </span></td>
					<td><form:errors path="loanAccountNumber" cssClass="error"
							style="color:red" /></td>
			</tr>
			<tr>
				
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