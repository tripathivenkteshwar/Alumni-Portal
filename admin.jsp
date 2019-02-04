<%@page language="java" import="java.sql.*"%>
<%
if(session.getAttribute("type")==null || session.getAttribute("studentid")== null)
{
response.sendRedirect("login.html");
}
%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <style media="screen">
    body{
      margin: 0 0;
      padding: 0;
      font-family: Arial;
      background: #f1f1f1;
    }
      .inl{display: inline-block;}
      .header{
        background: #4caf50;
        height: 50px;
        width: 100%;
        padding: 12px 20px;
        box-sizing: border-box;
      }
      .logout{
        float: right;
        margin: -20px 0;
        color: #Fff;
      }
      input{
        padding: 3px 10px;
      }
      .mysea{
        margin-left: 100px;
      }
      .mybody{
        width: 100%;
        background: #f1f1f1;
        position: relative;
        overflow: hidden;
      }
      .col1{
        width: 20%;
        border: 1px solid #000;
        float: left;
        text-align: center;
        padding: 5px;
        box-sizing: border-box;
        border-bottom: none;
        border-right: none;
      }
      .mybody .col1 h3{
        border-bottom: 0.2px solid rgba(0,0,0,0.2);
        color: #4caf50;
      }
      .col12{
        height: 200px;
        border: 0.3px solid rgba(0,0,0,0.3);
      }
      .col2{
        width: 60%;
        float: left;
        border: 1px solid #000;
      }
      .col3{
        width: 19%;
        float: left;
        border: 1px solid #000;
        height: 200px;
      }
      ul{
        list-style: none;
        margin-left: -25px;
      }
      #newp{
	//overflow:scroll;
        list-style: none;
	height:100%;
	width:100%;
        margin-left: -25px;
      }
      .box1{
        font-size:20px;
        width: 80%;
	border-radius: 15px 100px 100px 50px;
        height: 160px;
        border: 12.3px solid #a1ca82eb;
        margin: 15px auto;
      }
      button{
        background: #4caf50;
        border: none;
        color: #FFF;
        border-radius: 4px;
        text-align: center;
        padding: 5px 25px;
        display: block;
        margin: 0 auto;
      }
      textarea{
        width: 80%;
	border-radius: 10px 10px 50px 50px;
       	
        border: 12.3px solid #a1ca82eb;
        display: block;
        margin: 0 auto;
      }
    </style>
<script>

<%
try
{
//int i=Integer.parseInt(request.getParameter("v"));
//int i=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from registration limit 1");
//ResultSet rs=ps.executeQuery();
while(rs.next())
{
//'<div class="box1" id="Number(i)">''</div>';
//int x=1-Integer.parseInt(rs.getString(1));
//out.pintln(x);
//out.println("hello");
//out.println("name"+" "+rs.getString(1)+"branch"+" "+rs.getString(2)+" "+"roll"+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+"<br>");	
}

con.close();
}
catch(Exception e)
{
out.println(e);
}
finally
{
//con.close();

}
%>

function post()
{
var val=document.getElementById("post").value;
var obj=new XMLHttpRequest();
var count=0;
obj.onreadystatechange=function()
{
if((obj.readyState==4)&&(obj.status==200))
{
count=obj.responseText;
}
}
obj.open("GET","post.jsp?post="+val,true);
obj.send();
}

function pinpost()
{
var val=document.getElementById("pinvalue").value;
var obj=new XMLHttpRequest();
var count=0;
obj.onreadystatechange=function()
{
if((obj.readyState==4)&&(obj.status==200))
{
document.getElementById("new").innerHTML=obj.responseText;
}
}
obj.open("GET","adminpost.jsp?adminpost="+val,true);
obj.send();
}

function dele(x)
{
var obj=new XMLHttpRequest();
obj.onreadystatechange=function()
{
if((obj.readyState==4)&&(obj.status==200))
{
//document.getElementById("suggestion").innerHTML=obj.responseText;	
}
}
obj.open("GET","delete.jsp?name="+x,true);
obj.send();

}


function admindelete()
{
var obj=new XMLHttpRequest();
obj.onreadystatechange=function()
{
if((obj.readyState==4)&&(obj.status==200))
{
document.getElementById("new").innerHTML=obj.responseText;	
}
}
obj.open("GET","admindelete.jsp",true);
obj.send();

}

function search()
{
var pname=document.getElementById("person").value;
var obj=new XMLHttpRequest();
obj.onreadystatechange=function()
{
if((obj.readyState==4)&&(obj.status==200))
{
document.getElementById("suggestion").innerHTML=obj.responseText;	
}
}
obj.open("GET","search.jsp?name="+pname,true);
obj.send();
}
</script>
  </head>
  <body>
    <div class="header">
      <div class="inl mysea">
        <input type="text" id="person" name="person" onkeyup="search()" class="inl" placeholder="Search....">
	<br>
	<div id="suggestion"> 
        </div>
      </div>
      <div class="inl logout">
	<h3><form action="logout.jsp" method="post">
            <input type="submit" id="logout" value="logout" name="button">
	</form></h3>
      </div>
    </div>

    <div class="mybody">
        <div class="col1 inl">
          <div class="col11">
            <h3>Admin</h3>
            <div id="newp">
            <div id="new">
<ul>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
PreparedStatement ps= con.prepareStatement("select admin from pin");
ResultSet rs=ps.executeQuery();
//out.println(rol+" "+pas+"<br>");
while(rs.next())
{
out.println("<li>"+rs.getString(1)+"</li>");
}
//response.sendRedirect("login.html");
//out.println(session.getAttribute("student"));
con.close();
}
catch(Exception e)
{
out.println(e);
}


%>
</ul>
            </div>
            </div>
              <textarea name="name" rows="8" id="pinvalue" cols="80"></textarea>
            <button type="button" name="button" onclick="pinpost()">Post</button>
	    <input type="button" name="delete" value="Delete" style="background-color:red; color:white;" onclick="admindelete()">
          </div>
          <hr>

          <div class="col12">
            <h3>Active</h3>
          </div>
        </div>
        <div class="col2 inl">
            <textarea name="name" id="post" rows="8" cols="50"></textarea>
            <button type="button" name="button" onclick="post()">Post</button>
            <h1 style="text-align: center;color: #4CAF50;">Body Part</h1>
<%

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3340/project","root","123456");
Statement stm=con.createStatement();
ResultSet rs=stm.executeQuery("select * from news order by id desc");
//rs.next();
//out.println("name"+rs.getString(1));
while(rs.next())
{
out.println("<div class=box1 id="+rs.getString(1)+">"+"<input type=button value=delete style=color:white;background-color:red; onclick=dele("+rs.getString(1)+")>"+"<br>"+"<br>"+rs.getString(1)+rs.getString(3)+"</div>");
}
con.close();
}
catch(Exception e)
{
out.println(e);
}
%>

        </div>
        <div class="col3 inl">
            <h2 style="text-align: center;color: #4CAF50;">Link</h2>
            <ul>
              <li>Link</li>
              <li>Link</li>
              <li>Link</li>
              <li>Link</li>
              <li>Link</li>
              <li>Link</li>
            </ul>
            <div class="">
              <input type="text" name="" value="">
              <textarea name="name" rows="8" cols="80"></textarea>
              <button type="button" name="button">Send</button>
            </div>
        </div>
    </div>
  </body>
</html>
