<html>
<head>
	<title>Attendance</title>
</head>
<body>
	<%@ page import="javax.sql.*"%>
	<%
		String pass=null;
	
		int count=1;
		String id=request.getParameter("Id");
		
		java.sql.Connection conn;
		java.sql.Statement stmt;
		java.sql.Statement s;
		java.sql.Statement st1;
		java.sql.Statement st2;
		java.sql.ResultSet rs;
		java.sql.ResultSet rs2;
		
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
		
		String sql;
		sql="SELECT * FROM `employee` WHERE `employee`.`Employee_Id`=" +id;
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		
		if(rs!=null)
		{	
			while(rs.next())
			{
				pass=rs.getString("Password");
				count=count+Integer.parseInt(rs.getString("Attendance"));
				out.print(count);
			}
		}
		
		String query;
		query="UPDATE `employee` SET `Attendance` = ' "+ count + " ' WHERE `employee`.`Employee_Id` ="+ id;
		s=conn.createStatement();
		s.executeUpdate(query);

		String q1;
		q1="SELECT `Attendance` FROM `employee` WHERE `employee`.`Employee_Id`=" +id;
		st1=conn.createStatement();
		rs2=stmt.executeQuery(sql);
		if(rs2!=null)
		{
			while(rs2.next())
			{
				if(Integer.parseInt(rs2.getString("Attendance"))>30)
				{				
					String q2;
					q2="UPDATE `employee` SET `Attendance` = '0' WHERE `employee`.`Employee_Id` ="+ id;
					st2=conn.createStatement();
					st2.executeUpdate(q2);
				}		
			}
		}
	String link;
	link="Employee.jsp?Id="+id+"&pass="+pass;
	response.sendRedirect(link);
	%>
</body>
</html>