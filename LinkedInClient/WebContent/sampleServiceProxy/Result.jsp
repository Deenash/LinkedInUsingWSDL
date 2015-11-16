<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleServiceProxyid" scope="session" class="connection.ServiceProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleServiceProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleServiceProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleServiceProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        connection.Service getService10mtemp = sampleServiceProxyid.getService();
if(getService10mtemp == null){
%>
<%=getService10mtemp %>
<%
}else{
        if(getService10mtemp!= null){
        String tempreturnp11 = getService10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String userName_1id=  request.getParameter("userName16");
            java.lang.String userName_1idTemp = null;
        if(!userName_1id.equals("")){
         userName_1idTemp  = userName_1id;
        }
        String password_2id=  request.getParameter("password18");
            java.lang.String password_2idTemp = null;
        if(!password_2id.equals("")){
         password_2idTemp  = password_2id;
        }
        String fName_3id=  request.getParameter("fName20");
            java.lang.String fName_3idTemp = null;
        if(!fName_3id.equals("")){
         fName_3idTemp  = fName_3id;
        }
        String lName_4id=  request.getParameter("lName22");
            java.lang.String lName_4idTemp = null;
        if(!lName_4id.equals("")){
         lName_4idTemp  = lName_4id;
        }
        String city_5id=  request.getParameter("city24");
            java.lang.String city_5idTemp = null;
        if(!city_5id.equals("")){
         city_5idTemp  = city_5id;
        }
        String mobile_6id=  request.getParameter("mobile26");
            java.lang.String mobile_6idTemp = null;
        if(!mobile_6id.equals("")){
         mobile_6idTemp  = mobile_6id;
        }
        java.lang.String signUp13mtemp = sampleServiceProxyid.signUp(userName_1idTemp,password_2idTemp,fName_3idTemp,lName_4idTemp,city_5idTemp,mobile_6idTemp);
if(signUp13mtemp == null){
%>
<%=signUp13mtemp %>
<%
}else{
        String tempResultreturnp14 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(signUp13mtemp));
        %>
        <%= tempResultreturnp14 %>
        <%
}
break;
case 28:
        gotMethod = true;
        String user_7id=  request.getParameter("user59");
            java.lang.String user_7idTemp = null;
        if(!user_7id.equals("")){
         user_7idTemp  = user_7id;
        }
        String pass_8id=  request.getParameter("pass61");
            java.lang.String pass_8idTemp = null;
        if(!pass_8id.equals("")){
         pass_8idTemp  = pass_8id;
        }
        connection.UsersBean signIn28mtemp = sampleServiceProxyid.signIn(user_7idTemp,pass_8idTemp);
if(signIn28mtemp == null){
%>
<%=signIn28mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">mobile:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typemobile31 = signIn28mtemp.getMobile();
        String tempResultmobile31 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typemobile31));
        %>
        <%= tempResultmobile31 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">emailid:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typeemailid33 = signIn28mtemp.getEmailid();
        String tempResultemailid33 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemailid33));
        %>
        <%= tempResultemailid33 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">education:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typeeducation35 = signIn28mtemp.getEducation();
        String tempResulteducation35 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeeducation35));
        %>
        <%= tempResulteducation35 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastloggedin:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typelastloggedin37 = signIn28mtemp.getLastloggedin();
        String tempResultlastloggedin37 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastloggedin37));
        %>
        <%= tempResultlastloggedin37 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">projects:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typeprojects39 = signIn28mtemp.getProjects();
        String tempResultprojects39 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeprojects39));
        %>
        <%= tempResultprojects39 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">city:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typecity41 = signIn28mtemp.getCity();
        String tempResultcity41 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecity41));
        %>
        <%= tempResultcity41 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">skills:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typeskills43 = signIn28mtemp.getSkills();
        String tempResultskills43 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeskills43));
        %>
        <%= tempResultskills43 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstname:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typefirstname45 = signIn28mtemp.getFirstname();
        String tempResultfirstname45 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstname45));
        %>
        <%= tempResultfirstname45 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastname:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typelastname47 = signIn28mtemp.getLastname();
        String tempResultlastname47 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastname47));
        %>
        <%= tempResultlastname47 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">experience:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typeexperience49 = signIn28mtemp.getExperience();
        String tempResultexperience49 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeexperience49));
        %>
        <%= tempResultexperience49 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">errorMessage:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typeerrorMessage51 = signIn28mtemp.getErrorMessage();
        String tempResulterrorMessage51 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeerrorMessage51));
        %>
        <%= tempResulterrorMessage51 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">validate:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.Boolean typevalidate53 = signIn28mtemp.getValidate();
        String tempResultvalidate53 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typevalidate53));
        %>
        <%= tempResultvalidate53 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typepassword55 = signIn28mtemp.getPassword();
        String tempResultpassword55 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword55));
        %>
        <%= tempResultpassword55 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">companies:</TD>
<TD>
<%
if(signIn28mtemp != null){
java.lang.String typecompanies57 = signIn28mtemp.getCompanies();
        String tempResultcompanies57 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecompanies57));
        %>
        <%= tempResultcompanies57 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 63:
        gotMethod = true;
        String user_9id=  request.getParameter("user94");
            java.lang.String user_9idTemp = null;
        if(!user_9id.equals("")){
         user_9idTemp  = user_9id;
        }
        connection.UsersBean getProfile63mtemp = sampleServiceProxyid.getProfile(user_9idTemp);
if(getProfile63mtemp == null){
%>
<%=getProfile63mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">mobile:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typemobile66 = getProfile63mtemp.getMobile();
        String tempResultmobile66 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typemobile66));
        %>
        <%= tempResultmobile66 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">emailid:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typeemailid68 = getProfile63mtemp.getEmailid();
        String tempResultemailid68 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeemailid68));
        %>
        <%= tempResultemailid68 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">education:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typeeducation70 = getProfile63mtemp.getEducation();
        String tempResulteducation70 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeeducation70));
        %>
        <%= tempResulteducation70 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastloggedin:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typelastloggedin72 = getProfile63mtemp.getLastloggedin();
        String tempResultlastloggedin72 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastloggedin72));
        %>
        <%= tempResultlastloggedin72 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">projects:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typeprojects74 = getProfile63mtemp.getProjects();
        String tempResultprojects74 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeprojects74));
        %>
        <%= tempResultprojects74 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">city:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typecity76 = getProfile63mtemp.getCity();
        String tempResultcity76 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecity76));
        %>
        <%= tempResultcity76 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">skills:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typeskills78 = getProfile63mtemp.getSkills();
        String tempResultskills78 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeskills78));
        %>
        <%= tempResultskills78 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstname:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typefirstname80 = getProfile63mtemp.getFirstname();
        String tempResultfirstname80 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstname80));
        %>
        <%= tempResultfirstname80 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastname:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typelastname82 = getProfile63mtemp.getLastname();
        String tempResultlastname82 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastname82));
        %>
        <%= tempResultlastname82 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">experience:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typeexperience84 = getProfile63mtemp.getExperience();
        String tempResultexperience84 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeexperience84));
        %>
        <%= tempResultexperience84 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">errorMessage:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typeerrorMessage86 = getProfile63mtemp.getErrorMessage();
        String tempResulterrorMessage86 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeerrorMessage86));
        %>
        <%= tempResulterrorMessage86 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">validate:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.Boolean typevalidate88 = getProfile63mtemp.getValidate();
        String tempResultvalidate88 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typevalidate88));
        %>
        <%= tempResultvalidate88 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typepassword90 = getProfile63mtemp.getPassword();
        String tempResultpassword90 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword90));
        %>
        <%= tempResultpassword90 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">companies:</TD>
<TD>
<%
if(getProfile63mtemp != null){
java.lang.String typecompanies92 = getProfile63mtemp.getCompanies();
        String tempResultcompanies92 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecompanies92));
        %>
        <%= tempResultcompanies92 %>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 96:
        gotMethod = true;
        String user_10id=  request.getParameter("user99");
            java.lang.String user_10idTemp = null;
        if(!user_10id.equals("")){
         user_10idTemp  = user_10id;
        }
        String sum_11id=  request.getParameter("sum101");
            java.lang.String sum_11idTemp = null;
        if(!sum_11id.equals("")){
         sum_11idTemp  = sum_11id;
        }
        String exp_12id=  request.getParameter("exp103");
            java.lang.String exp_12idTemp = null;
        if(!exp_12id.equals("")){
         exp_12idTemp  = exp_12id;
        }
        String edu_13id=  request.getParameter("edu105");
            java.lang.String edu_13idTemp = null;
        if(!edu_13id.equals("")){
         edu_13idTemp  = edu_13id;
        }
        String proj_14id=  request.getParameter("proj107");
            java.lang.String proj_14idTemp = null;
        if(!proj_14id.equals("")){
         proj_14idTemp  = proj_14id;
        }
        sampleServiceProxyid.updateProfile(user_10idTemp,sum_11idTemp,exp_12idTemp,edu_13idTemp,proj_14idTemp);
break;
case 109:
        gotMethod = true;
        String user_15id=  request.getParameter("user112");
            java.lang.String user_15idTemp = null;
        if(!user_15id.equals("")){
         user_15idTemp  = user_15id;
        }
        java.lang.String[] getConnections109mtemp = sampleServiceProxyid.getConnections(user_15idTemp);
if(getConnections109mtemp == null){
%>
<%=getConnections109mtemp %>
<%
}else{
        String tempreturnp110 = null;
        if(getConnections109mtemp != null){
        java.util.List listreturnp110= java.util.Arrays.asList(getConnections109mtemp);
        tempreturnp110 = listreturnp110.toString();
        }
        %>
        <%=tempreturnp110%>
        <%
}
break;
case 114:
        gotMethod = true;
        String user_16id=  request.getParameter("user117");
            java.lang.String user_16idTemp = null;
        if(!user_16id.equals("")){
         user_16idTemp  = user_16id;
        }
        java.lang.String[] getConnReq114mtemp = sampleServiceProxyid.getConnReq(user_16idTemp);
if(getConnReq114mtemp == null){
%>
<%=getConnReq114mtemp %>
<%
}else{
        String tempreturnp115 = null;
        if(getConnReq114mtemp != null){
        java.util.List listreturnp115= java.util.Arrays.asList(getConnReq114mtemp);
        tempreturnp115 = listreturnp115.toString();
        }
        %>
        <%=tempreturnp115%>
        <%
}
break;
}
} catch (Exception e) { 
%>
Exception: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.toString()) %>
Message: <%= org.eclipse.jst.ws.util.JspUtils.markup(e.getMessage()) %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>