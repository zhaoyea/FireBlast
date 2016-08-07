package db;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/UpdateUserServlet")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUserServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String profileError = "";		
		String firstName = request.getParameter("newFirstName");
		String lastName = request.getParameter("newLastName");
		String contact = request.getParameter("newContactNumber");
		String address = request.getParameter("newMailAddress");
		String email = request.getParameter("newEmailAddress");
		String password = request.getParameter("newPassword");
		String reEnterPassword = request.getParameter("reEnterPassword");		
		HttpSession session = request.getSession();

		if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || contact == null
				|| contact.isEmpty() || address == null || address.isEmpty() || email == null || email.isEmpty()
				|| password == null || password.isEmpty()) {
			profileError = "You did not fill in all the fills! <br/> Please fill them in";
			session.setAttribute("profileError", profileError);
			response.sendRedirect("UpdateMemberDetails.jsp");
			return;
		}

		// validation of form
		else

		{
			try {
				if (contact.length() != 8) {
					profileError = "Invalid contact number! Please input only 8 digits.";
					session.setAttribute("profileError", profileError);
					response.sendRedirect("UpdateMemberDetails.jsp");
					return;
				}
				int contactNumber = Integer.parseInt(request.getParameter("newContactNumber"));
			} catch (NumberFormatException e) {
				profileError = "Invalid contact number! Please input only 8 digits.";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}

			// check if the e-mail address does not start with @
			int emailStartsWithAt = email.indexOf('@');
			int emailEndsWith = email.lastIndexOf(".com");
			if (email.indexOf('@') <= -1) {
				profileError = "<br/>Invalid e-mail address - @ is not present";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}
			if (email.lastIndexOf(".com") <= -1) {
				profileError = "<br/>Invalid e-mail address - (.com) is not present";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}
			if (emailStartsWithAt == 0) {
				profileError = "<br>Invalid e-mail Address! It starts with @!!<br>";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}
			if (emailEndsWith == 0) {
				profileError = "Invalid e-mail Address! It starts with .com <br/>";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}
			if (!password.matches("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$")) {
				profileError = "<br/>Password must include at least one upper case letter,<br/> One lower case letter<br/> One digit<br/> At least one special character<br/> And minium 8 in length";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}
			if (!password.equals(reEnterPassword)) {
				profileError = "<br/>Password not match! <br/> Please enter the password again!";
				session.setAttribute("profileError", profileError);
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}

			UserManager userDB = new UserManager();
			
			if (email.equals(((User)session.getAttribute("User")).getEmail())) {
				userDB.updateUser(((User)session.getAttribute("User")).getUserid(),firstName, lastName, email, reEnterPassword, contact, address);				
				session.setAttribute("updateProfile", "Success! Your details has been updated!");	
				response.sendRedirect("profile.jsp");
				return;
			}
			
			else if (userDB.checkDBEmail(email)) {
				profileError = "Error! Email already registered!";
				session.setAttribute("profileError", profileError);
				userDB.close();
				response.sendRedirect("UpdateMemberDetails.jsp");
				return;
			}

			else {
				userDB.updateUser(((User)session.getAttribute("User")).getUserid(),firstName, lastName, email, reEnterPassword, contact, address);				
				session.setAttribute("updateProfile", "Success! Your details has been updated!");	
				response.sendRedirect("profile.jsp");
				return;
			}
		}
	}
}
