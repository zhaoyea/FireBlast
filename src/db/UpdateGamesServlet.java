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
 * Servlet implementation class UpdateGamesServlet
 */
@WebServlet("/UpdateGamesServlet")
public class UpdateGamesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateGamesServlet() {
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

		GamesManager games = new GamesManager();
		int gameID = Integer.parseInt(request.getParameter("gameID"));
		String newImageLink = request.getParameter("newImageLink");
		String newGameName = request.getParameter("newGameName");
		String newDescription = request.getParameter("newDescription");
		double newPrice = Double.parseDouble(request.getParameter("newPrice"));
		int newQuantity = Integer.parseInt(request.getParameter("newQuantity"));
		
		String addGameGenre = request.getParameter("addGameGenre");

		if (newImageLink == null || newImageLink.isEmpty() || newGameName == null || newGameName.isEmpty()
				|| newDescription == null || newDescription.isEmpty()) {
			session.setAttribute("UpdateGameError", "Fields cannot be empty! Please fill in again!");
			response.sendRedirect(request.getHeader("Referer"));
			return;
		} else if (newPrice == 0 || newPrice < 0 || newQuantity == 0 || newQuantity < 0) {
			session.setAttribute("UpdateGameError", "Invalid Price or Quantity!");
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}		
		else {			
			
			games.updateGames(gameID, newGameName, newDescription, newPrice, newImageLink, newQuantity);
			String [] genre = request.getParameterValues("genre");		
			GamesGenreManager gamesgenre = new GamesGenreManager();
			gamesgenre.deleteGamesGenre(gameID);
			for (String s: genre) {
			    int genreID = Integer.parseInt(s);
			    gamesgenre.insertGamesGenre(gameID, genreID);
			   }						
			session.setAttribute("UpdateGamesSuccess", "Success! Game Updated!");
			response.sendRedirect(request.getHeader("Referer"));
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
