<%@page language="java" import="java.sql.*"%>
<%

try
{
String rol=request.getParameter("roll");
String pas=request.getParameter("pass");
session.setAttribute("studentid",rol);
String salting=pas+"a@b34c"+pas;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ps= con.prepareStatement("select roll, pass, type from login where roll=? and pass=?");
ps.setString(1,rol);
ps.setString(2,salting);
ResultSet rs=ps.executeQuery();
out.println(rol+" "+pas+"<br>");
while(rs.next())
{
session.setAttribute("type",rs.getString(3));
if(rs.getString(3).equals("admin"))
{
response.sendRedirect("admin.jsp");
}
if(rs.getString(3).equals("user"))
{
response.sendRedirect("user.jsp");
}
}
response.sendRedirect("login.html");
//out.println(session.getAtribute("student"));
con.close();
}
catch(Exception e)
{
out.println(e);
}


%>