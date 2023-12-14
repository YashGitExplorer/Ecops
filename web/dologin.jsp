<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
        String s1=request.getParameter("t1");
        String s2=request.getParameter("t2");
        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/crimedb","root","");
        PreparedStatement stmt=con.prepareStatement("Select * from users where ulogin=? and upass=?");
        stmt.setString(1,s1);
        stmt.setString(2,s2);
        ResultSet rs=stmt.executeQuery();
        String type="";
        if(rs.next()) type=rs.getString(3);
        if(type.equals(""))
        {
            response.sendRedirect("index.jsp?err=Invalid Login/Password!!!");
        }
        else
        {
            session.setAttribute("ULOGIN",s1);
            session.setAttribute("UTYPE",type);
            session.setAttribute("CON",con);
            if(type.equals("admin"))
            {
                response.sendRedirect("admin.jsp");
            }
            else
            {
                response.sendRedirect("member.jsp");
            }
        }
%>