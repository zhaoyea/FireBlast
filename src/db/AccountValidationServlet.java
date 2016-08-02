package db;

import java.io.IOException;
import model.*;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AccountValidationServlet
 */
@WebServlet("/RegisterServlet")
public class AccountValidationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountValidationServlet() {
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

		String errMsg = "";
		String successMsg = "";
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String contact = request.getParameter("contactNumber");
		String address = request.getParameter("mailAddress");
		String email = request.getParameter("emailAddress");
		String password = request.getParameter("password");
		String reEnterPassword = request.getParameter("reEnterPassword");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		UserManager userDB = new UserManager();

		// check if the e-mail address does not start with @
		int emailStartsWithAt = email.indexOf('@');
		int emailEndsWith = email.lastIndexOf(".com");

		// check if email exist in the database

		// validation of form
		if (firstName == null && firstName.length() == 0) {
			errMsg = "<br>Please enter your first name!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (lastName == null && lastName.length() == 0) {
			errMsg = "<br/>Please enter your last name!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (contact == null || contact.length() > 8) {
			errMsg = "<br/>Please enter your contact number!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (address == null && address.length() == 0) {
			errMsg = "<br/>Please enter your address!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (email.length() == 0) {
			errMsg = "<br/>E-mail Address was not provided";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (email.indexOf('@') <= -1) {
			errMsg = "<br/>Invalid e-mail address - @ is not present";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (email.lastIndexOf(".com") <= -1) {
			errMsg = "<br/>Invalid e-mail address - (.com) is not present";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (emailStartsWithAt == 0) {
			errMsg = "<br>Invalid e-mail Address! It starts with @!!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} 
		else if (!password.matches("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")) {
			errMsg = "<br/>Password must include at least one upper case letter,<br/> One lower case letter<br/> One digit<br/> At least one special character<br/> And minium 8 in length";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (!password.equals(reEnterPassword)) {
			errMsg = "<br/>Password not match! <br/> Please enter the password again!";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else {
			userDB.insertUser(firstName, lastName, email, reEnterPassword, contact, address);
			successMsg = "Success! You can now login with " + User.getEmail() + ".";
			session.setAttribute("success", successMsg);
			response.sendRedirect("login.jsp");
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
