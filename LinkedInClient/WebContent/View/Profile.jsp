<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" href = "http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.2.27/angular.min.js"></script>
</head>
<body>

<form class="form-horizontal" id="form3"  ng-app="myProfile" ng-controller="profileController">
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
								<td>
									<span class="search_font" style="font-size: large;"> <font color="WHITE">Search: </font></span> 
									<span style="padding-left: 10px;"><input type="text" style="width: 300px; height: 40px" name="dynamicSearch"
										placeholder="Search for Connections"></span>
								</td>
								<td width="50px;">
									<span style="padding-left: 10px">
										<button class="btn btn-primary">
											<span class="glyphicon glyphicon-search"></span> 
										</button>
									</span>
								</td>
							</tr>
						</table>
					</td>
					<td>	
						<button class="btn btn-primary" type="submit" onclick="signOut()" style="">SignOut</button>
				</tr>
			</table>
			<br>

			<div align="center">
				<table border="0" width="70%">
					<tr class="container-fluid">
						<td>
							<table>

								<tr>
									<td align="left"><h3>Hi,&nbsp;<font style="text-transform: capitalize;"><%= request.getAttribute("fname") %></font> Welcome!!!</h3>
										
										
									</td>
									
								</tr>
								<tr>
 									<td><h4>Last Login Time:&nbsp;&nbsp; </h4>
 									
								<% if(request.getAttribute("time")!= null)
								{%>
									<%=request.getAttribute("time")%> 
									</td> 
								<%}%>											
								</tr>

							</table>
						</td>
						
						<td align="center" valign="middle">
							<button class="btn btn-primary glyphicon glyphicon-edit" type="submit" onclick="editProfile()"> Edit-Profile
						    </button>
						</td>
						<td align="center" valign="middle">
							<button class="btn btn-primary glyphicon glyphicon-heart" type="submit" onclick="connections()">
							Your-Connections</button>
						</td>
						<td align="center" valign="middle">
							<button class="btn btn-primary glyphicon glyphicon-envelope" type="submit" onclick="connReq()">
							Connection-Requests</button>
						</td>
						<td align="center" valign="middle">
							<button class="btn btn-primary glyphicon glyphicon-trash" type="submit" onclick="deleteAccount()">
							Delete-Account</button>
						</td>
					</tr>
				</table>
				<br> <br>
				<table border="0" width="70%"  ng-show="valSummary && valUser">
					<tr>
						<td><h4>Summary</h4></td>
					</tr>
					<tr style="height: 100px" valign="top">
					<% if(request.getAttribute("summary")!= null)
					{%>
						<td><%=request.getAttribute("summary")%> </td>
					<%}%>
					</tr>
				</table>
				<br> <br>
				<table border="0" width="70%" ng-show="valExperience && valUser">
					<tr>
						<td><h4>Experience</h4></td>
					</tr>
					<tr style="height: 100px" valign="top">
									<% if(request.getAttribute("experience")!= null)
					{%>
						<td><%= request.getAttribute("experience") %> </td>
					<%}%>
						
					</tr>
				</table>
				<table border="0" width="70%" ng-show="valEducation && valUser">
					<tr>
						<td><h4>Education</h4></td>
					</tr>
					<tr style="height: 100px" valign="top">
						
					<% if(request.getAttribute("education")!= null)
					{%>
						<td><%= request.getAttribute("education") %> </td>
					<%	}
						%>
					</tr>
				</table>
				<br> <br>
				<table border="0" width="70%" ng-show="valProjects && valUser">
					<tr>
						<td><h4>Projects</h4></td>
					</tr>
					<tr style="height: 100px" valign="top">
				<% if(request.getAttribute("project")!= null){%>
					<td><%= request.getAttribute("project") %> </td>
				<%}%>
						
					</tr>
				</table>
				<br> <br>
				<table border="0" width="70%">

					<tr>
						<td>
							
						</td>
					</tr>
				</table>
			</div>
			<br> <br>	

	</div>
	<br>
	<br>
	<br>
	<br>
	
</form>

<script type="text/javascript" >
form=document.getElementById("form3");
function connections()
{
	form.action="connections";
	form.method="post";
	form.submit();
}

function editProfile()
{
	form.action="displayEdit";
	form.method="post";
	form.submit();
}
	
	
function signOut()
{
	form.action="signOut";
	form.method="post";
	form.submit();
	
}
	
function deleteAccount()
{
	form.action="/delete";
	form.method="post";
	form.submit();
	
}

function searchUser()
{
	form.action="/searchUser";
	form.method="post";
	form.submit();
}

function connReq()
{
	form.action="connReq";
	form.method="post";
	form.submit();
}
</script>

</body>
</html>