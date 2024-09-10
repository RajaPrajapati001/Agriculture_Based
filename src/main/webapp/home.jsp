<!DOCTYPE html>
<%@page import="java.sql.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer">
    
    <style>
        
        *{
          margin: 0;
          padding: 0;
          font-family: arial;
        }

        @media screen and (max-width:1047px) {
            .img2{
                display: none;
            }
            .icon{
                visibility:hidden;
            }
            .lgobtn{
                position:absolute;
                right:0%;
            }

          }
        body{
            background-color: aliceblue;
          background-attachment: fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            width: 100vw;
            min-height: 100vh;
            margin: 0; 
            background-image: url("pexels-pixabay-235925.jpg");
        }
          .bbody{
              min-height: 100vh;
              width: 100vw;
              background: rgb(0,0,0,0.5);
              position:relative;
              display: flex;
              flex-direction: column;
           }
           .nav{
            height: 70px;
            width: 100vw;
            background-color: rgb(255, 255, 255);
            box-shadow: 0px 2px 30px 0px rgb(90, 88, 88);
            display: flex;
            align-items: center;
            position: fixed;
         }
         .navlogo{
            width:20%;
            height: inherit;
            background-image: aqua;
            display: flex;
           }
           .img1{
             height: inherit;
           }
           .img2{
            height: inherit;
           }
          ul{
            margin: auto;
            color: black;
            background-color: rgb(255, 255, 255);
            height: inherit;
            width: 80%;
            float: left;
            list-style-type: none;
            display: block;
            overflow: hidden;
          }
          li:last-child{
            border-right: none;
          }
          li{
            float: left;
          }
          .a{
            display: flex;
            color: #0d0d0d;
            text-align: center;
            padding: 24px 24px;
            text-decoration: none;
            font-size: 1.2rem;
          }
          .a:hover{
            background-color: rgb(41, 99, 10);
            color: rgb(255, 255, 255);
          }
          button{
            height: 33px;
            width: 75px;
            margin-top: 0%;
            margin-right: 2%;
            background-color: rgb(41, 99, 10);
            color: aliceblue;
            border: none;
            outline: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 800;
            font-family: monospace;

          }
          button:hover{
            box-shadow: 2px 2px 10px 0px rgb(255, 255, 255);
          }
          .logbts:hover{
            box-shadow: 1px 1px 7px 0px green;
          }
          .icon{
              margin-right: 0%;
              height: 22px;
              width: 70px;
              /*            background-image:url("menu.png");*/
            background-size: cover;
            font-size: 18px;
            font-weight: 500;
          }
          .homeCo{
            min-height: 100px;
            width: 90%;
             /* background-color: rgb(255, 255, 255);  */
            color: rgb(255, 255, 255);
            margin: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 12%;
            font-size:  2rem;
            font-weight: 800;
            text-align: center;
          }
          .forprofit{
            min-width: 200px;
            height: 40px;
            background-color: red;
            color: aliceblue;
            margin:auto;
            margin-top: 0px;
            font-size: 24px;
            border-radius: 20px;
            box-shadow: 2px 2px 10px 1px white;
           
          }
          .forprofit:hover{
            background-color: rgb(255, 255, 255);
            color: rgb(18, 93, 5);
           
          }
          .main{
            margin:auto;
            margin-top: 0%;
          }
          .homeCo h1 p{
            letter-spacing: 10px;
            white-space: nowrap;
            overflow: hidden;
            border-right: 5px solid white;
            width: 100%;
            animation: typing 2s  steps(18),cursor .4s step-end infinite alternate;
          }
        @keyframes  cursor {
          50%{border: transparent;}
        }
        @keyframes typing {
          from{width: 0}
        }.lgobtn{
            background-color:red;
        }
        @media screen and (max-width:700px) {
            li p{
                display: none;
            }
            .homeCo{
                margin-top:25%;
            }
        }
    </style>
</head>
<body>
    <%String username="Guest";
        Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ams","root","Raja@2005");
//    Statement st=con.createStatement();
    String message= (String) session.getAttribute("message");
//    ResultSet rs=st.executeQuery("select user from userdata where userid=message");
PreparedStatement pst=con.prepareStatement("select username from userdata where userid=?");
pst.setString(1,message);
ResultSet rs=pst.executeQuery();
    while(rs.next()){
    username=rs.getString("username");

    }

    %>
    <div class="bbody">
            <div class="nav">
              <div class="navlogo">
                <img src="globe-hands-people-logo-icon-concept-save-care-earth-people-white-background-ai-illustrations-globe-hands-people-123629154.jpg" alt="" class="img1">
                <img src="jai-kisan-deal-logo-page-copy-desk.jpg" alt="" class="img2">
           </div>
           <ul>
              <li><a href="home.jsp" class="a"><i class="fa-solid fa-house">&nbsp </i><p>Home</p></a></li>
              <li><a href="table.jsp" class="a"><i class="fa-solid fa-database">&nbsp</i><p>UserData</p></a></li>
              <li><a href="inputs.html" class="a"><i class="fa-solid fa-calculator">&nbsp</i><p>CalculateProfit</p></a></li>
              <li><a href="AboutUs.html" class="a"><i class="fa-solid fa-circle-info"></i><p>AboutUs</p></a></li>
           </ul>
           <button class="lgobtn"><a href="index.html" style="color:white;text-decoration: none;font-weight:700">LogOut</a></button>
           <p class="icon"><%=username%></p>
            </div>
            <div class="homeCo">
                <h1 style="display: inline-block;"><p>Start</p></h1>
                <h2>and Calculate your Profit</h2> <br>
                <h3>with our website which provide very resposive generate profit output for you</h3>
            </div>
            <a href="inputs.html" class="main"><button class="forprofit">Get Profit</button></a>

          
               </div>
</body>
</html>