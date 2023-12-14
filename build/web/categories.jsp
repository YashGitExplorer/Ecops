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
            stmt=con.prepareStatement("Select count(*)+1 from CrimeCategories");
            rs=stmt.executeQuery();
            String cid="";
            if(rs.next()) cid=rs.getString(1);
            stmt=con.prepareStatement("Insert into CrimeCategories values(?,?)");
            stmt.setString(1,cid);
            stmt.setString(2,request.getParameter("t1"));
            stmt.executeUpdate();
            msg="Category Saved Sucessfully";
        }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
            function submitform()
            {
                s1=document.getElementById("t1").value;
                if(s1=="" || s1.length<5)
                {
                    alert("Please enter valid Category");
                    document.getElementById("t1").focus();
                    return false;
                }
                return true;
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
            <tr><td>Category:</td><td><input type="text" name="t1" id="t1"></td></tr>
            <tr><td>:</td><td><input onClick="return submitform()" type="submit" name="b1" value="Save"></td></tr>
            <tr><td></td><td><font color="red"><%=msg%></font></td></tr>
        </table></form>
        <hr>
        <table align="center">
            <tr>
                <th>Crime ID</th><th>Crime Type</th>
            </tr>
        <%
            stmt=con.prepareStatement("Select * from CrimeCategories order by cid");
            rs=stmt.executeQuery();
            while(rs.next())
            {
                out.write("<tr>");
                out.write("<td>"+rs.getString(1)+"</td>");
                out.write("<td>"+rs.getString(2)+"</td>");
                out.write("</tr>");
            }
        %>
        </table>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
