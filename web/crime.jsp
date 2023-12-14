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
            stmt=con.prepareStatement("Select count(*)+1 from CrimeDetails");
            rs=stmt.executeQuery();
            String cid="";
            if(rs.next()) cid=rs.getString(1);
            stmt=con.prepareStatement("Insert into CrimeDetails values(?,?,?,?,?,?,?)");
            stmt.setString(1,cid);
            stmt.setString(2,request.getParameter("t1"));
            stmt.setString(3,request.getParameter("t2"));
            stmt.setString(4,request.getParameter("t3"));
            stmt.setString(5,request.getParameter("t4"));
            stmt.setString(6,request.getParameter("t5"));
            stmt.setString(7,request.getParameter("t6"));
            
            stmt.executeUpdate();
            msg="Crime Record Saved Sucessfully";
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
            function submitform()
            {
                s1=document.getElementById("t1");
                s2=document.getElementById("t2");
                s3=document.getElementById("t3");
                s4=document.getElementById("t4");
                s5=document.getElementById("t5");
                if(s2.value.trim()=="" || s2.value.length<10)
                {
                    alert("Enter Valid Crime Details!!");
                    s2.focus();
                    return false;
                }
                if(s4.value.trim()=="" || s4.value.length<3)
                {
                    alert("Enter Valid Police Station");
                    s4.focus();
                    return false;
                }
                if(s5.value.trim()=="" || s5.value.length<6)
                {
                    alert("FIR Number is not valid");
                    s5.focus();
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
                <th colspan="2">Crime Details</th>
            </tr>
            <tr><td>Criminal Name:</td><td>
                    <select name="t1" id="t1">
                        <%
                                stmt=con.prepareStatement("Select * from criminals");
                                rs=stmt.executeQuery();
                                while(rs.next())
                                {
                                    String s0=rs.getString(1);
                                    String s1=rs.getString("name");
                                    String s2=rs.getString("father");
                                    out.write("<option value='"+s0+"'>"+s1+", "+s2+"</option>");
                                }
                        %>
                    </select>
                </td><td>*</td></tr>
            <tr><td>Crime Details:</td><td><textarea name="t2" id="t2"></textarea></td><td>*</td></tr>
            <tr><td>Crime Date:</td><td><input type="date" name="t3" id="t3"></td><td>*</td></tr>
            <tr><td>Police Station:</td><td><input type="text" name="t4" id="t4"></td><td>*</td></tr>
            <tr><td>FIR No:</td><td><input type="text" name="t5" id="t5"></td><td>*</td></tr>
            <tr><td>Crime Category:</td><td><select name="t6" id="t6">
                     <%
                                stmt=con.prepareStatement("Select * from crimecategories");
                                rs=stmt.executeQuery();
                                while(rs.next())
                                {
                                    String s1=rs.getString("cname");
                                    out.write("<option value='"+s1+"'>"+s1+"</option>");
                                }
                        %></select>
             </td><td>*</td></tr>
            
            
            <tr><td>:</td><td><input onClick="return submitform()" type="submit" name="b1" value="Save"></td><td></td></tr>
            <tr><td></td><td><font color="red"><%=msg%></font></td><td></td></tr>
        </table></form>        
        
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
