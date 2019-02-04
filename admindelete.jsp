<%@page language="java" import="java.sql.*"%>
<%
//int v=Integer.parseInt(request.getParameter("admin"));
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ps=con.prepareStatement("delete from pin");
//rs.next();
//ps.setInt(1,v);
int x=ps.executeUpdate();
if(x==1)
{
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from pin");


while(rs.next())
{
out.println(rs.getString(1)+"<br>");
}

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
