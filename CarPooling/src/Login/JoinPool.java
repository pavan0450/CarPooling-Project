package Login;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class JoinPool
 */
@WebServlet("/JoinPool")
public class JoinPool extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinPool() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println(request.getParameter("poolid"));
		try {

			Connection con = MySQLCon.main(null);

			HttpSession session = request.getSession();
			String username = (String) session.getAttribute("uname");
			String sql = "UPDATE pools SET availability= availability-1 WHERE poolId= ?";
			PreparedStatement p = con.prepareStatement(sql);

			p.setString(1, request.getParameter("poolid"));

			p.executeUpdate();
			System.out.println("Record is updated in pools table!");

			String insert = "INSERT INTO pools_users_membership(poolId,username) VALUES(?,?);";
			PreparedStatement p1 = con.prepareStatement(insert);
			p1.setString(1, request.getParameter("poolid"));
			p1.setString(2, username);
			p1.executeUpdate();
			System.out.println("Record is inserted in pools_users_membership table!");

			PrintWriter pw = response.getWriter();

			response.sendRedirect("JoinPool.jsp");

		} catch (NullPointerException n) {
			n.printStackTrace();

		} catch (Exception e) {

			// TODO: handle exception
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
