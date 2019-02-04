<%@page language="java" import="java.sql.*,java.util.*"%>
<%
String user=(String)session.getAttribute("type");
String id=(String)session.getAttribute("studentid");
try
{
String post=request.getParameter("post");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ins= con.prepareStatement("insert into news (roll, news, type) values(?,?,?)");
//ins.setInt(1,2);
ins.setString(1,id);
ins.setString(2,post);
ins.setString(3,user);
ins.executeUpdate();
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select news from news");


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