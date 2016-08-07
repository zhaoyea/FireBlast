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
import java.sql.*;
import java.util.ArrayList;

/**
 * Servlet implementation class Add2Cart
 */
@WebServlet("/Add2Cart")
public class Add2Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Add2Cart() {
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

		String inputQuantityError;
		int gameID = Integer.parseInt(request.getParameter("GameID"));
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		String imageLink = request.getParameter("imageLink");
		String console = request.getParameter("console");
		String inputQuantity = request.getParameter("inputQuantity");
		Integer inputQuantityNumber = null;
		int dbQuantity = Integer.parseInt(request.getParameter("dbQuantity"));

		ArrayList<Cart> cartList = (ArrayList<Cart>) session.getAttribute("displayCart");
		Games g = new Games();

		if (cartList == null) {
			cartList = new ArrayList<Cart>();
		}

		
		try {
			if (inputQuantity == null || inputQuantity.isEmpty()) {
				inputQuantityError = "Please enter a valid quantity value!";
				session.setAttribute("inputQuantityError", inputQuantityError);
				response.sendRedirect(request.getHeader("Referer"));
				return;
			}
			inputQuantityNumber = Integer.parseInt(request.getParameter("inputQuantity"));
		} catch (final NumberFormatException e) {
			inputQuantityError = "Please enter a valid quantity value!";
			session.setAttribute("inputQuantityError", inputQuantityError);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}

		

		if (inputQuantityNumber == 0 || inputQuantityNumber < 0) {
			inputQuantityError = "Please enter a valid quantity value!";
			session.setAttribute("inputQuantityError", inputQuantityError);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}
		if (inputQuantityNumber > dbQuantity) {
			inputQuantityError = "Sorry not enough stock! Please enter a new value";
			session.setAttribute("inputQuantityError", inputQuantityError);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		} else {
			for (Cart c : cartList) {
				if (gameID == c.getGameID()) {
					c.setQuantity(c.getQuantity() + inputQuantityNumber);
					response.sendRedirect("cart.jsp");
					return;
				}
			}
			Cart cart = new Cart(gameID, name, description, price, imageLink, console, inputQuantityNumber);
			cartList.add(cart);
			session.setAttribute("displayCart", cartList);
			response.sendRedirect("cart.jsp");
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
