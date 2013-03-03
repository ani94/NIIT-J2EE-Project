/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
public class reg extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     String fname=request.getParameter("fname");
     String lname=request.getParameter("lname");
     String acno=request.getParameter("acno");
        String id=request.getParameter("id");
           String pass=request.getParameter("pass");
              String homebank=request.getParameter("homebank");
                String address=request.getParameter("address"); 
                   String email=request.getParameter("email");
       String phone=request.getParameter("phone");
       String name1,pass1,acno1;int flag=1;
       List errorMsgs=new LinkedList();
       request.setAttribute("errorMsgs", errorMsgs);
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
      stmt = conn.createStatement();
PreparedStatement ps = null;

    
            String sql1 = "SELECT acno,id,pass FROM user"; 
            ResultSet rs = stmt.executeQuery(sql1);
            
            while(rs.next()){
             name1=rs.getString("id");
 pass1=rs.getString("pass");
 acno1=rs.getString("acno");
           if(id.equals(name1)) {errorMsgs.add("Username already exists");flag=0;break;}
           if(pass.equals(pass1)){errorMsgs.add("Password already exists");flag=0;break;}
           if(acno.equals(acno1)) {errorMsgs.add("Please check your account number");flag=0;break;}
            }
            if(flag==0) {
                System.out.println("5");
            RequestDispatcher view=request.getRequestDispatcher("reg.jsp");
            view.forward(request, response);
            return;
            }
            if(flag==1){
                System.out.println("Start");
            ps = conn.prepareStatement (
        "INSERT INTO user (fname,lname,acno,id,pass,homebank,address,email,phone) VALUES(?,?,?,?,?,?,?,?,?)");
        ps.setString (1,fname);
        ps.setString (2, lname);
        ps.setString (3, acno);
        ps.setString (4, id);
        ps.setString (5, pass);
        ps.setString (6, homebank);
        ps.setString (7, address);
        ps.setString (8, email);
        ps.setString (9, phone);
        int count = ps.executeUpdate ();
                         ps = conn.prepareStatement (
        "INSERT INTO login (username,pass) values(?,?)");
              ps.setString(1,id);     
              ps.setString(2,pass);
              int count1 = ps.executeUpdate ();
            System.out.println("user works....");
            
     System.out.println("Statement correct"); 
     RequestDispatcher view=request.getRequestDispatcher("login.jsp");
     view.forward(request, response);
     return;
            }
    
    }catch (Exception e){}
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
