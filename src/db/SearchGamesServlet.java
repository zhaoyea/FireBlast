package db;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import java.util.ArrayList;

/**
 * Servlet implementation class SearchGamesServlet
 */
@WebServlet("/SearchGamesServlet")
public class SearchGamesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchGamesServlet() {
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
		HttpSession session = request.getSession();

		String searchString = request.getParameter("searchString");		
		String adminSearch = (String) session.getAttribute("AdminSearch");
		
		GamesManager db = new GamesManager();
		ArrayList<Games> GameResults = db.searchGames(searchString);
		ArrayList<Games> AdminGame = db.searchGames(adminSearch);

		
		session.setAttribute("GameResults", GameResults);
		session.setAttribute("AdminGameResults", AdminGame);

		if (session.getAttribute("searchCode").equals("user")) {
			RequestDispatcher rd = request.getRequestDispatcher("DemoSearch.jsp");
			rd.forward(request, response);
		} else if (session.getAttribute("searchCode").equals("admin")){
			RequestDispatcher rd = request.getRequestDispatcher("AdminSearchGames.jsp");
			rd.forward(request, response);
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
