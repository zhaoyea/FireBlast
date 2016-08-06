<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="AdminNavBar.jsp"%>
	<%
		String GameID = request.getParameter("id");
		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Games WHERE GameID=?");
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


				<span class="secondary label">Genre:</span>
				<%
					PreparedStatement getGenre = conn.prepareStatement(
									"SELECT * FROM Games a, Genre b, GamesGenre c WHERE a.GameID = c.GameID AND b.GenreID = c.GenreID AND c.gameID = ? ");
							getGenre.setString(1, GameID);
							ResultSet genre = getGenre.executeQuery();

							while (genre.next()) {
				%>

				<input type="text" value="<%=genre.getString("b.Genre")%>" name="newGameGenre" />

				<%
					}
							genre.close();
				%>




				<span class="secondary label">Price</span> <input type="text"
					value="$<%=rs.getDouble("Price")%>" name="newPrice" />
					
				<span class="secondary label">Quantity</span>
				<input type="text" value="<%=rs.getInt("Quantity") %>" name="newQuantity">
			</div>

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
</body>
</html>