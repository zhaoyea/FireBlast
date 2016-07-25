<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="db.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LiquidBlast Gaming</title>
</head>
<body>
	<%@ include file="navBar.jsp"%>

	<%
		String GameID = request.getParameter("id");

		try {
			Connection conn = DBConn.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM Games WHERE GameID=?");
			pstmt.setString(1, GameID);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
	%>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header"><%=rs.getString("Name")%>
				</h1>
				<ol class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li class="active"><%=rs.getString("Name")%></li>
				</ol>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-responsive" src="<%=rs.getString("GameImageLink")%>"
					alt="<%=rs.getString("Name")%>" width="320" height="400">
			</div>

			<div class="col-md-4">
				<h3>Game Description</h3>
				<%=rs.getString("Description")%>
				<h3>Genre</h3>
				<%
					PreparedStatement getGenre = conn.prepareStatement(
									"SELECT * FROM Games a, Genre b, GamesGenre c WHERE a.GameID = c.GameID AND b.GenreID = c.GenreID AND c.gameID = ? ");
							getGenre.setString(1, GameID);
							ResultSet genre = getGenre.executeQuery();

							while (genre.next()) {
				%>
				<button type="button" class="btn btn-default">
					<%=genre.getString("b.Genre")%>
					<%
						}
								genre.close();
					%>
				</button>
				<hr>
				<a class="btn btn-lg btn-default btn-block" href="#">Buy now at
					only $<%=rs.getString("Price")%></a>
			</div>
		</div>
		<!-- Service Tabs -->


		<%
			}
				conn.close();
			} catch (Exception e) {
				out.println("Error :" + e);
			}
		%>


		<hr>

		<div class="col-lg-12">
			<h3 class="page-header">Related Games</h3>
		</div>

		<%
			String console = request.getParameter("console");
			String gid = request.getParameter("id");

			try {
				Connection conn = DBConn.getConnection();

				PreparedStatement pstmt = conn.prepareStatement(
						"SELECT * FROM Games WHERE console LIKE ? AND GameID NOT LIKE ? ORDER BY RAND() LIMIT 3");
				pstmt.setString(1, console);
				pstmt.setString(2, gid);

				ResultSet rs = pstmt.executeQuery();
		%>


		<!-- /.row -->

		<!-- Related Projects Row -->


		<div class="row">

			<%
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<div class="panel-body">
					<table>
						<tr>
							<a
								href="productPage.jsp?id=<%=rs.getString("GameID")%>&console=<%=rs.getString("Console")%>">
								<img src="<%=rs.getString("GameImageLink")%>"
								alt="<%=rs.getString("Name")%>" width="161px" height="220px">
							</a>
						</tr>
						<td><a
							href="productPage.jsp?id=<%=rs.getString("GameID")%>&console=<%=rs.getString("Console")%>"><%=rs.getString("Name")%></a></td>
					</table>
				</div>
			</div>
			<%
				}
			%>



		</div>
		<!-- /.row -->
		<hr>
		<!-- Comments Form -->
		<div class="well">
			<h4>Leave a Comment:</h4>
			<br>
			<form action="comment.jsp" method="post">
				<div class="form-group">
					<h5>Your Name:</h5><input class="form-control"
						name="commentorName">
				</div>
				<div class="form-group">
					<h5>Comment:</h5>
					<textarea class="form-control" rows="3" name="commentBox"></textarea>
				</div>
				<button type="submit" class="btn btn-primary" onclick="myFunction()">Submit</button>
			</form>
		</div>

		<!-- Posted Comments -->
		<%
			PreparedStatement getComment = conn.prepareStatement("SELECT Name,Comment FROM Comments");

				ResultSet comment = getComment.executeQuery();

				while (comment.next()) {
		%>
		<!-- Comment -->
		<div class="media">
			<a class="pull-left" href="#"> </a>
			<div class="media-body">
				<div class="media-body">
					<h4 class="media-heading">
						<%=comment.getString("Name") %> <small> August 25, 2014 at 9:30 PM</small>
					</h4>
					<%=comment.getString("Comment")%>
				</div>
			</div>
		</div>
		<%
			}
		%>

		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; LiquidBlast Gaming 2016</p>
			</div>
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<%
		conn.close();
		} catch (Exception e) {
			out.println("Error :" + e);
		}
	%>
	<script>
		function myFunction() {
			alert("Comment Added. Thanks for your Feedback!");
		}
	</script>
</body>
</html>