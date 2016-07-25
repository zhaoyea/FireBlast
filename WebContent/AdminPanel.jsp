<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Panel</title>

<!-- Bootstrap Core CSS-->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

</head>
<body>

	<%@ include file="navBar.jsp"%>
	<%@include file="loginCheck.jsp" %>
	<br>

	<br>

	<br>
	
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">

				<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> View
						tables<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">Games <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="searchBar.jsp">All Games</a></li>
								<li><a href="admin-playstation.jsp">Playstation games</a></li>
								<li><a href="admin-xbox.jsp">xBox Games</a></li>
								<li><a href="admin-pc.jsp">PC Games</a></li>
							</ul> <!-- /.nav-third-level --></li>

						<li><a href="searchGenreResults.jsp">Genre</a></li>
						<li><a href="#">Members <span class="fa arrow"></span></a>
							<ul class="nav nav-third-level">
								<li><a href="searchAdminTable.jsp">Admin</a></li>
								<li><a href="searchMemberTable.jsp">Members</a></li>
							</ul> <!-- /.nav-third-level --></li>
						<li><a href="searchComment.jsp">Comment</a></li>	
					</ul> <!-- /.nav-second-level --></li>

				<li><a href="#"><i class="fa fa-wrench fa-fw"></i> Insert<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="insertGames.jsp">Game</a></li>
						<li><a href="insertGenre.jsp">Genre</a></li>
					</ul> <!-- /.nav-second-level --></li>
			</ul>
		<!-- /.sidebar-collapse -->
	</div>
</div>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="js/jquery.dataTables.min.js"></script>
	<script src="js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="js/sb-admin-2.js"></script>
</body>
</html>