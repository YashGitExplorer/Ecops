<%@page import="java.sql.*" errorPage="index.jsp" %>
<%
        String msg="";
        if(session.getAttribute("ULOGIN")==null)
        {
            response.sendRedirect("index.jsp?err=Do Login First!!!");
        }
        else
        {
            if(!session.getAttribute("UTYPE").toString().equals("member"))
            {
                response.sendRedirect("index.jsp?err=You are trying the access Member area!!!");
            }
        }
        Connection con=(Connection)session.getAttribute("CON");
        PreparedStatement stmt;
        ResultSet rs;        
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" alt=""><hr>
        <table width="100%">
            <tr style="width:100%">
                <td style="width:100%; text-align: right"><a href="logout.jsp">Logout</a></td>
            </tr>
        </table><hr>
        <form method="post">
        <table align="center">
            <tr>
                <th colspan="3">Criminal Records</th>
            </tr>
             <tr>
                 <td>Select Criminal</td><td>
             <select name="cid">
        <%
            stmt=con.prepareStatement("Select * from Criminals order by cid");
            rs=stmt.executeQuery();
            while(rs.next())
            {
                String s0=rs.getString(1);
                String s1=rs.getString("name");
                String s2=rs.getString("father");
                out.write("<option value='"+s0+"'>"+s1+" , "+s2+"</option>");
                
            }
            %></select></td><td><input type="submit" value="Search" name="b1"></td></tr>            
        </table></form>
        <hr>
        <table align="center">            
        <%
            if(request.getParameter("b1")!=null)
            {
                stmt=con.prepareStatement("Select * from Criminals where cid="+request.getParameter("cid"));
                rs=stmt.executeQuery();
                if(rs.next())
                {
                    out.write("<tr><td>Name:</td><td>"+rs.getString(2)+"</td></tr>");
                    out.write("<tr><td>Father:</td><td>"+rs.getString(3)+"</td></tr>");
                    out.write("<tr><td>Mother:</td><td>"+rs.getString(4)+"</td></tr>");
                    out.write("<tr><td>Brothers:</td><td>"+rs.getString(5)+"</td></tr>");
                    out.write("<tr><td>Sisters:</td><td>"+rs.getString(6)+"</td></tr>");
                    out.write("<tr><td>DOB:</td><td>"+rs.getString(7)+"</td></tr>");
                    out.write("<tr><td>Address:</td><td>"+rs.getString(8)+"</td></tr>");
                    out.write("<tr><td>State:</td><td>"+rs.getString(9)+"</td></tr>");
                    out.write("<tr><td>City:</td><td>"+rs.getString(10)+"</td></tr>");
                    out.write("<tr><td>Pin Code:</td><td>"+rs.getString(11)+"</td></tr>");
                    out.write("<tr><td>Contact Details:</td><td>"+rs.getString(12)+"</td></tr>");
                    out.write("<tr><td>In Date:</td><td>"+rs.getString(13)+"</td></tr>");
                    out.write("<tr><td>Out Date:</td><td>"+rs.getString(14)+"</td></tr>");
                    out.write("<tr><td></td><td><img src='getImage.jsp?id="+rs.getString(1)+"' width='200'></td></tr>");
                    
                    
                    
                }
            }
        %></table>
        <hr>
        <table align="center">
            <tr>
                <th>Crime Details</th><th>Crime Date</th><th>Police station</th><th>FIR No</th><th>Type of Crime</th>
            </tr>
        <%
            if(request.getParameter("b1")!=null)
            {
                stmt=con.prepareStatement("Select * from CrimeDetails where cid="+request.getParameter("cid"));
                rs=stmt.executeQuery();
                while(rs.next())
                {
                    out.write("<tr>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(4)+"</td>");
                    out.write("<td>"+rs.getString(5)+"</td>");
                    out.write("<td>"+rs.getString(6)+"</td>");
                    out.write("<td>"+rs.getString(7)+"</td>");
                    out.write("</tr>");
                }
            }
        %></table>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
