<%
            Class.forName("org.gjt.mm.mysql.Driver");
            java.sql.Connection con=java.sql.DriverManager.getConnection("jdbc:mysql://127.0.0.1/crimedb","root","");
            java.sql.PreparedStatement stmt=con.prepareStatement("Select * from criminals where cid=?");
            stmt.setString(1,request.getParameter("id"));
            java.sql.ResultSet rs=stmt.executeQuery();
            if(rs.next())
            {
                java.io.OutputStream fout=response.getOutputStream();
                byte[] data=rs.getBytes("photo");
                response.setContentType("image/jpeg");
                response.setContentLength(data.length);
                fout.write(data);
                fout.close();
            }
            con.close();               
%>