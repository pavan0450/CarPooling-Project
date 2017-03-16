package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class VehicleRegister
 */
@WebServlet("/VehicleRegister")
public class VehicleRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VehicleRegister() {
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
		   HttpSession session=request.getSession();  
		   String username=(String) session.getAttribute("uname");
	       String model=request.getParameter("model");
	       String color=request.getParameter("color");
	       String registrationno=request.getParameter("registrationno");
	       String occupancy=request.getParameter("occupancy");
	      
	       
	       
	       
	       System.out.println(username+"username");
	       System.out.println(model+" model");
	      
	       try{
	    	   
	    	     Connection con=MySQLCon.main(null);
	    	    
	    	  
	    	     String sql="insert into vehicles (uid,model,color,regNo,occupancy) values(?,?,?,?,?);";
	     	     PreparedStatement p=con.prepareStatement(sql);
	    	     
	    	     p.setString(1, username);
	    	     p.setString(2, model);
	    	     p.setString(3, color);
	    	     p.setString(4, registrationno);
	    	     p.setString(5, occupancy);    	    
	    	   
	    	     
	    	     p.executeUpdate();
		 		 System.out.println("Record is inserted into Vehicles table!");
		 		 response.sendRedirect("RegisterVehicleSuccess.jsp");
		    	   
	    	    
	    	   
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
