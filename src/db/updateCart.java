package db;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class updateCart
 */
@WebServlet("/updateCart")
public class updateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateCart() {
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
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		String cartError;
		int gameID = Integer.parseInt(request.getParameter("GameID"));
		String updateQuantity = request.getParameter("updateQuantity");
		Integer updateQuantityNumber = null;

		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
		GamesManager g = new GamesManager();
		
		
		try {
			if (updateQuantity == null || updateQuantity.isEmpty()) {
				cartError = "Please enter a valid quantity value!";
				session.setAttribute("cartError", cartError);
				response.sendRedirect(request.getHeader("Referer"));
				return;
			}
			updateQuantityNumber = Integer.parseInt(request.getParameter("updateQuantity"));
		} catch (final NumberFormatException e) {
			cartError = "Please enter a valid quantity value!";
			session.setAttribute("cartError", cartError);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}

		if (updateQuantityNumber == 0 || updateQuantityNumber < 0) {
			cartError = "Please enter a valid quantity value!";
			session.setAttribute("cartError", cartError);
			response.sendRedirect("cart.jsp");
			return;
		} else if (updateQuantityNumber > g.getGames(String.valueOf(gameID)).getQuantity()) {
			cartError = "Sorry not enough stock! Please enter a new value";
			session.setAttribute("cartError", cartError);
			response.sendRedirect("cart.jsp");
			return;
		} else {
			for (Cart c : cartList) {
				if (gameID == c.getGameID()) {
					c.setQuantity(updateQuantityNumber);
					response.sendRedirect("cart.jsp");
					return;
				}
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
