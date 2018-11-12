<html>
<body>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%>

<!--jsp code section-->

<%
	String f_name=request.getParameter("fname");
	String l_name=request.getParameter("lname");
	String designation=request.getParameter("designation");
	String password=request.getParameter("pass");
	String salary=request.getParameter("sal");
	
	if(f_name!=null||l_name!=null||designation!=null||password!=null||salary!=null)
	{
		
		java.sql.Connection con;	
		java.sql.PreparedStatement stmt;
	
		con=null;
		stmt=null;
	
		String driver="com.mysql.jdbc.Driver";
		String url="jdbc:mysql://localhost/project";
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = java.sql.DriverManager.getConnection(url,"root","");
		}
		catch(Exception e){
			throw e;
		}
	
		try{
			String sql="INSERT INTO `employee` (`First_Name`, `Last_Name`, `Designation`, `Password`, `Total_Salary`) VALUES (?,?,?,?,?)";
			stmt=con.prepareStatement(sql);
			stmt.setString(1,f_name);
			stmt.setString(2,l_name);
			stmt.setString(3,designation);
			stmt.setString(4,password);
			stmt.setInt(5,Integer.valueOf(salary));
			stmt.executeUpdate();
			response.sendRedirect("AdminPanel.jsp");
		}
		catch(Exception e){
			throw e;
		}
		finally{
			if(stmt!=null)stmt.close();
			if(con!=null)con.close();
		}
	}
%>
</body>
</html>