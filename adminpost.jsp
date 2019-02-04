<%@page language="java" import="java.sql.*,java.util.*"%>
<%
String user=(String)session.getAttribute("type");
String id=(String)session.getAttribute("studentid");
try
{
String post=request.getParameter("adminpost");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ins= con.prepareStatement("insert into pin (admin) values(?)");
ins.setString(1,post);
ins.executeUpdate();
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from pin");

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