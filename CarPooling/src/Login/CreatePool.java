package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreatePool
 */
@WebServlet("/CreatePool")
public class CreatePool extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePool() {
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
		   String starttime=request.getParameter("starttime");
	       String from=request.getParameter("from");
	       String to=request.getParameter("to");
	       String via=request.getParameter("via");
	       String vehicleid=request.getParameter("vehicleid");
	       int occupancy=Integer.parseInt(request.getParameter("occupancy"));
	       SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	       Date date = null;
		try {
			date = simpleDateFormat.parse(starttime);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	       
	      
	       try{
	    	   
	    	     Connection con=MySQLCon.main(null);
	    	    
	    	  
	    	     String sql="INSERT INTO pools (owner,startTime,startFrom,upTo,via,vehicle,occupancy,availability) VALUES(?,?,?,?,?,?,?,?);";
	     	     PreparedStatement p=con.prepareStatement(sql);
	    	     
	    	     p.setString(1, username);
	    	     Timestamp timestamp = new Timestamp(date.getTime());
	    	     p.setTimestamp(2, timestamp);
	    	     p.setString(3, from);
	    	     p.setString(4, to);
	    	     p.setString(5, via);
	    	     p.setString(6, vehicleid);
	    	     p.setInt(7, occupancy);
	    	     p.setInt(8, occupancy);
	    	     
	    	     p.executeUpdate();
		 		 System.out.println("Record is inserted into Pool table!");
		 		 response.sendRedirect("CreatePoolSuccess.jsp");
		    	   
	    	    
	    	   
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
