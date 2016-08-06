package db;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import model.*;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class Payment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Payment() {
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
		HttpSession session = request.getSession();		
		
		String cardName = request.getParameter("cardName");
		String creditCardNumber = request.getParameter("creditCardNumber");
		String expiryMonth = request.getParameter("expiryMonth");
		String expiryYear = request.getParameter("expiryYear");
		String ccv = request.getParameter("ccv");
		
		System.out.println(cardName);

		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");

		if (cardName == null || cardName.isEmpty() || creditCardNumber == null || creditCardNumber.isEmpty()
				|| expiryMonth == null || expiryMonth.isEmpty() || expiryYear == null || expiryYear.isEmpty()
				|| ccv == null || ccv.isEmpty()) {
			session.setAttribute("paymentError", "Error! Please enter your credit card details again!");
			response.sendRedirect("payment.jsp");
		} else {
			for (Cart c : cartList) {
				TransactionManager purchasedGamesDB = new TransactionManager();
				purchasedGamesDB.insertPurchasedGames(c.getGameID(), c.getName(), c.getConsole(), c.getImageLink(),
						c.getQuantity(), c.getPrice());
				session.setAttribute("paymentDone", "Thanks for buying our game!");
				response.sendRedirect("receipt.jsp");				
			}
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
