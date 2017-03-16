<%@page import="Login.MySQLCon"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.Console"%>	
<% if(session.getAttribute("uname")!=null)
{
    

%>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<title>Car Pool</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});
</script>


</script>
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
					action="<%=application.getContextPath() %>/CreatePool" method="post">
					<h2 align="center">Create Pool</h2>
					<div class="form-group">
						<label for="starttime" class="col-sm-3 control-label">Start Time</label>
						<div class="col-sm-7">
							<input type="text" id="starttime" name="starttime"
								placeholder="Starting Time(ex: 2016-01-01 01:01:00)"  class="form-control"  >

						</div>
					</div>		
					<div class="form-group">
						<label for="from" class="col-sm-3 control-label">From</label>
						<div class="col-sm-7">
							<input type="text" id="from" name="from"
								placeholder="Starting Location" class="form-control" >

						</div>
					</div>

					<div class="form-group">
						<label for="to" class="col-sm-3 control-label">To</label>
						<div class="col-sm-7">
							<input type="text" id="to" name="to" placeholder="Destination"
								class="form-control">
						</div>
					</div>
						<div class="form-group">
							<label for="via" class="col-sm-3 control-label">Via</label>
							<div class="col-sm-7">
								<input type="text" id="via" name="via"
									placeholder="Passing Through" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label" for="vehicle">Vehicle</label>
							<div class="col-sm-7">
								<select class="selectpicker form-control"
									
									id="vehicle" required="true" name="vehicleid">
									<option style="cursor: pointer;">Select Vehicle</option>
									<%
										try {

											int count = 0, flag = 0;
											Connection con = MySQLCon.main(null);
											String username=(String) session.getAttribute("uname");
											String sql2 = "SELECT vid, model FROM carpool_db.vehicles where uid ='"+username+"';";
											PreparedStatement p2 = con.prepareStatement(sql2);
											ResultSet r1 = p2.executeQuery();
											while (r1.next()) {
									%>
									<option style="cursor: pointer;" value =<%=r1.getString(1)%>><%=r1.getString(2)%></option>
									<%
										}

										} catch (Exception e) {
											e.printStackTrace();
										}
									%>

								</select>

							</div>
						</div>
						<div class="form-group">
							<label for="occupancy" class="col-sm-3 control-label">Occupancy</label>
							<div class="col-sm-7">
								<input type="number" id="occupancy" name="occupancy"
									placeholder="can take(excluding you)" class="form-control">
							</div>
						</div>
						<div class="form-group">
						<div class="col-sm-7 col-sm-offset-3">
							<button type="submit" class="btn btn-primary btn-block">Create</button>
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