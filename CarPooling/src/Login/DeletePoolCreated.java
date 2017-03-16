package Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DeletePoolCreated
 */
@WebServlet("/DeletePoolCreated")
public class DeletePoolCreated extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePoolCreated() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getParameter("poolid"));
		try {

			Connection con = MySQLCon.main(null);

			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("uname");		
			
			
			String sql1 = "DELETE FROM pools_users_membership WHERE poolId = ?";
			PreparedStatement p1 = con.prepareStatement(sql1);
			p1.setString(1, request.getParameter("poolid"));
			p1.executeUpdate();
			System.out.println("pool "+request.getParameter("poolid")+" is deleted from pools membership!");
			
			String sql = "DELETE FROM pools WHERE poolId = ?";
			PreparedStatement p = con.prepareStatement(sql);
			p.setString(1, request.getParameter("poolid"));
			p.executeUpdate();
			System.out.println("pool "+request.getParameter("poolid")+" is deleted from pools!");
			
			
			response.sendRedirect("MyPool.jsp");

		} catch (NullPointerException n) {
			n.printStackTrace();

		} catch (Exception e) {

			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
