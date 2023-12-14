package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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


    String msg=request.getParameter("err");
    if(msg==null) msg="";

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!--\n");
      out.write("To change this license header, choose License Headers in Project Properties.\n");
      out.write("To change this template file, choose Tools | Templates\n");
      out.write("and open the template in the editor.\n");
      out.write("-->\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>All India Criminal Record</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <script>\n");
      out.write("            function submitform()\n");
      out.write("            {\n");
      out.write("               \n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <img src=\"images/banner.jpg\" width=\"100%\" alt=\"\"><hr>\n");
      out.write("        <table width='100%'>\n");
      out.write("            <tr>\n");
      out.write("                <td><img src='images/c3.jpg' width='300'></td><td>\n");
      out.write("                    <form name='frm1' method=\"post\" action='dologin.jsp'>\n");
      out.write("                    <table>\n");
      out.write("                        <th colspan='3'>User Authentication</th>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Login:</td><td><input type='email' name='t1' id='t1' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>Password:</td><td><input type='password' name='t2' id='t2' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td><td><input type='submit' style=\" border-style:none; border-width:0px;background-image:url('images/login.jpg');width:150px; height: 40px\" value='' ></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td><td><a href='forgot.jsp'><img src='images/forgot.jpg' width='100'></a><a href=\"resgister.jsp\"><img src='images/registernow.png' width='100'></a></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                        <tr>\n");
      out.write("                            <td></td><td><font color='red'>");
      out.print(msg);
      out.write("</font></td><td></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </table></form>\n");
      out.write("                </td><td><img src='images/c5.jpg' width='300'></td>\n");
      out.write("            </tr>\n");
      out.write("        </table>\n");
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
