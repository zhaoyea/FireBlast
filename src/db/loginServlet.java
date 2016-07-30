package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
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
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		response.setContentType("text/html");

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM members WHERE Email=? AND Password=?");
			pstmt.setString(1, email);
			pstmt.setString(2, password);			

			ResultSet rs = pstmt.executeQuery();			
			
			if (rs.next()) {
				String userType = rs.getString("type");				
				if (userType.equals("a")){
					session.setAttribute("loggedIn", "admin");
					RequestDispatcher rd = request.getRequestDispatcher("DemoAdmin.jsp");
					rd.forward(request, response);
				} else {
					session.setAttribute("loggedIn", "user");
					RequestDispatcher rd = request.getRequestDispatcher("DemoIndexUser.jsp");
					rd.forward(request, response);
				}
			} else {
				request.setAttribute("message", "Username or password error!");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		} catch (

		Exception e) {
			out.println("Error :" + e);
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
