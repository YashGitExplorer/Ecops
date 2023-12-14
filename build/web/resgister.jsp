<%@page contentType="text/html" import="java.sql.*" %>
<%
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
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script>
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
               if(s1.value.trim()=="")
               {
                   alert("Email is must!!");
                   s1.focus();
                   return false;
               }
               if(s2.value.trim()!=s3.value.trim() || s2.value.length<8)
               {
                   alert("Both Password must be same.\nMin length of the password is 8");
                   s2.focus();
                   return false;
               }
               if(s4.value.trim()=="")
               {
                   alert("Name is Compulsory");
                   s4.focus();
                   return false;
               }
               if(s5.value.trim()=="")
               {
                   alert("Age is Compulsory");
                   s5.focus();
                   return false;
               }
               if(s7.value.trim()=="" || s7.value.length<5)
               {
                   alert("Security answer is compulsory.\nIt will help you to remnid the password.\nMin length of the answer is 5");
                   s5.focus();
                   return false;
               }
               return true;
               
            }
        </script>
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" alt=""><hr>
                    <form name='frm1' method="post">
                    <table align='center'>
                        <th colspan='3'>User Registration</th>
                        <tr>
                            <td>Email:</td><td><input type='email' name='t1' id='t1' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>
                        </tr>
                        <tr>
                            <td>Password:</td><td><input type='password' name='t2' id='t2' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>
                        </tr>
                        <tr>
                            <td>Re-Password:</td><td><input type='password' name='t3' id='t3' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>
                        </tr>
                        <tr>
                            <td>Name:</td><td><input type='text' name='t4' id='t4' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>
                        </tr>
                        <tr>
                            <td>Age:</td><td><input type='number' name='t5' id='t5' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>
                        </tr>
                        <tr>
                                    <td>Security Question:</td><td><select name="t6" id="t6">
                                            <option>First School?</option>
                                            <option>Favorite Destination?</option>
                                            <option>First Friend's Name?</option>
                                            <option>Favorite Vehicle?</option>
                                </select></td><td></td>
                        </tr>
                        <tr>
                            <td>Security Answer:</td><td><input type='text' name='t7' id='t7' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td>*</td>
                        </tr>
                        <tr>
                            <td>Why you need criminals data?:</td><td><textarea name='t8' id='t8'></textarea></td><td></td>
                        </tr>
                        <tr>
                            <td></td><td><input onClick="return submitform()" type='submit' name="b1" style=" border-style:none; border-width:0px;background-image:url('images/register.png');width:150px; height: 40px" value='' ></td><td></td>
                        </tr>
                        <tr>
                            <td></td><td><font color='red'><%=msg%></font></td><td></td>
                        </tr>
                    </table></form>
               
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
