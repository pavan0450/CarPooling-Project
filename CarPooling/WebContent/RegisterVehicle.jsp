<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% if(session.getAttribute("uname")!=null)
{
    

%>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, shrink-to-fit=no, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Car Pool</title>
<link rel="icon" type="image/png" href="images/favicon-32x32.png"
	sizes="32x32" />
<link rel="icon" type="image/png" href="images/favicon-16x16.png"
	sizes="16x16" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="bootstrap/css/demo.css" />
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/component.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js">
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>

</script>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">


</head>

<body>

	<div id="wrapper">

		 <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a id="Profile" href="<%=application.getContextPath()%>/Profile.jsp">Profile</a>
                </li>
                <li>
                	<a id="viewPoolMenu" href="<%=application.getContextPath()%>/ViewPool.jsp">View Pools</a>
                </li>
                <li>
                   <a id="createPoolMenu" href="<%=application.getContextPath()%>/CreatePool.jsp">Create Pool</a>
                </li>
                <li>
                    <a id="joinPoolMenu" href="<%=application.getContextPath()%>/JoinPool.jsp">Join Pool</a>
                </li>
                <li>
                    <a id="editPoolMenu" href="<%=application.getContextPath()%>/MyPool.jsp">My Pools</a>
                </li>
                
                <li>
                    <a id="regVehicleMenu" href="<%=application.getContextPath()%>/RegisterVehicle.jsp">Register Vehicle</a>
                </li>
                <li>
                    <a id="myVehicleMenu" href="<%=application.getContextPath()%>/MyVehicle.jsp">My Vehicles</a>
                </li>
                 <li>
                    <a id="logout" href="<%=application.getContextPath()%>/Logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
		 <div class="container-fluid">
			<div class="container">
				<a href="#menu-toggle" style="background-color:black;color:white;" class="btn btn-default" id="menu-toggle">Pool
					Menu</a><br>	
				<form class="form-horizontal" id="contact-form" role="form"
					action="<%=application.getContextPath() %>/VehicleRegister" method="post">
					<h2 align="center">Register Vehicle</h2>
					<div class="form-group">
						<label for="model" class="col-sm-3 control-label">Model</label>
						<div class="col-sm-7">
							<input type="text" id="model" name="model"
								placeholder="Vehicle Model" class="form-control" autofocus>

						</div>
					</div>
					<div class="form-group">
						<label for="color" class="col-sm-3 control-label">Color</label>
						<div class="col-sm-7">
							<input type="text" id="color" name="color"
								placeholder="Vehicle Color" class="form-control" autofocus>

						</div>
					</div>

					<div class="form-group">
						<label for="registrationno" class="col-sm-3 control-label">Registration No</label>
						<div class="col-sm-7">
							<input type="text" id="registrationno" name="registrationno" placeholder="Reg #(ex. MS AD 104)"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="occupancy" class="col-sm-3 control-label">Occupancy</label>
						<div class="col-sm-7">
							<input type="number" id="occupancy" name="occupancy"
								placeholder="occupancy (Excluding Driver)" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-7 col-sm-offset-3">
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</div>
					</div>
				</form>
				<!-- /form -->
			</div>
			<!-- ./container -->
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>

</html>
<% }
else
{
     
      response.sendRedirect("Login.jsp");

 
}
%>