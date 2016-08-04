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
		int updateQuantity = Integer.parseInt(request.getParameter("updateQuantity"));

		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
		GamesManager g = new GamesManager();

		if (updateQuantity == 0 || updateQuantity < 0) {
			cartError = "Please enter a valid quantity value!";
			session.setAttribute("cartError", cartError);
			response.sendRedirect("cart.jsp");
			return;
		} else if (updateQuantity > g.getGames(String.valueOf(gameID)).getQuantity()) {
			cartError = "Sorry not enough stock! Please enter a new value";
			session.setAttribute("cartError", cartError);
			response.sendRedirect("cart.jsp");
			return;
		} else {
			for (Cart c : cartList) {
				if (gameID == c.getGameID()) {
					c.setQuantity(updateQuantity);
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
