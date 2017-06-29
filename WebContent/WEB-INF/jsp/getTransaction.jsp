<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}

th, td {
	padding: 15px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.3.1/css/foundation.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Transaction</title>
</head>
<body>
	<div class="w3-top"></div>
	<div class="w3-bar w3-white w3-wide w3-padding w3-card-2"></div>
	<center><h3>Transactions</h3></center>
</body>

<body ng-app="myApp">
	<div ng-controller="EmpCtrl">

		<input type="text" ng-model="search.$" placeholder="Search By All" />
		<hr />

		<table>
			<tr>
				<th>Transaction Id</th>
				<th>Transaction Description</th>
				<th>Transaction Type</th>
				<th>Transaction Amount</th>
			</tr>
			<tr ng-repeat="detail in transactionDetailsList | filter: search">
				<td>{{detail.transactionId}}</td>
				<td>{{detail.transactionDescription}}</td>
				<td>{{detail.transactionType}}</td>
				<td>{{detail.transactionAmount}}</td>

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
              url: 'getTransactionDetails?accountNumber=${accountNumber}'
            }).then(res=>res.data)
            .then(data => {
            	console.log(data);
            	$scope.transactionDetailsList = data;
            })
        
           })
    </script>
</body>
</html>