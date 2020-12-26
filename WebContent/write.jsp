<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />

<title>Kassaboken</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Kassaboken</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<%
				if (userID.equals("guest")) {
				%>
				<li class="nav-item"><a class="nav-link" href="#">Read</a></li>
				<%
				} else if (userID.equals("Erik") || userID.equals("Yoonjoo")) {
				%>
				<li class="nav-item"><a class="nav-link" href="#">Write</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Read</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Calculate</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</nav>

	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">

				<div class="form-group">
					<div class="input-group date" id="datetimepicker1"
						data-target-input="nearest">
						<input type="text" class="form-control datetimepicker-input"
							data-target="#datetimepicker1">
						<div class="input-group-append" data-target="#datetimepicker1"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-calendar"></i>
							</div>
						</div>
					</div>
				</div>

				<div class="input-group mb-3">
					<span class="input-group-text">SEK</span> <input type="text"
						class="form-control" aria-label="Amount" name = "belopp"> <span
						class="input-group-text">.00</span>
				</div>

				<div class="input-group mb-3">
					<select class="form-control form-control-md mb-3" id="category"
						onchange="categoryChange(this)">
						<option selected>Category</option>
						<option value="supermarket" name = "supermarket">Supermarket</option>
						<option value="restaurant" name = "restaurant">Restaurant</option>
					</select> 
					<select class="form-control form-control-md mb-3" id="place">
						<option>Place</option>
					</select>
				</div>

				<input type="submit" class="btn btn-primary pull-right"
					value="Write">
			</form>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/custom.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
	<script type="text/javascript">
		$('#datetimepicker1').datetimepicker({
			format : 'L',
			defalutDate : new Date()
		});
	</script>


</body>
</html>