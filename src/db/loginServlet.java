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

import model.*;

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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

		String inputEmail = request.getParameter("email");
		String inputPassword = request.getParameter("password");

		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String errMsg;
		String userType = "u";

		if (inputEmail == null || inputEmail.isEmpty() || inputPassword == null || inputPassword.isEmpty()) {
			errMsg = "Username or Password wrong! <br/> Please try again!";
			session.setAttribute("errMsg", errMsg);
			response.sendRedirect("login.jsp");
		} else {
			UserManager db = new UserManager();
			User user = db.getUser(inputEmail, inputPassword);			

			if (user == null) {
				errMsg = "Username or Password wrong! <br/> Please try again!";
				session.setAttribute("errMsg", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			if (inputEmail.equals(user.getEmail()) && inputPassword.equals(user.getPassword())) {
				if (userType.equals(user.getType())) {					
					session.setAttribute("User", user);					
					session.setAttribute("Username", user.getFirstName() + " " + user.getLastName());
					response.sendRedirect("DemoIndex.jsp");
					return;
				} else {
					session.setAttribute("Username", "Admin");
					response.sendRedirect("AdminPanel.jsp");
					return;
				}
			} else {
				errMsg = "Username and Password wrong! <br/> Please try again!";
				session.setAttribute("errMsg", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
		}
		doGet(request, response);
	}

}
