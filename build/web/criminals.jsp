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
            stmt=con.prepareStatement("Select count(*)+1 from Criminals");
            rs=stmt.executeQuery();
            String cid="";
            if(rs.next()) cid=rs.getString(1);
            stmt=con.prepareStatement("Insert into Criminals values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,null)");
            stmt.setString(1,cid);
            stmt.setString(2,request.getParameter("t1"));
            stmt.setString(3,request.getParameter("t2"));
            stmt.setString(4,request.getParameter("t3"));
            stmt.setString(5,request.getParameter("t4"));
            stmt.setString(6,request.getParameter("t5"));
            stmt.setString(7,request.getParameter("t6"));
            stmt.setString(8,request.getParameter("t7"));
            stmt.setString(9,request.getParameter("t8"));
            stmt.setString(10,request.getParameter("t9"));
            stmt.setString(11,request.getParameter("t10"));
            stmt.setString(12,request.getParameter("t11"));
            stmt.setString(13,request.getParameter("t12"));
            stmt.setString(14,request.getParameter("t13"));
            stmt.setString(15,request.getParameter("t14"));
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
                s6=document.getElementById("t6");
                s7=document.getElementById("t7");
                s8=document.getElementById("t8");
                s9=document.getElementById("t9");
                s10=document.getElementById("t10");
                s11=document.getElementById("t11");
                s12=document.getElementById("t12");
                s13=document.getElementById("t13");
                s14=document.getElementById("t14");
                if(s1.value.trim()=="" || s1.value.length<3)
                {
                    alert("Enter Valid Name!!");
                    s1.focus();
                    return false;
                }
                if(s2.value.trim()=="" || s2.value.length<3)
                {
                    alert("Enter Valid Father Name!!");
                    s2.focus();
                    return false;
                }
                if(s3.value.trim()=="" || s3.value.length<3)
                {
                    alert("Enter Valid Mother Name!!");
                    s3.focus();
                    return false;
                }
                if(s7.value.trim()=="" || s7.value.length<10)
                {
                    alert("Enter Valid Address");
                    s7.focus();
                    return false;
                }
                if(s9.value.trim()=="" || s9.value.length<3)
                {
                    alert("Enter Valid City");
                    s9.focus();
                    return false;
                }
                if(s10.value.trim()=="" || s10.value.length!=6)
                {
                    alert("Enter Valid Pin Code");
                    s10.focus();
                    return false;
                }
                else
                {
                    for(i=0;i<6;i++)
                    {
                        c=s10.value.substring(i,i+1);
                        if(c<'0' || c>'9')
                        {
                            alert("Pin Code in Numbers Only");
                            s10.focus();
                            return false;
                        }
                    }
                }
                if(s11.value.trim()=="" || s11.value.length!=10)
                {
                    alert("Enter Valid Mobile Number");
                    s11.focus();
                    return false;
                }
                else
                {
                    for(i=0;i<10;i++)
                    {
                        c=s11.value.substring(i,i+1);
                        if(c<'0' || c>'9')
                        {
                            alert("Mobile in Numbers Only");
                            s11.focus();
                            return false;
                        }
                    }
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
                <th colspan="3">Crime Categories</th>
            </tr>
            <tr><td>Criminal Name:</td><td><input type="text" name="t1" id="t1"></td><td>*</td></tr>
            <tr><td>Father Name:</td><td><input type="text" name="t2" id="t2"></td><td>*</td></tr>
            <tr><td>Mother Name:</td><td><input type="text" name="t3" id="t3"></td><td>*</td></tr>
            <tr><td>Brother's Details:</td><td><input type="text" name="t4" id="t4"></td><td></td></tr>
            <tr><td>Sister's Details:</td><td><input type="text" name="t5" id="t5"></td><td></td></tr>
            <tr><td>Date Of Birth:</td><td><input type="date" name="t6" id="t6"></td><td>*</td></tr>
            <tr><td>Address:</td><td><textarea name="t7"  id="t7"></textarea></td><td>*</td></tr>
                        <tr><td>State:</td><td><select name="t8">
                                    <option>Uttar Pradesh</option>
                                    <option>Bihar</option>
                                    <option>Rajasthan</option>
                                    <option>Punjab</option>
                                    <option>Himachal</option>
                                    <option>Maharasthtra</option>
                    </select></td></tr>
            <tr><td>City:</td><td><input type="text" name="t9"  id="t9"></td><td>*</td></tr>
            <tr><td>Pin Code:</td><td><input type="text" name="t10" id="t10"></td><td>*</td></tr>
            <tr><td>Contact Numbers:</td><td><input type="text" name="t11"  id="t11"></td><td>*</td></tr>
            <tr><td>In Date:</td><td><input type="date" name="t12" id="t12"></td><td>*</td></tr>
            <tr><td>Out Date:</td><td><input type="date" name="t13" id="t13"></td><td>*</td></tr>
            <tr><td>Security Level:</td><td><select name="t14"><option>Very High</option><option>High</option><option>Normal</option></select></td><td>*</td></tr>
            <tr><td>:</td><td><input onClick="return submitform()" type="submit" name="b1" value="Save"></td><td></td></tr>
            <tr><td></td><td><font color="red"><%=msg%></font></td><td></td></tr>
        </table></form>
        <hr>
        <table align="center">
            <tr>
                <th>Criminal Code</th><th>Name</th><th>Father</th><th>Mother</th><th>Brothers</th><th>Sisters</th><th>Date of Birth</th><th>Address</th><th>State</th><th>City</th><th>Pin Code</th><th>Contact Numbers</th><th>In Date</th><th>Out Date</th><th>Security Level</th><th>Photo</th><th></th>
            </tr>
        <%
            stmt=con.prepareStatement("Select * from Criminals");
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
                out.write("<td>"+rs.getString(6)+"</td>");
                out.write("<td>"+rs.getString(7)+"</td>");
                out.write("<td>"+rs.getString(8)+"</td>");
                out.write("<td>"+rs.getString(9)+"</td>");
                out.write("<td>"+rs.getString(10)+"</td>");
                out.write("<td>"+rs.getString(11)+"</td>");
                out.write("<td>"+rs.getString(12)+"</td>");
                out.write("<td>"+rs.getString(13)+"</td>");
                out.write("<td>"+rs.getString(14)+"</td>");
                out.write("<td>"+rs.getString(15)+"</td>");
                out.write("<td><img src='getImage.jsp?id="+cid+"' width='50'></td>");
                out.write("<td><a href='#' onClick=\"uploadphoto('"+cid+"')\">Change/Upload Photo</a></td>");
                out.write("</tr>");
            }
        %>
        </table>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
