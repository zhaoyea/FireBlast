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
@WebServlet("/SearchGenreServlet")
public class SearchGenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchGenreServlet() {
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

		GenreManager db = new GenreManager();
		ArrayList<Genre> GenreResults = db.searchGenre(searchString);
		ArrayList<Genre> AdminGenre = db.searchGenre(adminSearch);

		
		session.setAttribute("GenreResults", GenreResults);
		session.setAttribute("AdminGenreResults", AdminGenre);

		if (session.getAttribute("searchCode").equals("user")) {
			RequestDispatcher rd = request.getRequestDispatcher("DemoSearch.jsp");
			rd.forward(request, response);
		} else if (session.getAttribute("searchCode").equals("admin")){
			RequestDispatcher rd = request.getRequestDispatcher("AdminSearchGenre.jsp");
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
