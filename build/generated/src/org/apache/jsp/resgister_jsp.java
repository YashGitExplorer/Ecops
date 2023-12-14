package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class resgister_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
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

        String msg="";
        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/crimedb","root","");
        if(request.getParameter("b1")!=null)
        {
            PreparedStatement stmt=con.prepareStatement("Insert into Members values(?,?,?,?,?,?)");
            stmt.setString(1,request.getParameter("t1"));
            stmt.setString(2,request.getParameter("t4"));
            stmt.setString(3,request.getParameter("t5"));
            stmt.setString(4,request.getParameter("t6"));
            stmt.setString(5,request.getParameter("t7"));
            stmt.setString(6,request.getParameter("t8"));
            stmt.executeUpdate();
            stmt=con.prepareStatement("Insert into Users values(?,?,'member')");
            stmt.setString(1,request.getParameter("t1"));
            stmt.setString(2,request.getParameter("t2"));
            stmt.executeUpdate();
            response.sendRedirect("thanks.jsp");
        }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>TODO supply a title</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <script>\n");
      out.write("            function submitform()\n");
      out.write("            {\n");
      out.write("               s1=document.getElementById(\"t1\");\n");
      out.write("               s2=document.getElementById(\"t2\");\n");
      out.write("               s3=document.getElementById(\"t3\");\n");
      out.write("               s4=document.getElementById(\"t4\");\n");
      out.write("               s5=document.getElementById(\"t5\");\n");
      out.write("               s6=document.getElementById(\"t6\");\n");
      out.write("               s7=document.getElementById(\"t7\");\n");
      out.write("               s8=document.getElementById(\"t8\");\n");
      out.write("               if(s1.value.trim()==\"\")\n");
      out.write("               {\n");
      out.write("                   alert(\"Email is must!!\");\n");
      out.write("                   s1.focus();\n");
      out.write("                   return false;\n");
      out.write("               }\n");
      out.write("               if(s2.value.trim()!=s3.value.trim() || s2.value.length<8)\n");
      out.write("               {\n");
      out.write("                   alert(\"Both Password must be same.\\nMin length of the password is 8\");\n");
      out.write("                   s2.focus();\n");
      out.write("                   return false;\n");
      out.write("               }\n");
      out.write("               if(s4.value.trim()==\"\")\n");
      out.write("               {\n");
      out.write("                   alert(\"Name is Compulsory\");\n");
      out.write("                   s4.focus();\n");
      out.write("                   return false;\n");
      out.write("               }\n");
      out.write("               if(s5.value.trim()==\"\")\n");
      out.write("               {\n");
      out.write("                   alert(\"Age is Compulsory\");\n");
      out.write("                   s5.focus();\n");
      out.write("                   return false;\n");
      out.write("               }\n");
      out.write("               if(s7.value.trim()==\"\" || s7.value.length<5)\n");
      out.write("               {\n");
      out.write("                   alert(\"Security answer is compulsory.\\nIt will help you to remnid the password.\\nMin length of the answer is 5\");\n");
      out.write("                   s5.focus();\n");
      out.write("                   return false;\n");
      out.write("               }\n");
      out.write("               return true;\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <img src=\"images/banner.jpg\" width=\"100%\" alt=\"\"><hr>\n");
      out.write("                    <form name='frm1' method=\"post\">\n");
      out.write("                    <table align='center'>\n");
      out.write("                        <th colspan='3'>User Registration</th>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Email:</td><td><input type='email' name='t1' id='t1' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Password:</td><td><input type='password' name='t2' id='t2' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Re-Password:</td><td><input type='password' name='t3' id='t3' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Name:</td><td><input type='text' name='t4' id='t4' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Age:</td><td><input type='number' name='t5' id='t5' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                                    <td>Security Question:</td><td><select name=\"t6\" id=\"t6\">\n");
      out.write("                                            <option>First School?</option>\n");
      out.write("                                            <option>Favorite Destination?</option>\n");
      out.write("                                            <option>First Friend's Name?</option>\n");
      out.write("                                            <option>Favorite Vehicle?</option>\n");
      out.write("                                </select></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Security Answer:</td><td><input type='text' name='t7' id='t7' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Why you need criminals data?:</td><td><textarea name='t8' id='t8'></textarea></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td><td><input onClick=\"return submitform()\" type='submit' name=\"b1\" style=\" border-style:none; border-width:0px;background-image:url('images/register.png');width:150px; height: 40px\" value='' ></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td><td><font color='red'>");
      out.print(msg);
      out.write("</font></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table></form>\n");
      out.write("               \n");
      out.write("        <hr><img src=\"images/footer.jpg\" width=\"100%\" alt=\"\">\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
