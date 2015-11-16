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
public class SignOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignOut() {
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
		//PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		//String qdone;		 
		 try
		 {			
				HttpSession session = request.getSession();
				session.removeAttribute("user");
				session.removeAttribute("userSession");
				request.logout();
				
				RequestDispatcher rd=request.getRequestDispatcher("/View/SignUp.jsp");
				rd.forward(request, response);
		 }
		 catch (Exception e)
        {
		 	System.out.println("Inside SignOut.java exception");
            e.printStackTrace();
        }
	}

}
