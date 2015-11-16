package connection;

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;


public class DatabaseConnection {
	
	Connection con = null;
	static ResultSet rs;
    Statement stmt = null;
	
	DatabaseConnection(){		
		try {			
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmpe273_linkedin","root","root");
				stmt = con.createStatement();
				if(!con.isClosed())
					System.out.println("Successfully Connected to the database!!!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("SQL Exception: "+e.getMessage());
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				System.out.println("InstantiationException: "+e.getMessage());
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("IllegalAccessException: "+e.getMessage());
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("ClassNotFoundException: "+e.getMessage());
				e.printStackTrace();
			}
	}

	public String signUp(String emailid, String pwd, String fName, String lName, String city, String mobile){
		String result = "";
		int rowcount;
		try {
			DateFormat df = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
			Date dateobj = new Date();
			System.out.println(df.format(dateobj));
			String query = "Insert into users (firstname, lastname, emailid, password, lastloggedin, city, mobile)";
					query+=" values ('" + fName + "', '" + lName + "', '" + emailid + "', '" + pwd + "', '" + df.format(dateobj) + "', '" + city + "', '" + mobile + "');";
			System.out.println("Insert query1: "+query);
			rowcount=stmt.executeUpdate(query);
			
			String query2="insert into user_details (emailid) values ('"+emailid+"')";
			System.out.println("Insert query2: "+query2);
			rowcount=stmt.executeUpdate(query2);
			
			System.out.println("rowcount: "+rowcount);
			if(rowcount > 0){
				result="true";
				System.out.println("Insert Successful");
			}
			else{
				result="false: The data could not be inserted in the database.";
			}	
		} catch (SQLException e) {
			
			
			System.out.println("Inside DatabaseConnection.java exception");
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Printing error message: "+e.getMessage());
			//return false;
			return e.getMessage();
		}
		System.out.println("DBCONN.java Result: "+result);
		return result;
	}
	
	
	public UsersBean signIn (String emailid, String pwd){
		UsersBean usersResult = new UsersBean();
		usersResult.setValidate(false);
		int rowcount;
		int rc=0;
		String firstName, lastName, city, mobile, lastLoggedIn, education, projects, companies, experience, skills;
		try {
			DateFormat df = new SimpleDateFormat("yy-MM-dd HH-mm-ss");
			Date dateobj = new Date();
			System.out.println(df.format(dateobj)); 
//		select firstname, lastname, city, mobile, lastloggedin, education, projects, companies, experience, skills from user_details ud,users u where
//		u.emailid=ud.emailid and u.emailid='emailid' and password='pwd'
		
			String query = "select firstname, lastname, city, mobile, lastloggedin, education, projects, companies, experience, skills ";
			query+="from users u left join user_details ud on u.emailid=ud.emailid where u.emailid='"+emailid+"' and password='"+pwd+"'";
			
			String query1 = "update users set lastloggedin='"+df.format(dateobj)+"' where emailid='"+emailid+"' and password='"+pwd+"'";
			String query2 = "select count(*) as count from users where emailid='"+emailid+"' and password='"+pwd+"'";
			ResultSet ct=stmt.executeQuery(query2);
			ct.next();
			if(!ct.getString("count").equals(null))
			rc=Integer.parseInt(ct.getString("count"));
			
			
			System.out.println("select query: "+query);
			
			System.out.println("Number of rows existing: "+rc);
			
			if(rc>0)
			{
				ResultSet rs = stmt.executeQuery(query);

		        while (rs.next()) {
		            firstName = rs.getString("firstname"); lastName=rs.getString("lastname"); city=rs.getString("city");
		            mobile = rs.getString("mobile"); lastLoggedIn=rs.getString("lastloggedin"); education=rs.getString("education");
		            projects=rs.getString("projects");companies=rs.getString("companies"); experience=rs.getString("experience");
		            skills=rs.getString("skills");
		            System.out.println(firstName + "\t" + lastName + city + "\t" + mobile + "\t" + lastLoggedIn + "\t" + education + "\t" + projects+
		                               "\t" + companies + "\t" + experience +
		                               "\t" + skills);
		            
		            usersResult.setFirstname(firstName);
		            usersResult.setLastname(lastName);
		            usersResult.setCity(city);
		            usersResult.setMobile(mobile);
		            usersResult.setLastloggedin(lastLoggedIn);
		            usersResult.setEducation(education);
		            usersResult.setProjects(projects);
		            usersResult.setCompanies(companies);
		            usersResult.setExperience(experience);
		            usersResult.setSkills(skills);
		            usersResult.setValidate(true);
		            usersResult.setErrorMessage(null);
		            
		        }
		        rowcount=stmt.executeUpdate(query1);
		        
			}
			else
			{
				System.out.println("inside Signin Else");
				usersResult.setValidate(false);
				usersResult.setErrorMessage("Invalid Login");
			}
		} catch (SQLException e) {

			System.out.println("Inside DatabaseConnection.java exception");
			System.out.println("Printing error message: "+e.getMessage());
			usersResult.setErrorMessage(e.getMessage());
			usersResult.setValidate(false);
			return usersResult;
		}
		//System.out.println("DBCONN.java Result: "+result);
		return usersResult;
	}
	
	
	public UsersBean getProfile (String emailid){
		
		UsersBean usersResult = new UsersBean();

		String firstName, lastName, city, mobile, lastLoggedIn, education, projects, companies, experience, skills;
		try {
		
			String query = "select firstname, lastname, city, mobile, lastloggedin, education, projects, companies, experience, skills ";
			query+="from users u left join user_details ud on u.emailid=ud.emailid where u.emailid='"+emailid+"'";

			
			
			System.out.println("select query: "+query);

			ResultSet rs = stmt.executeQuery(query);

	        while (rs.next()) {
	            firstName = rs.getString("firstname"); lastName=rs.getString("lastname"); city=rs.getString("city");
	            mobile = rs.getString("mobile"); lastLoggedIn=rs.getString("lastloggedin"); education=rs.getString("education");
	            projects=rs.getString("projects");companies=rs.getString("companies"); experience=rs.getString("experience");
	            skills=rs.getString("skills");
	            System.out.println(firstName + "\t" + lastName + "\t" + city + "\t" + mobile + "\t" + lastLoggedIn + "\t" + education + "\t" + projects+
	                               "\t" + companies + "\t" + experience +
	                               "\t" + skills);
	            
	            usersResult.setFirstname(firstName);
	            usersResult.setLastname(lastName);
	            usersResult.setCity(city);
	            usersResult.setMobile(mobile);
	            usersResult.setLastloggedin(lastLoggedIn);
	            usersResult.setEducation(education);
	            usersResult.setProjects(projects);
	            usersResult.setCompanies(companies);
	            usersResult.setExperience(experience);
	            usersResult.setSkills(skills);
	            usersResult.setValidate(true);
	            usersResult.setErrorMessage(null);
	        }

		} catch (SQLException e) {

			System.out.println("Inside DatabaseConnection.java getProfile exception");
			System.out.println("Printing error message: "+e.getMessage());
			usersResult.setErrorMessage(e.getMessage());
			return usersResult;
		}
		return usersResult;
	}
	
	
	
	
	public void updateProfile (String user, String sum, String exp, String edu, String proj)
	{

		try 
		{
		
			String query = "update user_details set education='"+edu+"', skills='"+sum+"', experience='"+exp+"', projects='"+proj+"' where emailid='"+user+"'";

			System.out.println("select query: "+query);

			int rowcount = stmt.executeUpdate(query);

		} catch (SQLException e) {

			System.out.println("Inside DatabaseConnection.java updateProfile exception");
			System.out.println("Printing error message: "+e.getMessage());
		}
	}
	
	
	public String[] getConnections(String emailid){
		String[] result = null;
		
		
		try 
		{

			String query = "select FirstName, LastName, c.connectionid as email from users u, connections c";
				query+="	where u.emailid=c.connectionid and c.emailid = '"+emailid+"'";
				query+="	and c.connectionid in (select c1.emailid from connections c1 where c1.connectionid= '"+emailid+"');";
			
			
			ArrayList<String> al = new ArrayList<String>(); 
			System.out.println("Insert query1: "+query);
			ResultSet rs = stmt.executeQuery(query);
			int i=0;
			System.out.println("Printing connections: ");
			
	        while (rs.next()) {
	            al.add(i, rs.getString("FirstName")+";"+rs.getString("LastName")+";"+rs.getString("email"));
	            System.out.println(al.get(i));
	            i++;
	        }
	        
	        System.out.println("after printing conns");
	        
	        if(al.size()!=0)
	        	{
	        		System.out.println("Inside IF dbconn.getConnections");
	        		result= new String[al.size()];
	        		System.out.println("converting to array dbconn.getConnections");
	        		result=al.toArray(result);
	        		System.out.println("after converting to array dbconn.getConnections");
	        	}
	        else
	        {
	        	System.out.println("Inside else dbconn.getConnections");
	        	result=new String[1];
	        	result[0]="No Connections.";
	        }
	        	
	        System.out.println("before catch");
			
		} catch (SQLException e) {
			
			
			System.out.println("Inside DatabaseConnection.java: getConnections exception");
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Printing error message: "+e.getMessage());
			//return false;
			result[0]=("exception");
			return result;
		}
		System.out.println("after catch");
		System.out.println("DBCONN.java Result: result length: "+result.length);
		return result;
	}
	
	
	
	public String[] getConnReq(String emailid){
		
		String[] result = null;
		
		
		try 
		{

			String query = "select FirstName, LastName, u.emailid as email from users u, connections c where u.emailid=c.emailid and c.connectionid='"+emailid+"' "
					+ "and u.emailid not in (select c1.connectionid from connections c1 where c1.emailid='"+emailid+"');"; 
			
			
			ArrayList<String> al = new ArrayList<String>(); 
			System.out.println("Conn Req Query: "+query);
			ResultSet rs = stmt.executeQuery(query);
			int i=0;
			System.out.println("Printing connection Requests: ");
			
	        while (rs.next()) {
	            al.add(i, rs.getString("FirstName")+";"+rs.getString("LastName")+";"+rs.getString("email"));
	            System.out.println(al.get(i));
	            i++;
	        }
	        
	        System.out.println("after printing conns");
	        
	        if(al.size()!=0)
	        	{
	        		System.out.println("Inside IF dbconn.getConnections");
	        		result= new String[al.size()];
	        		System.out.println("converting to array dbconn.getConnections");
	        		result=al.toArray(result);
	        		System.out.println("after converting to array dbconn.getConnections");
	        	}
	        else
	        {
	        	System.out.println("Inside else dbconn.getConn REQUESTS");
	        	result=new String[1];
	        	result[0]="No Connections.";
	        }
	        	
	        System.out.println("before catch");
			
		} catch (SQLException e) {
			
			
			System.out.println("Inside DatabaseConnection.java: Conn REQ exception");
			// TODO Auto-generated catch block
			//e.printStackTrace();
			System.out.println("Printing error message: "+e.getMessage());
			//return false;
			result[0]=("exception");
			return result;
		}
		System.out.println("after catch");
		System.out.println("DBCONN.java Conn REQ Result: result length: "+result.length);
		return result;
	}


}
