<%
    String msg=request.getParameter("err");
    if(msg==null) msg="";
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
               
            }
        </script>
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" alt=""><hr>
        <table width='100%'>
            <tr>
                <td><img src='images/c3.jpg' width='300'></td><td>
                    <form name='frm1' method="post" action='dologin.jsp'>
                    <table>
                        <th colspan='3'>User Authentication</th>
                        <tr>
                            <td>Login:</td><td><input type='email' name='t1' id='t1' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td></td>
                        </tr>
                        <tr>
                            <td>Password:</td><td><input type='password' name='t2' id='t2' style='border-width:1px; border-style:solid;border-color:red;width:200px'></td><td></td>
                        </tr>
                        <tr>
                            <td></td><td><input type='submit' style=" border-style:none; border-width:0px;background-image:url('images/login.jpg');width:150px; height: 40px" value='' ></td><td></td>
                        </tr>
                        <tr>
                            <td></td><td><img src='images/forgot.jpg' width='100'><img src='images/registernow.png' width='100'></td><td></td>
                        </tr>
                        <tr>
                            <td></td><td><font color='red'><%=msg%></font></td><td></td>
                        </tr>
                    </table></form>
                </td><td><img src='images/c5.jpg' width='300'></td>
            </tr>
        </table>
        <hr><img src="images/footer.jpg" width="100%" alt="">
    </body>
</html>
