<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>	
	<%
		if (session.getAttribute("Username") == null || session.getAttribute("User") != null) {
			response.sendRedirect("ErrorPage.jsp");	
		} else {
	%>
	<%@ include file="AdminNavBar.jsp"%>
	<%
		String GameID = request.getParameter("id");
			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM games WHERE GameID=?");
				pstmt.setString(1, GameID);

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
	%>
	<br />

	<div class="row columns">
		<nav aria-label="You are here:" role="navigation">
		<ul class="breadcrumbs">
			<li><a href="AdminGames.jsp">Games Tables</a></li>
			<li>Updating: <%=rs.getString("Name")%></li>
		</ul>
		</nav>
	</div>

	<form action="UpdateGamesServlet" method="post">
		<div class="row">
			<center>
				<%
					if (session.getAttribute("UpdateGameError") != null) {
				%>
				<div data-alert class="alert label">
					<strong>Error!</strong>
					<%=session.getAttribute("UpdateGameError")%>
				</div>
				<%
					session.removeAttribute("UpdateGameError");
								}
				%>
				<%
					if (session.getAttribute("UpdateGamesSuccess") != null) {
				%>
				<div data-alert class="success label">
					<strong>Success!</strong>
					<%=session.getAttribute("UpdateGamesSuccess")%>
				</div>
				<%
					session.removeAttribute("UpdateGamesSuccess");
								}
				%>
			</center>

			<hr>

			<div class="medium-6 columns">
				<img class="thumbnail" src="<%=rs.getString("GameImageLink")%>"
					alt="<%=rs.getString("Name")%>" width="350px" height="50px" /> <br />
				<span class="secondary label">Image Link</span> <input type="text"
					value="<%=rs.getString("GameImageLink")%>" name="newImageLink" />
			</div>



			<div class="medium-6 large-5 columns">
				<span class="secondary label">Game Name:</span><input type="text"
					value="<%=rs.getString("Name")%>" name="newGameName" />
				<p>
					<span class="secondary label">Description:</span>
					<textarea rows="15" name="newDescription"><%=rs.getString("Description")%></textarea>
				</p>

				<span class="secondary label">Genre:</span> <br />

				<%
					PreparedStatement getGamesGenre = conn.prepareStatement(
										"SELECT * FROM genre WHERE GenreID IN (SELECT GenreID FROM gamesgenre WHERE GameID=?)");
								getGamesGenre.setString(1, GameID);
								ResultSet gamesgenre = getGamesGenre.executeQuery();
								Map<Integer, String> genres = new HashMap<Integer, String>();

								while (gamesgenre.next()) {
									genres.put(gamesgenre.getInt(1), gamesgenre.getString(2));
								}
								gamesgenre.close();

								PreparedStatement getGenre = conn.prepareStatement("SELECT GenreID,Genre FROM Genre");

								ResultSet rs2 = getGenre.executeQuery();
								while (rs2.next()) {
				%>
				<input type="checkbox" value="<%=rs2.getInt(1)%>" name="genre"
					<%=genres.containsKey(rs2.getInt(1)) ? "checked" : ""%> />
				<%=rs2.getString(2)%>
				<br />

				<%
					}
								rs2.close();
				%>
				<span class="secondary label">Price</span> <input type="text"
					value="<%=rs.getDouble("Price")%>" name="newPrice" /> <span
					class="secondary label">Quantity</span> <input type="text"
					value="<%=rs.getInt("Quantity")%>" name="newQuantity">
			</div>
			<input type="hidden" value="<%=rs.getString("GameID")%>"
				name="gameID">
			<%
				}
						conn.close();
					} catch (Exception e) {
						out.println("Error :" + e);
					}
			%>

			<hr>

			<button type="submit" class="small expanded button">Update</button>
		</div>
	</form>
	<%
		}
	%>
</body>
</html>