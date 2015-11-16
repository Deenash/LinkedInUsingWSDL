package servlets;

import java.io.PrintWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.ServiceProxy;
import connection.UsersBean;

/**
 * Servlet implementation class SignUp
 */
public class EditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProfile() {
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
			 	String user = (String) session.getAttribute("user");
			 	
			 	System.out.println("Session User: "+user);
			 	
			 	proxy.setEndpoint("http://localhost:8080/LinkedIn/services/Service");
			 	
				qdone = proxy.getProfile(user);
				
				System.out.println("Before creating Session, query result: "+qdone);
									
				request.setAttribute("fname", qdone.getFirstname());
				request.setAttribute("lname", qdone.getLastname());
				request.setAttribute("summary", qdone.getSkills());
				request.setAttribute("experience", qdone.getExperience());
				request.setAttribute("education", qdone.getEducation());
				request.setAttribute("project", qdone.getProjects());
				
				RequestDispatcher rd=request.getRequestDispatcher("/View/editProfile.jsp");
				rd.forward(request, response);

		 }
		 catch (Exception e)
	        {
			 System.out.println("Inside EditProfile.java exception");
	            e.printStackTrace();
	        }
	}

}
