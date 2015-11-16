package servlets;

import java.io.PrintWriter;
import java.io.IOException;
import java.util.ArrayList;

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
public class Connections extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceProxy proxy=new ServiceProxy();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connections() {
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
		String[] result;
		String fname[]=null;
		String lname[]=null;
		String email[]=null;

		 try{	
			 
			 	System.out.println("Inside Conn.java");
			 
			 	HttpSession session = request.getSession();
			 	String user = (String) session.getAttribute("user");
			 	
			 	System.out.println("Conn.java: Session User: "+user);
			 	
			 	proxy.setEndpoint("http://localhost:8080/LinkedIn/services/Service");
			 	System.out.println("asfd11");
				result = proxy.getConnections(user);	
				System.out.println("asdf12");
				ArrayList<String> a = new ArrayList<String>(),b = new ArrayList<String>(),c = new ArrayList<String>();
				
				System.out.println("asdf1");
				if(!result[0].equals("exception"))
				{
					System.out.println("asdf2");
					if(result[0].equalsIgnoreCase("No Connections."))
					{
						System.out.println("asdf3");
						fname=new String[1];
						fname[0]="No Connections.";
						lname=new String[1];
						lname[0]="";
						email=new String[1];
						email[0]="";
					}
					else
					{
						System.out.println("asdf4");
						for(int i=0; i<result.length;i++)
						{
							System.out.println("asdf21");
							String temp[]=result[0].split(";");
							System.out.println("asdf22");
							a.add(i, temp[0]);
							b.add(i, temp[1]);
							c.add(i, temp[2]);
							System.out.println("asdf23");
						}
						System.out.println("asdf5");
						
						fname=new String[a.size()];
						lname=new String[b.size()];
						email=new String[c.size()];
								
						fname=a.toArray(fname);
						lname=b.toArray(lname);
						email=c.toArray(email);
					}

				}
				else
				{
					System.out.println("asdf6");
					fname=new String[1];
					fname[0]="exception";
					lname=new String[1];
					lname[0]="";
					email=new String[1];
					email[0]="";
				}
				
				System.out.println("asdf7");

				
				request.setAttribute("fname", fname);
				request.setAttribute("lname", lname);
				request.setAttribute("email", email);
				
				RequestDispatcher rd=request.getRequestDispatcher("/View/Connections.jsp");
				rd.forward(request, response);


		 }
		 catch (Exception e)
	        {
			 System.out.println("Inside Connections.java exception");
	            e.printStackTrace();
	        }
	}

}
