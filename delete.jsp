<%@page language="java" import="java.sql.*"%>
<%
int v=Integer.parseInt(request.getParameter("name"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ps=con.prepareStatement("delete from news where id=?");
//rs.next();
ps.setInt(1,v);
int x=ps.executeUpdate();
if(x==1)
{
response.sendRedirect("otp.html");
//out.println("record saved");
}
else
{
out.println("failed");
}

//out.println("name"+rs.getString(1));
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>
