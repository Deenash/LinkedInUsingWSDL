<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Connection Requests</title>
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
	<form class="form-horizontal" action="" id="form6">
		<div class="form-group">


			<table width="100%" cellspacing="0"
				style="background-image: url('../Images/searchBackground.PNG')">
				<tr height="50">
					<td width="200" align="right"><img
						src="../Images/inToolbar.PNG" width="50" height="50"
						align="middle"></td>
					<td><table>
							<tr>
								<td width="300px"></td>
								<td><span class="search_font">Search: </span> <span
									style="padding-left: 10px;"> <input type="text"
										style="width: 300px; height: 30px" name="searchedUser"
										placeholder="Search for Connections">
								</span></td>
								<td width="50px;"><span style="padding-left: 10px">
										<button class="btn btn-primary glyphicon glyphicon-search"
											onclick="searchUser()"></button>
								</span></td>
							</tr>
						</table></td>
					<td>
						<button class="btn btn-primary" type="submit" onclick="signOut()"
							style="">SignOut</button>
				</tr>
			</table>
			<br>
			<div class="col-md-6 col-md-offset-3">
				<div align="center">
					<h3 style="font-style: italic;" align="left">Connection
						Requests:</h3>
					<table border="0" width="70%"
						class="table table-hover table-striped">
				<%String[] fname=(String[]) request.getAttribute("fname"); String[] lname=(String[]) request.getAttribute("lname"); String[] email=(String[]) request.getAttribute("email"); %>
					<% for(int i=0;i<fname.length;i++){%>
						<tr>
							<td style="font-family: monospace; font-size: x-large;"><b>
									<a href="#"
									onclick="myConnections('<%=fname[i]%>','<%=lname[i]%>','<%=email[i]%>');"><%=fname[i]%>&nbsp;<%=lname[i]%></a>
							</b></td>
							<td>
							<%if(fname[0]!="No more Request to Accept/Reject." && lname[0]!="No requests to see."){%>
							<a href="#" class="btn btn-success glyphicon glyphicon-plus-sign"
									onclick="accept('<%=fname[i]%>','<%=lname[i]%>','<%=email[i]%>');"> ACCEPT REQUEST</a>
							<%}%>
							</td>
							<td>
							<%if(fname[0]!="No more Request to Accept/Reject." && lname[0]!="No requests to see."){%>
							<a href="#" class="btn btn-danger glyphicon glyphicon-minus-sign"
									onclick="reject('<%=fname[i]%>','<%=lname[i]%>','<%=email[i]%>');"> REJECT REQUEST</a>
							<%}%>
							</td>
						</tr>
						<%}%> 
					</table>
					<br>
					<br>
					<%if(fname[0]!="No more Request to Accept/Reject." && lname[0]!="No requests to see."){%>
					<I>Your have <%=fname.length%> connection requests.</I>
					<%}else{%>
					<I>Your don't have any more connection requests.</I>
					<%}%>
				</div>
				<br> <br>
			</div>
		</div>
		<br> <br> <br> <br>
	</form>


	<script type="text/javascript">
		form = document.getElementById("form6");

		function connect(fname, lname, email) {
			if (lname != null) {
				form.action = "/otherUser?fname=" + fname + "&lname=" + lname
						+ "&email=" + email;
				form.method = "post";
				form.submit();
			}
			return false;
		}

		function myConnections(fname, lname, email) {
			if (fname != "No Connections") {
				form.action = "/otherUser?fname=" + fname + "&lname=" + lname+ "&email=" + email;
				form.method = "post";
				form.submit();
			}
			return false;
		}

		function searchUser() {
			form.action = "/searchUser";
			form.method = "post";
			form.submit();
		}

		function accept(fname, lname, email) {
			form.action = "/acceptRequest?fname=" + fname + "&lname=" + lname+ "&email=" + email;
			form.method = "post";
			form.submit();
			return false;
		}

		function reject(fname, lname, email) {
			form.action = "/rejectRequest?fname="+fname+"&lname="+lname+"&email="+email;
			form.method = "post";
			form.submit();
		}
	</script>
</body>

</html>