<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
	</head>
	<body>
		<%@ page import="javax.sql.*" %>
		<%
		
			int count=0;
			String id=request.getParameter("emp_id");
			String pass=request.getParameter("pass");
			
			java.sql.Connection conn;
			java.sql.Statement stmt;
			java.sql.ResultSet rs;
			java.sql.ResultSet s;
			
			conn=null;
			stmt=null;
			rs=null;
			s=null;
			
			String driver="com.mysql.jdbc.Driver";
			String url="jdbc:mysql://localhost/project";
			try{
				Class.forName("com.mysql.jdbc.Driver");
				conn = java.sql.DriverManager.getConnection(url,"root","");
			}
			catch(Exception e){
				throw e;
			}
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(" SELECT * FROM `employee` WHERE Designation='Manager' ");
		
			if(rs!=null)
			{
				while(rs.next())
				{
					if(id.equalsIgnoreCase(rs.getString("Employee_Id")))
					{	
						if(pass.equals(rs.getString("Password")))
						{
							response.sendRedirect("AdminPanel.jsp");
						}
						else
						{
							out.print("Invalid Password");
						}
					count++;
					}
				}
			}
			
			if(count==0)
			{
				String link;
				link="Employee.jsp?Id="+id+"&pass="+pass;
				response.sendRedirect(link);
			}
		%>	
	</body>
</html>