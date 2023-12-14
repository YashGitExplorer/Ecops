<%@page import="java.sql.*" %>
<%
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
            <tr>
                <td><a href="admin.jsp">Home</a></td><td><a href="categories.jsp">Categories</a></td><td><a href="criminals.jsp">Criminals</a></td><td><a href="crime.jsp">Crimes</a></td><td><a href="records.jsp">Criminal Records/Search</a></td><td><a href='visitors.jsp'>Visitors</a></td><td><a href="warden.jsp">Wardens</a></td><td><a href="task.jsp">Tasks</a></td><td><a href="logout.jsp">Logout</a></td>
            </tr>
        </table><hr>
    <center><img src='images/welcomeadmin.png'></center>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
