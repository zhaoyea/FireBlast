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
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		// String gender = request.getParameter("gender");
		String contactNumber = request.getParameter("contactNumber");
		String mailAddress = request.getParameter("mailAddress");
		String emailAddress = request.getParameter("emailAddress");
		String password = request.getParameter("password");
		String reEnterPassword = request.getParameter("reEnterPassword");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		// check if the e-mail address does not start with @
		int emailAddressStartsWithAt = emailAddress.indexOf('@');
		int emailAddressEndsWith = emailAddress.lastIndexOf(".com");

		// validation of form
		if (firstName == null && firstName.length() == 0) {
			errMsg = "<br>Please enter your first name!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");		
		} else if (lastName == null && lastName.length() == 0) {
			errMsg = "<br/>Please enter your last name!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		} else if (contactNumber == null || contactNumber.length() > 8) {
			errMsg = "<br/>Please enter your contact number!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");	
		} else if (mailAddress == null && mailAddress.length() == 0) {
			errMsg = "<br/>Please enter your address!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");
		} else if (emailAddress.length() == 0) {
			errMsg = "<br/>E-mail Address was not provided";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		} else if (emailAddress.indexOf('@') <= -1) {
			errMsg = "<br/>Invalid e-mail address - @ is not present";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		} else if (emailAddress.lastIndexOf(".com") <= -1) {
			errMsg = "<br/>Invalid e-mail address - (.com) is not present";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		}
		else if (emailAddressStartsWithAt == 0) {
			errMsg = "<br>Invalid e-mail Address! It starts with @!!<br>";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		} else if (!password.matches("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")) {
			errMsg = "<br/>Password must include at least one upper case letter,<br/> One lower case letter<br/> One digit<br/> At least one special character<br/> And minium 8 in length";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		} else if (!password.equals(reEnterPassword)) {
			errMsg = "<br/>Password not match! <br/> Please enter the password again!";
			session.setAttribute("error", errMsg);
			response.sendRedirect("login.jsp");			
		} 
		else {
			try {
				Connection conn = DBConn.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(
						"INSERT INTO Members(FirstName,LastName,Email,Password,Contact,Address) VALUES(?,?,?,?,?,?)");

				pstmt.setString(1, firstName);
				pstmt.setString(2, lastName);
				pstmt.setString(3, emailAddress);
				pstmt.setString(4, password);
				pstmt.setString(5, contactNumber);
				pstmt.setString(6, mailAddress);

				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				out.println("Error :" + e);
			}
			
		}
		
		String successMsg = "";		
		UserManager userDB = new UserManager();		
		try {
			if (userDB.checkDBEmail(emailAddress)) {
				errMsg = "<br/>Email already registered!";
				session.setAttribute("error", errMsg);
				response.sendRedirect("login.jsp");
			} else {
				successMsg = "Success! You can now login with " + User.getEmail() + ".";
				session.setAttribute("sucess", successMsg);
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
