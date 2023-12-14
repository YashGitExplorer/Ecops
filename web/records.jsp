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
        <form method="post">
        <table align="center">
            <tr>
                <th colspan="3">Criminal Records</th>
            </tr>
             <tr>
                 <td>Select Crime Category</td><td>
             <select name="cid">
        <%
            stmt=con.prepareStatement("Select * from Crimecategories order by cname");
            rs=stmt.executeQuery();
            while(rs.next())
            {
                String s0=rs.getString(1);
                String s1=rs.getString(2);
                out.write("<option value='"+s1+"'>"+s1+"</option>");
                
            }
            %></select></td>
                 <td><input type="submit" value="Search" name="b1"></td></tr>            
             <tr>
                 <td>Enter Criminal Name:</td><td>
                     <input type="text" name="t1" id="t1">
             </td>
                 <td><input type="submit" value="Search" name="b2"></td></tr>            
        </table></form>
        <hr>
        <table align="center">  
            <tr>
                <th>Name</th><th>Father</th><th>Date of Birth</th><th>Address</th><th>State</th><th>City</th><th>Pin Code</th><th>Number</th><th>In Date</th><th>Out Date</th><th></th>
            </tr>
        <%
            if(request.getParameter("b1")!=null)
            {
                stmt=con.prepareStatement("Select * from Criminals where cid in (Select cid from crimedetails where CrimeCategory=?)");
                stmt.setString(1,request.getParameter("cid"));
                rs=stmt.executeQuery();
                while(rs.next())
                {
                    out.write("<tr><td>"+rs.getString(2)+"</td>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(7)+"</td>");
                    out.write("<td>"+rs.getString(8)+"</td>");
                    out.write("<td>"+rs.getString(9)+"</td>");
                    out.write("<td>"+rs.getString(10)+"</td>");
                    out.write("<td>"+rs.getString(11)+"</td>");
                    out.write("<td>"+rs.getString(12)+"</td>");
                    out.write("<td>"+rs.getString(13)+"</td>");
                    out.write("<td>"+rs.getString(14)+"</td>");
                    out.write("<td><img src='getImage.jsp?id="+rs.getString(1)+"' width='100px'></td></tr>");
                    
                }
            }
            if(request.getParameter("b2")!=null)
            {
                stmt=con.prepareStatement("Select * from Criminals where name like ?");
                stmt.setString(1,request.getParameter("t1")+"%");
                rs=stmt.executeQuery();
                while(rs.next())
                {
                    out.write("<tr><td>"+rs.getString(2)+"</td>");
                    out.write("<td>"+rs.getString(3)+"</td>");
                    out.write("<td>"+rs.getString(7)+"</td>");
                    out.write("<td>"+rs.getString(8)+"</td>");
                    out.write("<td>"+rs.getString(9)+"</td>");
                    out.write("<td>"+rs.getString(10)+"</td>");
                    out.write("<td>"+rs.getString(11)+"</td>");
                    out.write("<td>"+rs.getString(12)+"</td>");
                    out.write("<td>"+rs.getString(13)+"</td>");
                    out.write("<td>"+rs.getString(14)+"</td>");
                    out.write("<td><img src='getImage.jsp?id="+rs.getString(1)+"' width='100px'></td></tr>");
                    
                }
            }
        %>
        </table>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
