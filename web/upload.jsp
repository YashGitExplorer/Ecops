<%-- 
    Document   : upload
    Created on : Jul 4, 2016, 9:21:41 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*,java.io.*;" contentType="text/html" pageEncoding="UTF-8"%>
<%
                String contentType=request.getContentType();
                DataInputStream in = new DataInputStream(request.getInputStream());
                int formDataLength = request.getContentLength();
                byte dataBytes[] = new byte[formDataLength];
                int byteRead = 0;
                int totalBytesRead = 0;
                while (totalBytesRead < formDataLength)
                {
                    byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
                    totalBytesRead += byteRead;
                }
                String file = new String(dataBytes);
                int p1=file.indexOf("Content-Type:")+13;
                int p2=file.indexOf("\r\n\r\n",p1);
                String ctype=file.substring(p1,p2);
                int lastIndex = contentType.lastIndexOf("=");
                String boundary = contentType.substring(lastIndex + 1, contentType.length());
                int pos;
                pos = file.indexOf("filename=\"");
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                pos = file.indexOf("\n", pos) + 1;
                int boundaryLocation = file.indexOf(boundary, pos) - 4;
                int startPos = ((file.substring(0, pos)).getBytes()).length;
                int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                byte[] mydata=new byte[endPos-startPos+1];
                for(int i=0;i<mydata.length;i++)
                {
                            mydata[i]=dataBytes[i+startPos];
                }        
                Connection con=(Connection)session.getAttribute("CON");
                PreparedStatement stmt=con.prepareStatement("Update criminals set Photo=? where cid=?");
                stmt.setBytes(1,mydata);
                stmt.setString(2,request.getParameter("cid"));
                stmt.executeUpdate();
                out.write("<script>window.close()</script>");
                
%>