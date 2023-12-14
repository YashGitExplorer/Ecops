<%@page import="java.sql.*" contentType="text/html" pageEncoding="UTF-8"%>
<%
        Class.forName("org.gjt.mm.mysql.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1","root","");
        PreparedStatement stmt=con.prepareStatement("Create database crimedb");
        stmt.executeUpdate();
        con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/crimedb","root","");
        stmt=con.prepareStatement("Create table criminals(CID int,Name varchar(30),father  varchar(30),mother varchar(30),brothers varchar(50),sisters varchar(30),DOB date,address varchar(50),state varchar(30),city varchar(30),picode varchar(6),contactnumbers varchar(50),InDate Date,OutDate Date,SecurityLevel varchar(15),Photo mediumblob)");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table users(ulogin varchar(30),upass varchar(30),utype varchar(20))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Insert into users values('admin@admin.com','admin123','admin')");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table Members(email varchar(30) primary key,name varchar(30),age int,securityquestion varchar(30),answer varchar(30),why varchar(100))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table CrimeDetails(CRID int,CID int,CrimeDetails varchar(100),Cdate date,PoliceStation varchar(50),FIRNO varchar(20),CrimeCategory varchar(20))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table CrimeCategories(CID int,CName varchar(100))");
        stmt.executeUpdate();
        stmt=con.prepareStatement("Create table Visitors(VID int,VName varchar(30),Address varchar(100),VDate Date,CriminalName varchar(30))");
        stmt.executeUpdate();        
        stmt=con.prepareStatement("Create table Wardens(WardenNo int Primary Key,WName varchar(30),Rank varchar(30))");
        stmt.executeUpdate();        
        stmt=con.prepareStatement("Create table Tasks(CriminalNo int,CName varchar(30),Task varchar(30))");
        stmt.executeUpdate();        
        out.write("Done");
        
        
%>