package servlets;

import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ServiceProxy;
import connection.UsersBean;

/**
 * Servlet implementation class SignUp
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String qdone;
		UsersBean bean;
		 try{			
			 	String user = request.getParameter("emailid");
			 	String pass = request.getParameter("pass1");
			 	String fName = request.getParameter("firstname");
			 	String lName = request.getParameter("lastname");
			 	String city = request.getParameter("city");
			 	String mobile = request.getParameter("mobNumber");
			 	
			 	System.out.println("User: "+user);
			 	System.out.println("pass: "+pass);
			 	
			 	proxy.setEndpoint("http://localhost:8080/LinkedIn/services/Service");
			 	
				qdone = proxy.signUp(user,pass,fName,lName,city,mobile);
				System.out.println("Before creating Session, query result: "+qdone);
				HttpSession session = request.getSession();
				System.out.println("Printing Session: "+session);
				if(qdone.substring(0,4).equals("true")){
					session.setAttribute("userSession", session);
					session.setAttribute("user", user);
					System.out.println("Session after setAttribute: "+session.getAttribute("user"));
					System.out.println("Session after setAttribute: "+session);
					
					bean = proxy.signIn(user,pass);
					
					request.setAttribute("fname", bean.getFirstname());
					request.setAttribute("lname", bean.getFirstname());
					request.setAttribute("time", bean.getLastloggedin());
					request.setAttribute("summary", bean.getSkills());
					request.setAttribute("experience", bean.getExperience());
					request.setAttribute("education", bean.getEducation());
					request.setAttribute("project", bean.getProjects());
					
					RequestDispatcher rd=request.getRequestDispatcher("/View/Profile.jsp");
					rd.forward(request, response);
					
					
					//request.setAttribute("message", "Created success");
//					RequestDispatcher rd=request.getRequestDispatcher("/View/SignUp.jsp");
//					  
//					rd.forward(request, response);
				}
				else
				{
					request.setAttribute("message", qdone);
					RequestDispatcher rd=request.getRequestDispatcher("/View/SignUp.jsp");
					rd.forward(request, response);
				}
		 }
		 catch (Exception e)
	        {
			 System.out.println("Inside SignUp.java exception");
	            e.printStackTrace();
	        }
	}

}
