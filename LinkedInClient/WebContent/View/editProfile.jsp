<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile | LinkedIn</title>
<style type="text/css">
.search_font {
	color: white;
	size: "20px";
	font-family: cursive;
}

body {
	font-family: Arial, sans-serif
}
</style>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
</head>


<body>
<form id="form4" >
	<div class="form-group">


			<table width="100%" cellspacing="0" style="background-image: url('../Images/searchBackground.PNG')">
				<tr height="50">
					<td width="200" align="right">
						<img src="../Images/inToolbar.PNG" width="50" height="50" align="middle">
					</td>
					<td>
						<table>
							<tr>
								<td width="300px"></td>
								<td><span class="search_font">Search: </span>
									<span style="padding-left: 10px;">
										<input type="text" style="width: 300px; height: 30px" name="dynamicSearch" placeholder="Search for Connections">
									</span>
								</td>
								<td width="50px;">
									<span style="padding-left: 10px">
										<button class="btn btn-primary glyphicon glyphicon-search" ></button>
									</span>
								</td>
							</tr>
						</table>
					</td>
					<td>
						<span class="search_font">Signout</span>
					</td>
				</tr>
			</table>
			<br>

			<div align="center">
			<h3>Hi,&nbsp;<font style="text-transform: capitalize;"><%= request.getAttribute("fname") %> &nbsp; <%= request.getAttribute("lname") %></font> You can Edit Your Profile!!!</h3>
				<table border="0" width="70%">
					<tr class="container-fluid">
						<td>Photo</td>
						<td>
						</td>
					</tr>
				</table>
				<br><br>
				<table border="0" width="70%">
					<tr>
						<td>Summary</td>
					</tr>
					<tr style="height: 260px" valign="top">
						<td><textarea style="height: 150px; width: 100%" name="summ1"
								class="form-control"><%=request.getAttribute("summary")%></textarea>
						</td>
					</tr>
				</table>
				
				<table border="0" width="70%">
					<tr>
						<td>Experience</td>
					</tr>
					<tr style="height: 260px" valign="top">
						<td><textarea style="height: 150px; width: 100%" name="exp1"
								class="form-control"><%=request.getAttribute("experience")%></textarea>
						</td>
					</tr>
				</table>
				<table border="0" width="70%">
					<tr>
						<td>Education</td>
					</tr>
					<tr style="height: 260px" valign="top">
						<td><textarea style="height: 150px; width: 100%" name="education1"
								class="form-control"><%=request.getAttribute("education")%></textarea>
						</td>
					</tr>
				</table>
				
				<table border="0" width="70%">
					<tr>
						<td>Projects</td>
					</tr>
					<tr style="height: 260px" valign="top">
						<td><textarea style="height: 150px; width: 100%"  name="projects1"
								class="form-control"><%=request.getAttribute("project")%></textarea>
						</td>
					</tr>
				</table>
				
				<table border="0" width="70%">
		
					<tr>
						<td>
						</td>
					</tr>
				</table>
			</div>
			
			<div align="center">
				<button class="btn btn-primary glyphicon glyphicon-upload" type="submit" onclick="updateDetails()"> Update</button>
			</div>
	</div>
	
</form>
	<br>
	<br>
	<br>
	<br>

	
<script type="text/javascript" >
form=document.getElementById("form4");
function updateDetails()
	{
		form.action="updateProfile";
		form.method="post";
		form.submit();
	}

function searchUser()
	{
		form.action="/searchUser";
		form.method="post";
		form.submit();
	}
</script>

</body>

</html>