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
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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

		if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || contact == null
				|| contact.isEmpty() || address == null || address.isEmpty() || email == null || email.isEmpty()
				|| password == null || password.isEmpty()) {
			errMsg = "You did not fill in all the fills! <br/> Please fill them in";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
			return;
		}

		// validation of form
		else

		{			
			try {
				if (contact.length() != 8) {
					errMsg = "Invalid contact number! Please input only 8 digits.";
					session.setAttribute("error", errMsg);
					response.sendRedirect("login.jsp");
					return;
				}
				int contactNumber = Integer.parseInt(request.getParameter("contactNumber"));
			} catch (final NumberFormatException e) {
				errMsg = "Invalid contact number! Please input only 8 digits.";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			
			// check if the e-mail address does not start with @
			int emailStartsWithAt = email.indexOf('@');
			int emailEndsWith = email.lastIndexOf(".com");
			if (email.indexOf('@') <= -1) {
				errMsg = "<br/>Invalid e-mail address - @ is not present";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			if (email.lastIndexOf(".com") <= -1) {
				errMsg = "<br/>Invalid e-mail address - (.com) is not present";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			if (emailStartsWithAt == 0) {
				errMsg = "<br>Invalid e-mail Address! It starts with @!!<br>";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			if (emailEndsWith == 0) {
				errMsg = "Invalid e-mail Address! It starts with .com <br/>";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			if (!password.matches("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")) {
				errMsg = "<br/>Password must include at least one upper case letter,<br/> One lower case letter<br/> One digit<br/> At least one special character<br/> And minium 8 in length";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}
			if (!password.equals(reEnterPassword)) {
				errMsg = "<br/>Password not match! <br/> Please enter the password again!";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
				return;
			}

			UserManager userDB = new UserManager();

			if (userDB.checkDBEmail(email)) {
				errMsg = "Error! Email already registered!";
				session.setAttribute("error", errMsg);
				userDB.close();
				response.sendRedirect("login.jsp");
				return;
			}

			else {
				userDB.insertUser(firstName, lastName, email, reEnterPassword, contact, address);
				successMsg = "Success! You can now login";
				session.setAttribute("success", successMsg);
				response.sendRedirect("login.jsp");
				return;
			}
		}		
	}

}
