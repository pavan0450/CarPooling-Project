package Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Register
 */
@WebServlet("/register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   String username=request.getParameter("username");
	       String firstname=request.getParameter("firstname");
	       String email=request.getParameter("email");
	       String phoneno=request.getParameter("phoneno");
	       String password=request.getParameter("password");
	       String gender=request.getParameter("gender");
	       
	       
	       
	       System.out.println(gender+" gender");
	       System.out.println(password+" password");
	      
	       try{
	    	   
	    	     Connection con=MySQLCon.main(null);
	    	    
	    	  
	    	     String sql="insert into users values(?,?,?,?,?,?,?,?);";
	     	     PreparedStatement p=con.prepareStatement(sql);
	    	     
	    	     p.setString(1, username);
	    	     p.setString(2, password);
	    	     p.setString(3, firstname);
	    	     p.setString(4, phoneno);
	    	     p.setString(5, email);
	    	     p.setString(6, gender);
	    	     Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	    	     p.setTimestamp(7, timestamp);
	    	     p.setTimestamp(8, timestamp);
	    	     
	    	     p.executeUpdate();
		 		 System.out.println("Record is inserted into DBUSER table!");
		 		 response.sendRedirect("Login.jsp");
		    	   
	    	    
	    	   
	       }
	       catch(NullPointerException n)
	       {
	    	   n.printStackTrace();
	    	  
	       }
	       catch (Exception e) {
	    	  
			// TODO: handle exception
	    	   e.printStackTrace();
		}
	}

}
