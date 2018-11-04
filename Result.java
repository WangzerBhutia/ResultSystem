import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;

public class Result extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String x=request.getParameter("Roll");
		String name=request.getParameter("Name");
		try
		{
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/wangzer","root","wangzer123");
		String sql="select * from results where roll='"+x+"'and name='"+name+"'";
		Statement stmt=con.createStatement();
		ResultSet obj=stmt.executeQuery(sql);	
		while(obj.next())
		{
			pw.println("Roll Number:"+obj.getString("roll")+"\nName:"+obj.getString("name")+"\nMarks:"+obj.getInt("marks"));
		}
		}
		catch(SQLException se)
		{
		}
	}
}