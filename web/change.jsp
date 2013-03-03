<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <script type='text/javascript'>
        function validateForm()
{
var x=document.forms["myForm"]["fname"].value;
if (x==null || x=="")
  {
  alert("First name must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["pass"].value;
if (x==null || x=="")
  {
  alert("Password field must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["lname"].value;
if (x==null || x=="")
  {
  alert("Last name must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["acno"].value;
if (x==null || x=="")
  {
  alert("Account Number  must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["homebank"].value;
if (x==null || x=="")
  {
  alert("Home Bank must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["email"].value;
if (x==null || x=="")
  {
  alert("Email ID must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["phone"].value;
if (x==null || x=="")
  {
  alert("phone number must be filled out");
  return false;
  }
  var x=document.forms["myForm"]["email"].value;
var x=document.forms["myForm"]["email"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  alert("Not a valid e-mail address");
  return false;
  }
var y = document.myForm.phone.value;
  if(isNaN(y)||y.indexOf(" ")!=-1)
           {
              alert("Enter valid phone number")
              return false; 
           }
           if (y.length!=10)
           {
                alert("phone number should have 10 digits");
                return false;
           }
           if (y.charAt(0)!="9")
           {
                alert("it should start with 9 ");
                return false
           }
var y = document.myForm.acno.value;
  if(isNaN(y)||y.indexOf(" ")!=-1)
           {
              alert("Enter valid account no. number")
              return false; 
           }
           if (y.length!=10)
           {
                alert("Account number must have 10 digits");
                return false;
           }
                     
}
        
    </script>
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
            <p>"Experience real time, fast transactions and supreme banking exclusively. "</p>
        <p>&copy; Hibernate Bank</p>
        </div>
           
    </div>
            
  <div class="main_content">
  <div class="main_content_top"></div>
  &nbsp;&nbsp;<font size='3' color='blue' ><u><b>Edit Profile : </u></b></font><br><br>
           <% 
List errorMsgs=(List) request.getAttribute("errorMsgs");
if(errorMsgs!=null){
Iterator items=errorMsgs.iterator();
while(items.hasNext()){
String message=(String) items.next();
  out.println("    <font color ='red' size='2'>"+message+"</font>");

}
}
  %>
          <%
String fname=request.getParameter("fname");
if(fname==null) fname="";
String lname=request.getParameter("lname");
if(lname==null) lname="";
String acno=request.getParameter("acno");
if(acno==null) acno="";
String id=request.getParameter("id");
if(id==null) id="";
String pass=request.getParameter("pass");
if(pass==null) pass="";
String homebank=request.getParameter("homebank");
if(homebank==null) homebank="";
String address=request.getParameter("address");
if(address==null) address="";
String email=request.getParameter("email");
if(email==null) email="";
String phone=request.getParameter("phone");
if(phone==null) phone="";
%>
<br><br>
  <%out.println("<form name='myForm' action='reg.do' method='POST' onsubmit='return validateForm()'");
   out.println(" <br><font size='2'>&nbsp;&nbsp;First name : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='fname' value='"+fname+"'>");
  out.println("<br><br><font size='2'>&nbsp;&nbsp;Last name :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' name='lname' value='"+lname+"'>");
 out.println("<br><br><font size='2'>&nbsp;&nbsp;Account Number : <input type='text' name='acno' value=' "+acno+"'>");
 out.println("<br><br><font size='2'>&nbsp;&nbsp;User ID: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='text' name='id' value='"+id+"'>");
 out.println("<br> <br><font size='2'>&nbsp;&nbsp;Password : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='password' name='pass' value='"+pass+"'>");
 out.println("<br><br><font size='2'>&nbsp;&nbsp;Home Bank:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' name='homebank' value='"+homebank+"'>");
 out.println("<br><br><font size='2'>&nbsp;&nbsp;Address :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' name='address' value='"+address+"'>");
 out.println("<br> <br><font size='2'>&nbsp;&nbsp;Email :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' name='email' value='"+email+"'>");
 out.println("<br> <br><font size='2'>&nbsp;&nbsp;Phone No. :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type='text' name='phone' value='"+phone+"'>");
 out.println("<br> <br><br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='submit' value='SUBMIT'> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='reset' value='RESET'>");
 out.println("</form><br><br><br><br>");
 out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
 out.println("&copy; Hibernate Banking Solutions 2012-2013");
%>
                          
                                 
                                
      
             
                                     
  

                                     </div>
        </body></html>