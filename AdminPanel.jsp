<!DOCTYPE html>
<html>
<head>
	<title>Admin Panel</title>
	<link rel="stylesheet" type="text/css" href="AdminPanel.css">
	<script type="text/javascript">
		function func(){
			alert("Welcome Manager");
		}
		function show(){
			alert("menu");
			document.getElementById("menu").classList.toggle("show");
		}
	</script>
	<style>
		#menu ul{
			list-style-type:none;
			display:none;
		}
		#menu ul li{
			display:block;
		}
		img{
			width:60px;
			height:60px;
			position:fixed;
		}
		.show{
			display:block;
		}
	</style>
</head>
<body onload="func()">
<div id="menu">
	<ul>
		<li><a href="#menu1">Menu1</a></li>
		<li><a href="#menu2">Menu2</a></li>
	</ul>
</div>
	<%@ page import="javax.sql.*"%>
	
	<%
		java.sql.Connection conn;
		java.sql.Statement stmt;
		java.sql.ResultSet rs;
	
		conn=null;
		stmt=null;
		rs=null;
		
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost/project";
		try{
			Class.forName("com.mysql.jdbc.Driver");
				conn = java.sql.DriverManager.getConnection(url,"root","");
		}
		catch(Exception e){
			throw e;
		}
	%>
	<table cellpadding="8px">
		<tr>
			<td><font size="5px"><% out.print("First_Name"); %></font></td>
			<td><font size="5px"><% out.print("Last_Name"); %></font></td>
			<td><font size="5px"><% out.print("Designation"); %></font></td>	
			<td><font size="5px"><% out.print("Employee_Id"); %></font></td>
			<td><font size="5px"><% out.print("Password"); %></font></td>
			<td><font size="5px"><% out.print("Attendance"); %></font></td>
			<td><font size="5px"><% out.print("Extradays"); %></font></td>
			<td><font size="5px"><% out.print("Deduction"); %></font></td>
			<td><font size="5px"><% out.print("Total_Salary"); %></font></td>
			<td><font size="5px"><% out.print("Payable"); %></font></td>
			<td><font size="5px"><% out.print("Operation"); %></font></td>
		</tr>
		<%
		stmt=conn.createStatement();
		rs=stmt.executeQuery("SELECT * FROM `employee` WHERE Designation!='Manager'");
		
		if(rs!=null)
		{
			while(rs.next())
			{
		%>	
		<tr>
			<td><% out.print(rs.getString("First_Name")); %></td>
			<td><% out.print(rs.getString("Last_Name")); %></td>
			<td><% out.print(rs.getString("Designation")); %></td>	
			<td><% out.print(rs.getString("Employee_Id")); %></td>
			<td><% out.print(rs.getString("Password")); %></td>
			<td><% out.print(rs.getString("Attendance")); %></td>
			<td><% out.print(rs.getString("Extradays")); %></td>
			<td><% out.print(rs.getString("Deduction")); %></td>
			<td><% out.print(rs.getString("Total_Salary")); %></td>
			<td><% out.print(rs.getString("Payable")); %></td>
			<td><a href="Delete.jsp?Id=<%out.print(rs.getString("Employee_Id"));%>">Delete</a></td>
		</tr>
	<%	
			}
		}
	%>
	</table>
	<p><a href="AddDetails.html">Add new employee</a></p>
	<img src="menu_bar.jpg" onclick="show()" alt="Menu"></img>
</body>
</html>