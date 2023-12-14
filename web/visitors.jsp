<%@page import="java.sql.*" %>
<%
        String msg="";
        if(session.getAttribute("ULOGIN")==null)
        {
            response.sendRedirect("index.jsp?err=Do Login First!!!");
        }
        else
        {
            if(!session.getAttribute("UTYPE").toString().equals("admin"))
            {
                response.sendRedirect("index.jsp?err=You are trying the access Admin area!!!");
            }
        }
        Connection con=(Connection)session.getAttribute("CON");
        PreparedStatement stmt;
        ResultSet rs;
        if(request.getParameter("b1")!=null)
        {
            stmt=con.prepareStatement("Select count(*)+1 from Visitors");
            rs=stmt.executeQuery();
            String cid="";
            if(rs.next()) cid=rs.getString(1);
            stmt=con.prepareStatement("Insert into Visitors values(?,?,?,?,?)");
            stmt.setString(1,cid);
            stmt.setString(2,request.getParameter("t1"));
            stmt.setString(3,request.getParameter("t2"));
            stmt.setString(4,request.getParameter("t3"));
            stmt.setString(5,request.getParameter("t4"));
            stmt.executeUpdate();
            msg="Visitor Record Saved Sucessfully";
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function uploadphoto(cid)
            {
                window.open("uploadphoto.jsp?cid="+cid,"","left=200,top=100,width=300,height=150");
            }
        </script>
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" alt=""><hr>
        <table width="100%">
            <tr>
                <td><a href="admin.jsp">Home</a></td><td><a href="categories.jsp">Categories</a></td><td><a href="criminals.jsp">Criminals</a></td><td><a href="crime.jsp">Crimes</a></td><td><a href="records.jsp">Criminal Records/Search</a></td><td><a href='visitors.jsp'>Visitors</a></td><td><a href="warden.jsp">Wardens</a></td><td><a href="task.jsp">Tasks</a></td><td><a href="logout.jsp">Logout</a></td>
            </tr>
        </table><hr>
        <form method="post">
        <table align="center">
            <tr>
                <th colspan="2">Crime Categories</th>
            </tr>
            <tr><td>Visitor Name:</td><td><input type="text" name="t1"></td></tr>
            <tr><td>Address:</td><td><textarea name="t2"></textarea></td></tr>
            <tr><td>Visit Date:</td><td><input type="date" name="t3"></td></tr>
            <tr><td>Criminal Name:</td><td>
                    <select name="t4">
                        <%
                                stmt=con.prepareStatement("Select * from criminals");
                                rs=stmt.executeQuery();
                                while(rs.next())
                                {
                                    String s1=rs.getString("name");
                                    String s2=rs.getString("father");
                                    out.write("<option value='"+s1+"'>"+s1+","+s2+"</option>");
                                }
                        %>
                    </select>
                </td></tr>
            <tr><td>:</td><td><input type="submit" name="b1" value="Save"></td></tr>
            <tr><td></td><td><font color="red"><%=msg%></font></td></tr>
        </table></form>
        <hr>
        <table align="center" border='1'>
            <tr>
                <th>Visitor Code</th><th>Name</th><th>Address</th><th>Visit Date</th><th>Criminal Name</th>
            </tr>
        <%
            stmt=con.prepareStatement("Select * from Visitors");
            rs=stmt.executeQuery();
            while(rs.next())
            {
                out.write("<tr>");
                String cid=rs.getString(1);
                out.write("<td>"+cid+"</td>");
                out.write("<td>"+rs.getString(2)+"</td>");
                out.write("<td>"+rs.getString(3)+"</td>");
                out.write("<td>"+rs.getString(4)+"</td>");
                out.write("<td>"+rs.getString(5)+"</td>");
                out.write("</tr>");
            }
        %>
        </table>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
