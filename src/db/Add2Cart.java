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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		
		String quantity = request.getParameter("quantity");
		int gameID = Integer.parseInt(request.getParameter("GameID"));
		String console = request.getParameter("console");
		User user = null;		
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
				
		user = (User)session.getAttribute("User");
		CartManager cart = new CartManager();
		
		int userID = user.getUserid();
		
		ArrayList<Cart> cartList = cart.displayCart(userID);
		session.setAttribute("displayCart", cartList);
		
		if(cart.checkCart(gameID)) {
			cart.updateCart(gameID, quantity);	
		} else {
			cart.add2Cart(userID, gameID, console, quantity);
		}
		
		
		
		
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
