<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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

<title>Perform Transaction</title>
</head>
<body ng-app="myApp">
	<center>
		<h3>Perform Transaction</h3>
	</center>
	<hr>
	<form:form method="POST"
		commandName="/BaseCodeSlice_BankManagementSystem/mvc/addTransaction"
		modelAttribute="transaction" name="userForm">
		<table>

			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.transactionDescription.$invalid && !userForm.transactionDescription.$pristine }">
					<td>Transaction Description :</td>
					<td><form:input path="transactionDescription"
							ng-model="transactionDescription" required="true"
							ng-pattern="/^[ a-zA-Z]+$/" /> <span
						ng-show="userForm.transactionDescription.$invalid && !userForm.transactionDescription.$pristine"
						class="help-block" style="color: red">Description should be
							alphabets only</span></td>
					<td><form:errors path="transactionDescription"
							cssClass="error" /></td>
			</tr>
			<tr>
				<td>Transaction Type :</td>
				<td><form:select path="transactionType">
						<option value="DEPOSIT">DEPOSIT</option>
						<option value="WITHDRAWAL">WITHDRAWAL</option>
					</form:select></td>
				<td><form:errors path="transactionType" cssClass="error" /></td>
			</tr>
			<tr>
				<div class="form-group"
					ng-class="{ 'has-error' : userForm.transactionAmount.$invalid && !userForm.transactionAmount.$pristine }">
					<td>Transaction Amount :</td>
					<td><form:input path="transactionAmount"
							ng-model="transactionAmount" ng-pattern="/^[0-9]/" /> <span
						ng-show="userForm.transactionAmount.$invalid && !userForm.transactionAmount.$pristine"
						class="help-block" style="color: red">Invalid Amount!!</span></td>
					<td><form:errors path="transactionAmount" cssClass="error" /></td>
			</tr>
		</table>

		<button class="button button1" type="submit" value="Add"
			ng-disabled="userForm.$invalid">Submit</button>

	</form:form>
	<script src="../libs/angular.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);

		app.controller('AppCtrl', function($scope) {
			$scope.transactionAmount = "";
			// $scope.transactionType = "";
			$scope.transactionDescription = "";
		})
	</script>
</body>
</html>