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

<!-- Font awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<a href="#menu-toggle" style="background-color:black;color:white;" class="btn btn-default" id="menu-toggle">Pool
					Menu</a><br>
				<h2 align="center">Pools Joined</h2>	
				 <table class="table table-bordered">
		    		<thead>
				      <tr>
				        <th>Owner</th>
				        <th>Start Time</th>
				        <th>From</th>
						<th>To</th>
						<th>Via</th>
						<th>Vehicle</th>
						<th>Availability</th>	
						<th>Leave Pool</th>			        
				      </tr>
			    	</thead>
			      <tbody>
				      <tr>
				 													

		<%
	        try{
		    	   
	   	     Connection con=MySQLCon.main(null);
	   	     
	   	     String username=(String) session.getAttribute("uname");
	   	  	 System.out.println(username+" username");
	   		 String sql="SELECT pools.owner,pools.poolId,startTime,startFrom,upTo,via,vehicle,availability FROM pools,pools_users_membership WHERE pools.poolId=pools_users_membership.poolId AND pools_users_membership.username='"+username+"' ORDER BY availability DESC;";
		     PreparedStatement p=con.prepareStatement(sql);
	   	    
		     ResultSet r=p.executeQuery();
	 	    
			     while(r.next()){
			    	 out.println("<td>"+r.getString(1)+"</td>");
			    	 out.println("<td>"+r.getString(3)+"</td>");
		 	    	 out.println("<td>"+r.getString(4)+"</td>");
		 	    	 out.println("<td>"+r.getString(5)+"</td>");
		 	    	 out.println("<td>"+r.getString(6)+"</td>");
		 	    	 
		 	    	 
		 	    	 String vehiclesql="SELECT model FROM carpool_db.vehicles where vid = "+r.getString(7)+";";
				     PreparedStatement p1=con.prepareStatement(vehiclesql);
				     ResultSet r1=p1.executeQuery();
				     while(r1.next()){
				    	 out.println("<td>"+ r1.getString(1)+"</td>");
				     }
				    
		 	    	 
		 	    	 out.println("<td>"+r.getString(8)+"</td> ");
		 	    	out.println("<td><a href='/CarPooling/DeletePoolJoined?poolid="+r.getString(2)+"'><i class='fa fa-times' aria-hidden='true'style='color:red;'></i></a></td></tr>");
			     } 
	        } catch(NullPointerException n) {
		   	   n.printStackTrace();
		   	  
		      } catch (Exception e) {
		   	  
				// TODO: handle exception
		   	   e.printStackTrace();
			}
	     
        %>
  
			    </tbody>
		  </table>	
		 <!-- Created pools --> 
		 <h2 align="center">Pools Created</h2>
		   <table class="table table-bordered">
		    		<thead>
				      <tr>
				        <th>Owner</th>
				        <th>Start Time</th>
				        <th>From</th>
						<th>To</th>
						<th>Via</th>
						<th>Vehicle</th>
						<th>Availability</th>	
						<th>Delete Pool</th>				        
				      </tr>
			    	</thead>
			      <tbody>
				      <tr>
				 													

		<%
	        try{
		    	   
	   	     Connection con=MySQLCon.main(null);
	   	     
	   	     String username=(String) session.getAttribute("uname");
	   	  	 System.out.println(username+" username");
	   		 String sql="SELECT owner, startTime,startFrom,upTo,via,vehicle,availability,poolId FROM pools WHERE owner = '"+username+"' ORDER BY availability DESC;";
		     PreparedStatement p=con.prepareStatement(sql);
	   	    
		     ResultSet r=p.executeQuery();
	 	    
			     while(r.next()){
			    	 out.println("<td>You</td>");
			    	 out.println("<td>"+r.getString(2)+"</td>");
			    	 out.println("<td>"+r.getString(3)+"</td>");
		 	    	 out.println("<td>"+r.getString(4)+"</td>");
		 	    	 out.println("<td>"+r.getString(5)+"</td>");
		 	    	
		 	    	 
		 	    	 String vehiclesql="SELECT model FROM carpool_db.vehicles where vid = "+r.getString(6)+";";
				     PreparedStatement p1=con.prepareStatement(vehiclesql);
				     ResultSet r1=p1.executeQuery();
				    
				     while(r1.next()){
				    	 System.out.println("vehicle "+r1.getString(1));
				    	 out.println("<td>"+ r1.getString(1)+"</td>");
				     }
				    
		 	    	 out.println("<td>"+r.getString(7)+"</td> ");
		 	    	 out.println("<td><a href='/CarPooling/DeletePoolCreated?poolid="+r.getString(8)+"'><i class='fa fa-times' aria-hidden='true'style='color:red;'></i></a></td></tr>");
			     } 
	        } catch(NullPointerException n) {
		   	   n.printStackTrace();
		   	  
		      } catch (Exception e) {
		   	  
				// TODO: handle exception
		   	   e.printStackTrace();
			}
	     
        %>
  
			    </tbody>
		  </table>	
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