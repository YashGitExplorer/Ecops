package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class DB_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1","root","");
        PreparedStatement stmt=con.prepareStatement("Create database crimedb");
        stmt.executeUpdate();
        con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/crimedb","root","");
        stmt=con.prepareStatement("Create table criminals(CID int,Name varchar(30),father  varchar(30),mother varchar(30),brothers varchar(50),sisters varchar(30),DOB date,address varchar(50),state varchar(30),city varchar(30),picode varchar(6),contactnumbers varchar(50),InDate Date,OutDate Date,SecurityLevel varchar(15),Photo mediumblob)");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table users(ulogin varchar(30),upass varchar(30),utype varchar(20))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Insert into users values('admin@admin.com','admin123','admin')");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table Members(email varchar(30) primary key,name varchar(30),age int,securityquestion varchar(30),answer varchar(30),why varchar(100))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table CrimeDetails(CRID int,CID int,CrimeDetails varchar(100),Cdate date,PoliceStation varchar(50),FIRNO varchar(20),CrimeCategory varchar(20))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table CrimeCategories(CID int,CName varchar(100))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table Visitors(VID int,VName varchar(30),Address varchar(100),VDate Date,CriminalName varchar(30))");
        stmt.executeUpdate();        
        stmt=con.prepareStatement("Create table Wardens(WardenNo int Primary Key,WName varchar(30),Rank varchar(30))");
        stmt.executeUpdate();        
        stmt=con.prepareStatement("Create table Tasks(CriminalNo int,CName varchar(30),Task varchar(30))");
        stmt.executeUpdate();        
        out.write("Done");
        
        

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
