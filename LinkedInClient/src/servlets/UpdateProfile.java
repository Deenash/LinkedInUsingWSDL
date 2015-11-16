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
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
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
				HttpSession session = request.getSession();
				System.out.println("Printing Session: "+session);
			 	
			 	String user = (String) session.getAttribute("user");
			 	
			 	proxy.setEndpoint("http://localhost:8080/LinkedIn/services/Service");
			 	
			 	String sum=request.getParameter("summ1");
			 	String exp=request.getParameter("exp1");
			 	String edu=request.getParameter("education1");
			 	String proj=request.getParameter("projects1");
			 	
				proxy.updateProfile(user, sum, exp, edu, proj);
				
				System.out.println("<---After updation--->");
				

				qdone = proxy.getProfile(user);
				
				System.out.println("Before creating Session, query result: "+qdone);
									
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
		 catch (Exception e)
	        {
			 System.out.println("Inside SignUp.java exception");
	            e.printStackTrace();
	        }
	}

}
