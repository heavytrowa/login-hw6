<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<%
  String user = "4104029011";
  String pass = "Ss4104029011!";
  String database = "4104029011";
  String url = "jdbc:mysql://140.120.49.205/" + database + "?useUnicode=true&characterEncoding=big5";
  //建立一個聯結物件
  Connection con;
   //建立PreparedStatement物件
   PreparedStatement pstmt = null;
   String username = request.getParameter("uname");
   String pwd = request.getParameter("pass"); %>
   <% try{
       //定義驅動程式與資料來源之間的連結
       Class.forName("com.mysql.jdbc.Driver").newInstance();
       //建立一個聯結物件
       con = DriverManager.getConnection(url,user,pass);
       Statement stat = con.createStatement();
       ResultSet rs;
       String sql_query = "select * from homework where uname='"+username+"'";
       rs = stat.executeQuery(sql_query);
       if(rs.next()){
         out.println("此帳號已被使用過了");
         out.println("<a href='reg.jsp'>重新註冊</a>");
       }else{
       String sql = "insert into homework(uname, pass) values('"+ username + "', '"+pwd+ "')";
       int i = stat.executeUpdate(sql);

       if (i > 0) {
         session.setAttribute("userid", user);

         out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
       } else {
           response.sendRedirect("index.jsp");
       }
     }


       //stat.executeUpdate(sql_insert);
     }catch(SQLException sqle){
       out.println("SQL Exception : " + sqle);
     }
     %>




<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
            <title></title>
        </head>
        <body></body>
    </html>
