package db;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class UpdateGenreServlet
 */
@WebServlet("/UpdateGenreServlet")
public class UpdateGenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGenreServlet() {
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
		HttpSession session = request.getSession();
		
		int genreID = Integer.parseInt(request.getParameter("genreID"));
		String updateGenre = request.getParameter("updateGenre");
		if (updateGenre==null || updateGenre.isEmpty()) {
			session.setAttribute("GenreField", "Field cannot be empty! Please enter again");
			response.sendRedirect(request.getHeader("Referer"));
			return;
		}
		else {
			GenreManager genre = new GenreManager();
			genre.updateGenre(updateGenre, genreID);
			session.setAttribute("GenreUpdate", "Genre updated!");
			response.sendRedirect("AdminGenre.jsp");
			return;
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
