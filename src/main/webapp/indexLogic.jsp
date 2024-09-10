<%@page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
    </head>
    <body>
        <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            int i = 0;
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "Raja@2005");

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery("select * from userdata");

            while (rs.next()) {
                String user = rs.getString("userid");
                String passwd= rs.getString("password");
                 byte []decrypt=Base64.getDecoder().decode(passwd);
                 String pass=new String(decrypt);
                if (user.equals(username) && pass.equals(password)) {
                    i = 1;
                    break;
                }
            }
    if (i == 1) {
     String message = request.getParameter("username");
session.setAttribute("message", message);
        %>
        <script>
            
            window.location.href = "home.jsp";

        </script>
        <%
            } else {
        %>
        <script>
            alert("Login Failed");
            window.location.href = "index.html";
        </script>
        <%
            }
        } catch (Exception e) {
        %>
        <script>
            alert("An error occurred: <%= e.getMessage() %>");
            window.location.href = "index.html";
        </script>
        <%
            e.printStackTrace();
        }
        %>
    </body>
</html>