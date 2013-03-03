<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hibernate Bank</title>
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
</head>

<body>
<div id="main_container">
	<div class="center_content">
	<div id="header">
    	<div id="logo"><a href="home.jsp"><img src="images/logo1.png" alt="" title="" border="0" /></a></div>
         <div id="menu">
            <ul>                                              
                <li><a class="current" href="home.jsp" title="">Home</a></li>
                <%String username=(String)request.getAttribute("use");
                      
%>
<%out.print("<li><a href='profile.jsp?username="+username+"'>Your Profile</a></li>");%>
                
        <% out.print("<li><a href='bank.jsp?username="+username+"'>Bank</a></li>"); %>
               
                <li><a href="#" title="">News</a></li>
                <li><a href="#" title="">Contact us</a></li>
            </ul>
        </div>
        
        
        <div class="top_text">
            <p>?Experience real time, fast transactions and supreme banking exclusively. "</p>
        <p>&copy; Hibernate Bank</p>
        </div>
    
  </div>
  
  
  <div class="main_content">
  <div class="main_content_top"></div><font size='3'>
      
      <%
Connection conn = null;
   Statement stmt = null;
   try{System.out.println("3");
      //STEP 2: Register JDBC driver
     try {
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	} catch (ClassNotFoundException e) {
		System.out.println("Where is your MySQL JDBC Driver?");
		e.printStackTrace();
		return;
	}
     System.out.println("Connecting to a selected database...");
     conn = DriverManager
		.getConnection("jdbc:odbc:login","root", "ani123");
      System.out.println("Connected database successfully...");
      System.out.println("4");
      //STEP 4: Execute a query
      System.out.println("Creating statement...");
  
 PreparedStatement st=conn.prepareStatement("select * from bank");
 
ResultSet rs=st.executeQuery();
while(rs.next()){
String user=rs.getString("id");
int bal=rs.getInt("balance");
out.println(user);
out.println(bal);
}
     }catch(Exception e){}
      
%>
      <form action="delete.do" method='post'>
        Username : <input type='text' name='use'>
          </div></body></html>