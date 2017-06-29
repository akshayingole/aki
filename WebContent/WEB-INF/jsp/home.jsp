<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
td {
	text-align: center;
}

.home_table {
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body ng-app="myApp">
	<!-- Navbar (sit on top) -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card-2">
			<a href="#home" class="w3-bar-item w3-button"><b>BANK</b>
				MANAGEMENT SYSTEM</a>
			<!-- Float links to the right. Hide them on small screens -->
			<div class="w3-right w3-hide-small">
				<a href="#projects" class="w3-bar-item w3-button">SERVICES</a>
				<!-- <a href="#about" class="w3-bar-item w3-button">About</a>
      <a href="#contact" class="w3-bar-item w3-button">Contact</a> -->
			</div>
		</div>
	</div>
	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide"
		style="max-width:1500px;" id="home"> <img class="w3-image"
		src="WEB-INF/images/Slide.jpg" alt="Architecture" width="1500px"
		height="5px">
	<div class="w3-display-middle w3-margin-top w3-center">
		<h1 class="w3-xxlarge w3-text-white">
			<span class="w3-padding w3-black w3-opacity-min"><b>Bank</b></span> <span
				class="w3-hide-small w3-text-light-grey"></span>Management System
		</h1>
	</div>
	</header>
	<div class="w3-content w3-padding" style="max-width: 1564px">
		<!-- Project Section -->
		<div class="w3-container w3-padding-32" id="projects"></div>

		<div ng-controller="EmpCtrl">
			<h2>
				<table>
					<tr ng-repeat="user in List">
						<td>Welcome {{user.acountHolderName}} !!!</td>
					</tr>
				</table>
			</h2>
			<hr />

			<table align="left">
				<tr>
					<th>S.NO</th>
					<th>Account Number</th>
					<th>Account Type</th>
					<th>Account Holder Name</th>
					<th>Account Balance</th>

				</tr>
				<tr ng-repeat="user in List | filter: search">
					<td>{{$index + 1}}</td>
					<td>{{user.accountNumber}}</td>
					<td>{{user.accountType}}</td>
					<td>{{user.acountHolderName}}</td>
					<td>{{user.accountBalance}}</td>

				</tr>
			</table>
		</div>
		<hr>
	<table>
	<tr><td>
	<div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Perform
					Transaction</div>
				<p>
					<a href="addTransaction?accountNumber=${accountNumber}"> <img
						src="WEB-INF/images/3.jpg" alt="Perform Transaction"
						style="width: 304px; height: 228px;">
					</a>
				</p>
				</div>
		</div>

		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Retrieve
					Transaction</div>
				<p>
					<a href="getTransaction?accountNumber=${accountNumber}"> <img
						src="WEB-INF/images/4.jpg" alt="Retrieve Transaction"
						style="width: 304px; height: 228px;">
					</a>
				</p>

			</div>
		</div>
</div></td></tr>
	
	<tr><td><div>
		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">Apply
					Education Loan</div>
				<p>
					<a href="insertEducationLoan?accountNumber=${accountNumber}"> <img
						src="WEB-INF/images/sl.jpg" alt="Apply Education Loan"
						style="width: 304px; height: 228px;">
					</a>
				</p>
			</div>
		</div>

		<div class="w3-col l3 m6 w3-margin-bottom">
			<div class="w3-display-container">
				<div class="w3-display-topleft w3-black w3-padding">View
					Education Loan</div>
				<p>
					<a href="viewEducationLoanDetails?accountNumber=${accountNumber}">
						<img src="WEB-INF/images/records.jpg" alt="View Education Loan"
						style="width: 304px; height: 228px;">
					</a>
				</p>
			</div>
		</div>
	</div></td></tr>
		<tr><td><div>
			<div class="w3-row-padding">
				<div class="w3-col l3 m6 w3-margin-bottom">
					<div class="w3-display-container">
						<div class="w3-display-topleft w3-black w3-padding">Apply
							HomeLoan</div>
						<a href="applyHomeLoan?accountNumber=${accountNumber}"> <img
							src="WEB-INF/images/home.jpg" alt="Apply HomeLoan"
							style="width: 304px; height: 228px;">
						</a>
					</div>
				</div>
			
			<div class="w3-col l3 m6 w3-margin-bottom">
				<div class="w3-display-container">
					<div class="w3-display-topleft w3-black w3-padding">View
						HomeLoan</div>
					<p>
						<a href="viewHomeLoan?accountNumber=${accountNumber}"> <img
							src="WEB-INF/images/Fe.jpg" alt="View HomeLoan"
							style="width: 304px; height: 228px;">
						</a>
					</p>
				</div>
			</div>
	</div>
</div></td></tr></table>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
        var app = angular.module('myApp', []);
        app.controller('EmpCtrl', function($scope, $http){
            $http({
              method: 'GET',
              url: 'homepage?accountNumber=${accountNumber}'
            	  
            }).then(res=>res.data)
            .then(data => {
            	console.log(data);
           $scope.List = data;
            })
         })
    </script>
</body>
</html>