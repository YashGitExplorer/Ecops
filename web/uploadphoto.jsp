<%-- 
    Document   : uploadphoto
    Created on : Jan 23, 2019, 12:22:33 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <form method='post' enctype="multipart/form-data" action='upload.jsp?cid=<%=request.getParameter("cid")%>'>
            Select File:<input type='file' name='t1'><br>
            <input type='submit' name='b1' value='Upload'>
        </form>
    </body>
</html>
