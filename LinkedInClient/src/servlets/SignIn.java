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
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
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
		UsersBean qdone;		 
		 try{			
			 	String signInUser = request.getParameter("userid");
			 	String signInPass = request.getParameter("pass");
			 	
			 	System.out.println("User: "+signInUser);
			 	System.out.println("pass: "+signInPass);
			 	
			 	proxy.setEndpoint("http://localhost:8080/LinkedIn/services/Service");
			 	
				qdone = proxy.signIn(signInUser,signInPass);
				System.out.println("Before creating Session, query result: "+qdone);
				
				HttpSession session = request.getSession();
				System.out.println("Printing Session: "+session);
				
				if(qdone.getValidate()==true){
					
					session.setAttribute("userSession", session);
					session.setAttribute("user", signInUser);
					System.out.println("Session after setAttribute: "+session.getAttribute("user"));
										
					request.setAttribute("fname", qdone.getFirstname());
					request.setAttribute("lname", qdone.getFirstname());
					request.setAttribute("time", qdone.getLastloggedin());
					request.setAttribute("summary", qdone.getSkills());
					request.setAttribute("experience", qdone.getExperience());
					request.setAttribute("education", qdone.getEducation());
					request.setAttribute("project", qdone.getProjects());
					
					RequestDispatcher rd=request.getRequestDispatcher("/View/Profile.jsp");
					rd.forward(request, response);
				}
				else if(qdone.getValidate()==false)
				{
					System.out.println("Error message: "+qdone.getErrorMessage());
					request.setAttribute("message", qdone.getErrorMessage());
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
