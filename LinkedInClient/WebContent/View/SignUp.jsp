<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-In/Sign-Up</title>
	<link rel="stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular.min.js"></script>
</head>


	<body ng-app="signIn" ng-Controller="signInCont" onload="noBack();">
    <!-- background="..\Images\Home Background.jpg" style="background-size:cover;"> -->
	
		<form class="form-horizontal" action="" id="form1" name="signInForm">
	
			<table class="table table-striped">
				<tr>
					<td><img src="..\Images\Logo.png" 
					alt="Mountain View" style="width: 120px; height: 30px; " align="middle"></td>
					<td>
						<table  style="width: 30cm;">
							<tr align="center">
								
								<td style="width: 20cm; right: 10cm;">
									<div class="fieldgroup">
									Email Address
										<input type="email" name="userid" value="" ng-model="email" size="27" ng-pattern="email1" id="email1"
										 placeholder="someone@example.com" required> 
									
								    Password
									
										<input type="password" name="pass" value="" ng-model="pass" size="27" id="pwd1"
										placeholder="password" required>
	
									&nbsp;&nbsp;&nbsp; 
											<button class="btn btn-success" onclick="signIn()" type="submit" 
											ng-disabled="(signInForm.userid.$error.required ||
											signInForm.userid.$error.pattern || signInForm.pass.$error.required)">
												<span class="glyphicon glyphicon-user" ></span> Sign In
											</button>
										</div>
								</td>
							</tr>
								<tr><td style="color: red;" align="center">
								
								<span 
									ng-show="signInForm.userid.$error.required && signInForm.userid.$dirty">EMail is
											required.</span>
								<span ng-show="signInForm.userid.$error.pattern" style="color: red">Invalid
											email address.</span>
								 
								<span style="color: red"
										ng-show="signInForm.pass.$error.required && signInForm.pass.$dirty">Password is
											required.
								</span> 
								
								</td></tr>
						</table>
					</td>

				</tr>
			</table>

		</form>
		

		<form class="form-horizontal" action="" id="form2" name="signUpForm">

			<div class="col-md-6 col-md-offset-3">
			<br>
			<h4><div align="center" style="font-style: italic;"><font color="RED">
			
				<%
					if (request.getAttribute("message") != null) {
				%>
				<div>
					SignUp Failed:
					<%=request.getAttribute("message")%></div>
				<%
					}
				%>
				</font>
				</div>
			</h4>
			<div>
						<h2 style="color: #0077B5" ><b>New to LinkedIn?</b></h2>
				
				</div>
				
							<table class="table table-hover table-striped" >
					<tbody>
						<tr>
							<td style="width: 5cm;">Email Id</td>
							<td><input type="email" ng-model="emailid" name="emailid" ng-pattern="email2"
								placeholder="EMail Id" class="form-control" required></td>
							<td style="width: 5cm;">
							
							<!--<span style="color:red" ng-show="signInForm.emailid.$dirty && signInForm.emailid.$invalid">-->
							<span ng-show="signUpForm.emailid.$error.required && signUpForm.userid.$dirty" style="color: red">EMail is
											required.</span>
							<span ng-show="signUpForm.emailid.$error.pattern" style="color: red">Invalid
											email address.</span>
							<!--</span>-->
							
							</td>
						</tr>
						<tr>
							<td>First Name</td>
							<td><input type="text" ng-model="fName" name="firstname"
								placeholder="First Name" class="form-control" required></td>
							<td>
							
							<span style="color:red" ng-show="signUpForm.firstname.$dirty && signUpForm.firstname.$invalid">
							<span style="color: red"
										ng-show="signUpForm.firstname.$error.required && signUpForm.firstname.$dirty">Provide First Name.
							</span> 
							</span>
							
							</td>
						</tr>
						<tr>
							<td>Last Name:</td>
							<td><input type="text" ng-model="lName"  name="lastname" id="lName"
								placeholder="Last Name" class="form-control" required></td>
							<td>
							<span style="color:red" ng-show="signUpForm.lastname.$dirty && signUpForm.lastname.$invalid">
							<span style="color: red"
										ng-show="signUpForm.lastname.$error.required && signUpForm.lastname.$dirty">Provide Last Name.
							</span> 
							</span>
							</td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" ng-model="pass1"  name="pass1" id="pwd2"
								placeholder="Password" class="form-control" required></td>
							<td>
							<span style="color:red" ng-show="signUpForm.pass1.$dirty && signUpForm.pass1.$invalid">
							<span style="color: red"
										ng-show="signUpForm.pass1.$error.required">Password is
											required.
							</span> 
							</span>
							</td>
						</tr>
						<tr>
							<td>Confirm Password:</td>
							<td><input type="password" ng-model="pass2"  name="pass2" ui-validate=" '$value==pass1' " ui-validate-watch=" 'pass1' "
								placeholder="Confirm Password" class="form-control" required></td>
							<td>
							
							
							<span style="color: red"
										ng-show="signUpForm.pass2.$error.required && signUpForm.pass2.$dirty">Repeat Password.
							</span>
						    <span ng-show="(pass1 != pass2)" style="color: red">
						        Password mismatched
						    </span>
							 
							</td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type="text" ng-model="city" name="city" ng-pattern="cityName" id="city"
								placeholder="Current Location" class="form-control"></td>
							<td>
							<span ng-show="signUpForm.city.$error.pattern" style="color: red">Not a valid City Name..!</span>
							</td>
						</tr>
						<tr>
							<td>Mobile Number:</td>
							<td><input type="text" ng-model="mobNumber" name="mobNumber" ng-pattern="phone" id="mobile"
								placeholder="Mobile Number" class="form-control"></td>
							<td>
							<span ng-show="signUpForm.mobNumber.$error.pattern" style="color: red">Not a valid phone number!</span>
							</td>
						</tr>
	
					</tbody>
				</table>
				
				<div align="right">
				<button class="btn btn-primary" onclick="register()" type="submit"
				ng-disabled="(signUpForm.emailid.$error.required || signUpForm.emailid.$error.pattern ||
				signUpForm.firstname.$error.required || signUpForm.lastname.$error.required ||
				signUpForm.pass1.$error.required || signUpForm.pass2.$error.required ||signUpForm.city.$error.pattern ||
				signUpForm.mobNumber.$error.pattern || (pass1 != pass2))">
				<span class="glyphicon glyphicon-user"></span>  Create New User
				</button>
				</div>
				
				
			</div>
		</form>
	
		<div class="col-md-6 col-md-offset-3">
	
		</div>
	
	<script>
	var app1=angular.module('signIn',[]);
	app1.controller("signInCont", function($scope, $http){
	
	var login = {
        email: $scope.email,
        pass: $scope.pass
    };
	
	$scope.name="Deenash";
	$scope.phone = /^[0-9]{10}$/;
	$scope.email1 = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+[a-zA-Z0-9]$/;
	$scope.email2 = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+[a-zA-Z0-9]$/;
	$scope.cityName= /^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$/;
	
	$scope.signIn=function(){
		$http.post('/signIn',{email: $scope.email, pass: $scope.pass});
		
	};
	});
	
	var app = angular.module('myApp', []);
	app.controller('validateCtrl', function($scope) {
		
	});


	</script>
	

	
	<script type"text/javascript">
	
    javascript:window.history.forward(1);
	
	form1=document.getElementById("form1");
	function signIn()
	{
	form1.action="signIn";
	form1.method="post";
	form1.submit();
	}
	
	form2=document.getElementById("form2");
	function register()
	{
	form2.action="register";
	form2.method="post";
	form2.submit();
	}
	
	</script>
	
	</body>


</html>