<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Connections</title>
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
<form class="form-horizontal" action="" id="form3" >
	<div class="form-group">
		

			<table width="100%" cellspacing="0"
				style="background-image: url('../Images/searchBackground.PNG')">
				<tr height="50">
					<td width="200" align="right"><img
						src="../Images/inToolbar.PNG" width="50" height="50"
						align="middle"></td>
					<td><table>
							<tr align="center">
								<td width="300px"></td>
								<td><span class="search_font"><B> YOUR CONNECTIONS </B></span> </td>
							</tr>
						</table></td>
					
				</tr>
			</table>
			<br>
		<div class="col-md-6 col-md-offset-3">
			<div align="center">
				
				<table border="0"  class="table table-hover table-striped">
				<%String[] fname=(String[]) request.getAttribute("fname"); String[] lname=(String[]) request.getAttribute("lname"); String[] email=(String[]) request.getAttribute("email"); %>
					<% for(int i=0;i<fname.length;i++){%>
					<tr>
						<td style="font-family: monospace; font-size: x-large;">
						<b>
	<a href="#" onclick="myConnections('<%=fname[i]%>','<%=lname[i]%>','<%=email[i]%>');"><%=fname[i]%>&nbsp;<%=lname[i]%></a>
						</b>
						</td>
						<td style="font-family: monospace; font-size: x-large;">
						<%if(fname[0]!="No Connections."){%>
							<a href="#" class="btn btn-danger glyphicon glyphicon-minus-sign"
							onclick="deleteConn('<%=fname[i]%>','<%=lname[i]%>','<%=email[i]%>');"> DELETE CONNECTION</a>
						<%}%>
						</td>
					</tr>
					<%}%>


				</table>
			</div>
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
function myConnections(fname, lname, email)
	{	
		if(fname!="No Connections")
		{
			form.action="/otherUser?fname="+fname+"&lname="+lname+"&email="+email;
			form.method="post";
			form.submit();
		}
		return false;
	}
	
function deleteConn(fname, lname, email)
	{	
		if(fname!="No Connections")
		{
			form.action="deleteConn?firstname="+fname+"&lastname="+lname+"&e-mail="+email;
			form.method="post";
			form.submit();
		}
		return false;
	}
</script>
</body>

</html>