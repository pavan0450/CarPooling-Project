package Login;

import java.io.IOException;
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
 * Servlet implementation class Profile
 */
@WebServlet("/Profile")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profile() {
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
		// TODO Auto-generated method stub
		   HttpSession session=request.getSession();  
		   String username=(String) session.getAttribute("uname");
	       String password=request.getParameter("password");
	       String name=request.getParameter("name");
	       String phoneNo=request.getParameter("phoneNo");
	       String email=request.getParameter("email");
	       String gender=request.getParameter("gender");
	       
	       
	      
	       try{
	    	   
	    	     Connection con=MySQLCon.main(null);
	    	    
	    	  
	    	     String sql = "UPDATE users SET password= ? , name= ?, phone = ?, email = ?, gender = ?, updated_on = ? WHERE username= ?";
	 			PreparedStatement p = con.prepareStatement(sql);

	 			p.setString(1, password.trim());
	 			p.setString(2, name.trim());
	 			p.setString(3, phoneNo.trim());
	 			p.setString(4, email.trim());
	 			p.setString(5, gender.trim());
	 			Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	    	    p.setTimestamp(6, timestamp);
	 			p.setString(7, username);

	 			p.executeUpdate();
		 		System.out.println("Record is update in Profile table!");
		 		request.setAttribute("success", "Profile Successfully updated");
		 		RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");  
	    	    rd.forward(request, response); 
		    	   
	    	    
	    	   
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
