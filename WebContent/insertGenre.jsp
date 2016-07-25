<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS-->
<link href="css/table.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<title>Insert Games</title>
</head>
<body>
	<%@ include file="AdminPanel.jsp"%>


	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<center>
					<h1 class="page-header">Insert Genre</h1>
				</center>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-6">
				<form action="insertGenreToDB.jsp" method="post">
					<div class="form-group">
						<label>GenreID</label> <input class="form-control" name="GenreID">
					</div>
					<div class="form-group">
						<label>Insert New Genre</label> <input class="form-control" name="Genre">
					</div>					
					<button type="submit" class="btn btn-success">Insert</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>