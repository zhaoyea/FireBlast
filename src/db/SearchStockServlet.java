package db;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;

/**
 * Servlet implementation class SearchStockServlet
 */
@WebServlet("/SearchStockServlet")
public class SearchStockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchStockServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		
		String inputStockError;
		String adminSearch = (String) session.getAttribute("AdminSearch");	
		Integer stock = null;
		
		
		try {
			if (adminSearch == null || adminSearch.isEmpty()) {
				inputStockError = "Please enter a valid quantity value!";
				session.setAttribute("inputStockError", inputStockError);
				response.sendRedirect(request.getHeader("Referer"));
				return;
			}
			stock = Integer.parseInt(adminSearch);
			
		} catch (final NumberFormatException e) {
			inputStockError = "Please enter a valid quantity value!";
			session.setAttribute("inputStockError", inputStockError);
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}
		GamesManager db = new GamesManager();
		ArrayList<Stock> AdminGame = db.searchStock(stock);
		session.setAttribute("AdminStockResults", AdminGame);
		response.sendRedirect("AdminSearchStock.jsp");		
		
		
		
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
