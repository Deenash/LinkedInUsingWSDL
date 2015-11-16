package connection;

import java.util.ArrayList;
import java.util.HashMap;

import javax.jws.WebService;

@WebService
public class Service {
	DatabaseConnection db=new DatabaseConnection();
	
	public String signUp(String userName, String password, String fName, String lName, String city, String mobile)
	{
		System.out.println("Inside Singup");
		String result;
		
		//validation
		
		result=db.signUp(userName, password, fName, lName, city, mobile);
		return result;
	}
	
	public UsersBean signIn(String user, String pass)
	{
		UsersBean userResult= new UsersBean();
		System.out.println("Inside SignIn");
		
		
		//validation
		
		userResult=db.signIn(user,pass);
		return userResult;
	}
	
	public UsersBean getProfile(String user)
	{
		UsersBean userResult= new UsersBean();
		System.out.println("Inside SignIn");

		//validation
		
		userResult=db.getProfile(user);
		return userResult;
	}
	
	public void updateProfile(String user, String sum, String exp, String edu, String proj)
	{
		db.updateProfile(user, sum, exp, edu, proj);
	}
	
	public String[] getConnections(String user)
	{
		System.out.println("Inside getConnections");
		
		//validation
		
		String[] result=db.getConnections(user);
		return result;
	}
	public String[] getConnReq(String user)
	{
		System.out.println("Inside getConnections");
		
		//validation
		
		String[] result=db.getConnReq(user);
		return result;
	}
}

