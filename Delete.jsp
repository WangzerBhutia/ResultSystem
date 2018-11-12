<html>
<head>
	<title>Deletion</title>
</head>
<body>
	<%@ page import="javax.sql.*"%>
	<%
		String str=request.getParameter("Id");
		out.print(str);
		
		java.sql.Connection conn;
		java.sql.Statement stmt;
		
		conn=null;
		stmt=null;
		
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost/project";
		try{
			Class.forName("com.mysql.jdbc.Driver");
				conn = java.sql.DriverManager.getConnection(url,"root","");
		}
		catch(Exception e){
			throw e;
		}
		
		String query;
		query="DELETE FROM `employee` WHERE `employee`.`Employee_Id`=" +str; 
	
		out.print(query);
		stmt=conn.createStatement();
		stmt.executeUpdate(query);
		response.sendRedirect("AdminPanel.jsp");
	%>
</body>
</html>