/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package jdbc;

import Model.Login;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author LENOVO
 */
public class check extends HttpServlet {
   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
   static final String DB_URL = "jdbc:mysql://localhost/abc";
  static final String USER = "root";
   static final String PASS = "ani123";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        List errors=new LinkedList();
        request.setAttribute("errors",errors);
        System.out.println("1");
        String use=request.getParameter("login");
        String pass=request.getParameter("pass");
      System.out.println("2");
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
int flag=0;String name1 = null,pass1;
      //STEP 3: Open a connection
      System.out.println("Connecting to a selected database...");
     conn = DriverManager
		.getConnection("jdbc:odbc:login","root", "ani123");
      System.out.println("Connected database successfully...");
      System.out.println("4");
      //STEP 4: Execute a query
      System.out.println("Creating statement...");
      stmt = conn.createStatement();
 System.out.println("5");
      String sql = "SELECT username,pass FROM login";
      ResultSet rs = stmt.executeQuery(sql);
      //STEP 5: Extract data from result set
      while(rs.next()){
 name1=rs.getString("username");
 pass1=rs.getString("pass");
if(name1.equals(use) && pass1.equals(pass))
{flag=1;break;}
    }
      rs.close();
      if(flag==0) {
          System.out.println("errors checked");
          errors.add("Username or password is incorrect");
       RequestDispatcher view=request.getRequestDispatcher("login.jsp");
      view.forward(request, response);
      return;
      }
      if(flag==1) {
          if(use.equals("admin")&&pass.equals("admin123")){
          request.setAttribute("use",use);
     RequestDispatcher view=request.getRequestDispatcher("admin.jsp");
     view.forward(request, response);
     return;
          }
          request.setAttribute("use",use);
     RequestDispatcher view=request.getRequestDispatcher("home.jsp");
     view.forward(request, response);
     return;
      }
   }catch(Exception e){}
    }
 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
