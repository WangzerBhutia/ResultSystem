<html>
<body>
	<%@ page import="javax.sql.*"%>
	<%
	
		HttpSession hs=request.getSession();
		
		String id=request.getParameter("Id");
		String pass=request.getParameter("pass");
		
		java.sql.Connection conn;
		java.sql.Statement stmt;
		java.sql.ResultSet s;
		
		conn=null;
		stmt=null;
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
		String query;
		query="SELECT * FROM `employee` WHERE Employee_Id="+id;
		s=stmt.executeQuery(query);
		if(s!=null)
		{
			while(s.next())
			{
				if(id.equalsIgnoreCase(s.getString("Employee_Id")))
				{
					if(pass.equals(s.getString("Password")))
					{
	%>
	<table border="1px" cellpadding="10px">
		<tr>
			<td><font size="4px"><% out.print("First_Name"); %></font></td>
			<td><font size="4px"><% out.print("Last_Name"); %></font></td>
			<td><font size="4px"><% out.print("Designation"); %></font></td>	
			<td><font size="4px"><% out.print("Employee_Id"); %></font></td>
			<td><font size="4px"><% out.print("Password"); %></font></td>
			<td><font size="4px"><% out.print("Attendance"); %></font></td>
			<td><font size="4px"><% out.print("Extradays"); %></font></td>
			<td><font size="4px"><% out.print("Deduction"); %></font></td>
			<td><font size="4px"><% out.print("Total_Salary"); %></font></td>
			<td><font size="4px"><% out.print("Payable"); %></font></td>
		</tr>
		<tr>
			<td><% out.print(s.getString("First_Name")); %></td>
			<td><% out.print(s.getString("Last_Name")); %></td>
			<td><% out.print(s.getString("Designation")); %></td>	
			<td><% out.print(s.getString("Employee_Id")); %></td>
			<td><% out.print(s.getString("Password")); %></td>
			<td><% out.print(s.getString("Attendance")); %></td>
			<td><% out.print(s.getString("Extradays")); %></td>
			<td><% out.print(s.getString("Deduction")); %></td>
			<td><% out.print(s.getString("Total_Salary")); %></td>
			<td><% out.print(s.getString("Payable")); %></td>
		</tr>
		<a href="Attendance.jsp?Id=<% out.print(id);%>">Give Attendance</a><br/>
		<a href="Leave.jsp?Id=<% out.print(id);%>">Apply for leave</a><br/>
		<a href="Logout.jsp">Logout</a>
		<%		
					}
					else
					{
						out.print("Invalid Password");
					}
				}
			}
		}
%>
</body>
</html>