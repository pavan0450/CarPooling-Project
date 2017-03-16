<%@page import="java.sql.*"%>
<%@page import="java.io.Console"%>
<%@ page language="java" import="Login.MySQLCon"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
				<li class="sidebar-brand"><a id="Profile"
					href="<%=application.getContextPath()%>/Profile.jsp">Profile</a></li>
				<li><a id="viewPoolMenu"
					href="<%=application.getContextPath()%>/ViewPool.jsp">View
						Pools</a></li>
				<li><a id="createPoolMenu"
					href="<%=application.getContextPath()%>/CreatePool.jsp">Create
						Pool</a></li>
				<li><a id="joinPoolMenu"
					href="<%=application.getContextPath()%>/JoinPool.jsp">Join Pool</a>
				</li>
				<li><a id="editPoolMenu"
					href="<%=application.getContextPath()%>/MyPool.jsp">My Pools</a></li>

				<li><a id="regVehicleMenu"
					href="<%=application.getContextPath()%>/RegisterVehicle.jsp">Register
						Vehicle</a></li>
				<li><a id="myVehicleMenu"
					href="<%=application.getContextPath()%>/MyVehicle.jsp">My
						Vehicles</a></li>
				<li><a id="logout"
					href="<%=application.getContextPath()%>/Logout.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->
		<!-- /#sidebar-wrapper -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="container">
					<a href="#menu-toggle" style="background-color:black;color:white;" class="btn btn-default" id="menu-toggle">Pool
					Menu</a><br>
					<form class="form-horizontal" id="contact-form" role="form"
						action="<%=application.getContextPath() %>/Profile" method="post">
						<h2 align="center">Profile</h2>

						<%
	        try{
		    	   
	   	     Connection con=MySQLCon.main(null);
	   	     
	   	     String username=(String) session.getAttribute("uname");
	   	  	 System.out.println(username+" username");
	   		 String sql="SELECT username, password, name, phone, email, gender FROM carpool_db.users where username='"+username+"';";

		     PreparedStatement p=con.prepareStatement(sql);
	   	    
		     ResultSet r=p.executeQuery();
	 	    
			     while(r.next()){  
			      	
			      %>

						<div class="form-group">
							<label for="userName" class="col-sm-3 control-label">User
								Name</label>
							<div class="col-sm-6">

								<textarea readonly="readonly" name='userName' id='username'
									class="form-control"><%=r.getString(1)%> </textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-3 control-label">Password</label>
							<div class="col-sm-6">
								<textarea name='password' id='password' class="form-control"><%=r.getString(2)%> </textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-sm-3 control-label">Name</label>
							<div class="col-sm-6">


								<textarea name='name' id='namename' class="form-control"><%=r.getString(3)%> </textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="phoneNo" class="col-sm-3 control-label">Phone
								Number</label>
							<div class="col-sm-6">

								<textarea name='phoneNo' id='phoneNo' class="form-control"><%=r.getString(4)%> </textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-3 control-label">Email</label>
							<div class="col-sm-6">
								<textarea name='email' id='email' class="form-control"><%=r.getString(5)%> </textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="gender" class="col-sm-3 control-label">Gender</label>
							<div class="col-sm-6">
								<textarea name='gender' id='gender' class="form-control"><%=r.getString(6)%> </textarea>
							</div>
						</div>
						<%
			    	 
			     } 
	        } catch(NullPointerException n) {
		   	   n.printStackTrace();
		   	  
		      } catch (Exception e) {
		   	  
				// TODO: handle exception
		   	   e.printStackTrace();
			}
	     
        %>


						<div class="form-group">
							<div class="col-sm-6 col-sm-offset-3">
								<button type="submit" class="btn btn-primary btn-block">Update</button>
							</div>
						</div>
						<font color="red" style="font-family: monospace;"> <%
 	if (request.getAttribute("success") != null) {
 		out.println(request.getAttribute("success"));
 	}
 %>
						</font>
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