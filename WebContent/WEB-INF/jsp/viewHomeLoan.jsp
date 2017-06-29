<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
	<style>
table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}
th {
    background-color: #4CAF50;
    color: white;
}

th, td {
    padding: 15px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Home Loan Details</title>
</head>

<body ng-app="myApp">
	<div ng-controller="EmpCtrl">

		<input type="text" ng-model="search.$"
			placeholder="Search By All" />
		<hr />

		<table>
			<tr>
				<th>Homeloan Account Number</th>
				<th>Home Loan Id</th>
				<th>Loan Amount</th>
				<th>Loan Duration</th>
				
				<th>Annual Income</th>
				<th>Company Name</th>
				<th>Designation</th>
				<th>Total Experience</th>
				<th>Current Experience</th>
			</tr>
			<tr ng-repeat="homeLoan in homeLoans | filter: search">
				<td>{{homeLoan.loanAccountNumber}}</td>
				<td>{{homeLoan.homeLoanId}}</td>
				<td>{{homeLoan.loanAmount}}</td>
				<td>{{homeLoan.loanDuration}}</td>
				
				<td>{{homeLoan.annualIncome}}</td>
				<td>{{homeLoan.companyName}}</td>
				<td>{{homeLoan.designation}}</td>
				<td>{{homeLoan.totalExperience}}</td>
				<td>{{homeLoan.currentExperience}}</td>
			</tr>
		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	<script>
        var app = angular.module('myApp', []);
        app.controller('EmpCtrl', function($scope, $http){
            $http({
              method: 'GET',
              url: 'viewHomeLoan1?accountNumber=${accountNumber}'
            }).then(res=>res.data)
            .then(data => {
            	console.log(data);
            	$scope.homeLoans = data;
            })
        
           
        })
    </script>
</body>
</html>