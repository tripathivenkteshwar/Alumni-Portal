<%@page language="java" import="java.sql.*,java.util.*"%>
<%
try
{
String otp=request.getParameter("otp");
String rol=request.getParameter("roll");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select roll, active,pass from registration");
con.setAutoCommit(false);
while(rs.next())
{
if((rs.getString(1).equals(rol))&&(rs.getString(2).equals(otp)))
{
PreparedStatement ps= con.prepareStatement("update registration set active=? where roll=?");
ps.setString(1,"yes");
ps.setString(2,rol);
ps.executeUpdate();
PreparedStatement ins= con.prepareStatement("insert into login values(?,?,?)");
ins.setString(1,rol);
ins.setString(2,rs.getString(3));
ins.setString(3,"user");
ins.executeUpdate();
con.commit();
response.sendRedirect("login.html");
}
}
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>