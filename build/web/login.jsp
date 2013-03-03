

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<html>
<head>
  <title>Login Form</title>
  <link rel="stylesheet" href="css/style.css">
  </head>
 

<body>
  <section class="container">
    <div class="login">
      <h1>Login to Hibernate Bank</h1>
      <form method="POST" action="check.do">
           <% 
List errorMsgs=(List) request.getAttribute("errors");
if(errorMsgs!=null){
Iterator items=errorMsgs.iterator();
while(items.hasNext()){
String message=(String) items.next();
  out.println("<font color ='red'>"+message+"</font>");

}
}
  %>
       <%
String user=request.getParameter("login");
if(user==null) user="";
String pass=request.getParameter("pass");    

        out.println("<p>Username : <input type='text' name='login' value='"+user+"'></p>");
        out.println("<p>Password : <input type='password' name='pass'></p>");
 %>
               
        <p class="submit"><input type="submit" value="Login">
        
      </form>
    </div>

    <div class="login-help">
      <p>New user ? <a href="reg.jsp">Click here to register </a>.</p>
    </div>
  </section>

  <section class="about">
   <p>&copy A Magma Web Solutions Product</p>
  </section>
</body>
</html>

