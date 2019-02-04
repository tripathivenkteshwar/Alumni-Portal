<%@page language="java" import="java.sql.*"%>
<%
try
{
String name=request.getParameter("name");
//out.println(name);
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ps=con.prepareStatement("select name from registration where name like ?");
ps.setString(1,"%"+name+"%");
ResultSet rs=ps.executeQuery();
//rs.next();
//out.println("name"+rs.getString(1));
while(rs.next())
{
out.println(rs.getString(1)+"<br>");
}
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>