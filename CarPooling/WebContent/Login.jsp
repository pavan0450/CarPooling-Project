<%@page import="java.io.Console"%>
<%@ page language="java" import="Login.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="icon" type="image/png" href="images/favicon-32x32.png"
	sizes="32x32" />
<link rel="icon" type="image/png" href="images/favicon-16x16.png"
	sizes="16x16" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
</script>
<title>Login</title>

<meta name="description" content="">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript">
	$(function() {

		$('*:[unselectable=on]').mousedown(function(event) {

			event.preventDefault();
			return false;
		});
	});
</script>
<!-- Validation script 
<script type="text/javascript">
	$(document).ready(
			function() {

				$('#contact-form').validate(
						{
							rules : {
								username : {
									minlength : 4,
									required : true
								},
								
								password : {
									minlength : 6,
									required : true
								}
							},
							highlight : function(element) {
								$(element).closest('.form-group')
										.removeClass('success').addClass(
												'error');
							},
							success : function(element) {
								element.text('OK!').addClass('valid').closest(
										'.form-group').removeClass('error')
										.addClass('success');
							}
						});

			});
</script>-->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.
bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<form class="form-horizontal" role="form" id="contact-form"
			action="<%=application.getContextPath()%>/login" method="post">
			<h2 align="center">Login</h2>
			<div class="form-group">
				<label for="username" class="col-sm-4 control-label">User
					Name</label>
				<div class="col-sm-5">
					<input type="text" id="username" name="username"
						placeholder="User Name" class="form-control" autofocus>

				</div>
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-4 control-label">Password</label>
				<div class="col-sm-5">
					<input type="password" id="password" name="password"
						placeholder="Password" class="form-control">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-2 col-sm-offset-4">
					<button type="submit" value="Login"
						class="btn btn-primary btn-block btn-lg">Login</button>
				</div>
			
				<div class="col-sm-2">
					<a
						class="btn btn-primary btn-block btn-lg" href="<%=application.getContextPath()%>/Register.jsp">Register</a>
				</div>
			</div>
			<font color="red" style="font-family: monospace;"> <%
 	if (request.getAttribute("msg") != null) {
 		out.println(request.getAttribute("msg"));
 	}
 %>
			</font>
		</form>
		<!-- /form -->
	</div>
	<!-- ./container -->
</body>
</html>