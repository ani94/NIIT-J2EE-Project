<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
    	<div id="logo"><a href="home.html"><img src="images/logo1.png" alt="" title="" border="0" /></a></div>
        
      
        
        <div class="top_text">
            <p>?Experience real time, fast transactions and supreme banking exclusively. "</p>
        <p>&copy; Hibernate Bank</p>
        </div>
    
  </div>
  <%String id=(String)request.getAttribute("use");%>
  
  <div class="main_content">
  <div class="main_content_top"></div>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<u><font size='3' color='blue'>Your Bank Account details</font></u>
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
  
 PreparedStatement st=conn.prepareStatement("select * from bank where id=?");
 st.setString(1,id);
ResultSet rs=st.executeQuery();
while(rs.next()){
String user=rs.getString("id");
int bal=rs.getInt("balance");
out.println(user);
out.println(bal);
}
     }catch(Exception e){}

%>
  </div>
        </body></html>