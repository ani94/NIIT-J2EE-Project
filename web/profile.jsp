<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
                     <%String username=(String)request.getAttribute("use");
                     
%>

                
              
        
        <div class="top_text">
            <p>?Experience real time, fast transactions and supreme banking exclusively. "</p>
        <p>&copy; Hibernate Bank</p>
        </div>
    
  </div>
  
  
  <div class="main_content">
  <div class="main_content_top">
      
     
  </div>
     
        <%String userid=request.getParameter("username");
  Connection conn = null;
   Statement stmt = null;
   try{
       System.out.println("3");
   
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
  
 PreparedStatement st=conn.prepareStatement("select * from user where id=?");
st.setString(1,userid);
ResultSet rs=st.executeQuery();
      System.out.println("6");
      while(rs.next()){
          System.out.println("6.5");
      String fname=rs.getString("fname");
       String lname=rs.getString("lname");
        String acno=rs.getString("acno");
         String id=rs.getString("id");
          String pass=rs.getString("pass");
           String homebank=rs.getString("homebank");
            String email=rs.getString("email");
             String phone=rs.getString("phone");
             request.setAttribute("fname",fname);
            request.setAttribute("lname",lname);
            request.setAttribute("acno",acno);
            request.setAttribute("id",id);
            request.setAttribute("pass",pass);
            request.setAttribute("homebank",homebank);
            request.setAttribute("email",email);
            request.setAttribute("phone",phone);
            out.println("<br><br>&nbsp;&nbsp;<font size='4' color='blue'><u>Your Profile :</font></u><br><br><font size='3'>");
            out.println("<table border='1'><tr><td>First Name</td><td>"+fname+"</td></tr>"); 
out.println("<tr><td>Last Name : </td><td>"+lname+"</td></tr>");  
out.println("<tr><td>Account Number : </td><td>"+acno+"</td></tr>");
out.println("<tr><td>UserName : </td><td>"+id+"</td></tr>");
out.println("<tr><td>Password: </td><td>"+pass+"</td></tr>");
out.println("<tr><td>HomeBank : </td><td>"+homebank+"</td></tr>");
out.println("<tr><td>Email : </td><td>"+email+"</td></tr>");
out.println("<tr><td>Phone No. : </td><td>"+phone+"</td></tr>");      
out.println("</font></table>");      
      System.out.println("7");
 out.println("<br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form action='change.jsp' method='POST'><input type='submit' value='Change profile'></form>");     
      out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&copy; Hibernate Banking Solutions Ltd. 2012-2013");
      }
   }catch(Exception e){}      
  
%>
  </div>
</body></html>