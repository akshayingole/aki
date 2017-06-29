<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!</title>
</head>
<body ng-app="myApp">
	<h1>Welcome to Bank Management System</h1>
	<!-- Please add your application links by replacing the below sample links -->
	<center><h3>LOGIN</h3></center>
	<!-- Please add your application links by replacing the below sample links -->
	<form method="GET" action = "mvc/home" name="userForm">
	<br>
	<div class="input">
	<div class="form-group"
					ng-class="{ 'has-error' : userForm.accountNumber.$invalid && !userForm.accountNumber.$pristine }">
	<input Placeholder="Account Number" type="text" maxlength="16" name="accountNumber" ng-model="loanAmount" required="true" ng-pattern="/^[0-9]+$/"></input><span
						ng-show="userForm.accountNumber.$invalid && !userForm.accountNumber.$pristine"
						class="help-block" style="color: red">Should be Numeric</span></td>
	<center><button type="submit" ng-disabled="userForm.$invalid">Login</button></center>
	</div>
	</div>
	</form>
	</center>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);

		app.controller('AppCtrl', function($scope) {
			$scope.accountNumber = "";
		})
		
	</script>
</body>
</html>
