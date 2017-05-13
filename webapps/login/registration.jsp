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
   <div class="login"><% try{
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
     %></div>



     <!DOCTYPE html>
     <html>
       <head>
         <meta charset="utf-8">
         <title></title>
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
         <style>
         table, th, td {
             border: 1px solid black;
             border-collapse: collapse;

         }
         table {
       		border-collapse: collapse;
       		border-spacing: 0;
       	}
         table{
         table-layout: fixed;
         width: 300px;
     }

     }
     th{
       width:100%;
     }
         </style>

         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


             <style>
             /* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
             @import url(http://fonts.googleapis.com/css?family=Open+Sans);
       .btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
       .btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
       .btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
       .btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
       .btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
       .btn-primary.active { color: rgba(255, 255, 255, 0.75); }
       .btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
       .btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
       .btn-block { width: 100%; display:block; }

       * { -webkit-box-sizing:border-box; -moz-box-sizing:border-box; -ms-box-sizing:border-box; -o-box-sizing:border-box; box-sizing:border-box; }

       html { width: 100%; height:100%; overflow:hidden; }

       body {
       	width: 100%;
       	height:100%;
       	font-family: 'Open Sans', sans-serif;
       	background: #092756;
       	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
       	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
       	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
       	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
       	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
       	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
       }
       .login {
       	position: absolute;
       	top: 50%;
       	left: 50%;
       	margin: -150px 0 0 -150px;
       	width:300px;
       	height:300px;
       }
       .login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

       input {
       	width: 100%;
       	margin-bottom: 10px;
       	background: rgba(0,0,0,0.3);
       	border: none;
       	outline: none;
       	padding: 10px;
       	font-size: 13px;
       	color: #fff;
       	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
       	border: 1px solid rgba(0,0,0,0.3);
       	border-radius: 4px;
       	box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
       	-webkit-transition: box-shadow .5s ease;
       	-moz-transition: box-shadow .5s ease;
       	-o-transition: box-shadow .5s ease;
       	-ms-transition: box-shadow .5s ease;
       	transition: box-shadow .5s ease;
       }
       input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); }

           </style>
         <style>
         #a{
           color : white;
         }
         td, th, a, div {
           color : white;
         }
         </style>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
       </head>
       <body>

       </body>
     </html>
