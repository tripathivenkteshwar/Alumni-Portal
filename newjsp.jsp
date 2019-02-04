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


      
<%
            
String t=request.getParameter("t1");

            String tt=request.getParameter("t2");
 
           String ttt=request.getParameter("t3");
 
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


		try {


			Message message = new MimeMessage(s);

			message.setFrom(new InternetAddress("tripathivenkteshwar6@gmail.com"));

			message.setRecipients(Message.RecipientType.TO,

					InternetAddress.parse(t));

			message.setSubject(tt);

			message.setText(ttt);


			Transport.send(message);


			System.out.println("Done");


		} catch (MessagingException e) {

			throw new RuntimeException(e);

		}

	
            %>

    