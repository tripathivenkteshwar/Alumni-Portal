<%@page import="java.util.Properties"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="javax.mail.Message"%>

<%@ page import="javax.mail.Message"%>

<%@ page import ="javax.mail.MessagingException"%>

<%@ page import ="javax.mail.PasswordAuthentication"%>

<%@ page import ="javax.mail.Session"%>

<%@ page import ="javax.mail.Transport"%>

<%@ page import ="javax.mail.internet.InternetAddress"%>

<%@ page import ="javax.mail.internet.MimeMessage"%>
<%@page language="java" import="java.sql.*,java.util.*"%>
<%
try
{
Random rand=new Random();
int n= rand.nextInt(9000)+1000;
String otp=Integer.toString(n);
String name=request.getParameter("name");
String branch=request.getParameter("branch");
String roll=request.getParameter("roll");
String contact=request.getParameter("mob");
String email=request.getParameter("email");
String year=request.getParameter("passing");
String pass=request.getParameter("pass");
String salting=pass+"a@b34c"+pass;
Class.forName("com.mysql.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
con.setAutoCommit(false);

PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?)");
ps.setString(1,branch);
ps.setString(2,roll);
ps.setString(3,name);
ps.setString(4,contact);
ps.setString(5,email);
ps.setString(6,year);
ps.setString(7,salting);
ps.setString(8,otp);
String t=email;

            String tt="otp";
 
           String ttt=otp+"otp.html";
 
           Properties props = new Properties();
	
	props.put("mail.smtp.host", "smtp.gmail.com");

		props.put("mail.smtp.socketFactory.port", "465");

		props.put("mail.smtp.socketFactory.class",

				"javax.net.ssl.SSLSocketFactory");

		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.port", "465");


		Session s = Session.getInstance(props,

			new javax.mail.Authenticator() {

				protected PasswordAuthentication getPasswordAuthentication() {

					return new PasswordAuthentication("tripathivenkteshwar6@gmail.com","123catmat");

				}

			});


		
			Message message = new MimeMessage(s);

			message.setFrom(new InternetAddress("tripathivenkteshwar6@gmail.com"));

			message.setRecipients(Message.RecipientType.TO,

					InternetAddress.parse(t));

			message.setSubject(tt);

			message.setText(ttt);


			Transport.send(message);




		
	
            
int x=ps.executeUpdate();
if(x==1)
{
con.commit();

response.sendRedirect("otp.html");
//out.println("record saved");
}
else
{
out.println("failed");
}
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>