<%--
    Document   : createlogic
    Created on : Jul 5, 2024, 8:53:38 AM
    Author     : raja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*,java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WebPage</title>
    </head>
    <body>
        <%
//        long currenttime = (Long) session.getAttribute("curtime");
       long currenttime=System.currentTimeMillis();
        long exptime = (Long) session.getAttribute("expirytime");
        String email = (String) session.getAttribute("mail");
        String newu = (String) session.getAttribute("username");
        String year = (String) session.getAttribute("birthyear");
         String newpass= (String) session.getAttribute("password");
        byte [] encrypt=Base64.getEncoder().encode(Password.getBytes());
        String newp=new String(encrypt);
        int orgotp = (Integer) session.getAttribute("reotp");
        int inputotp = Integer.parseInt(request.getParameter("inputotp"));
        String username = newu.trim() + year;
        int j = 0;

        if (newu.trim().isEmpty() || year.trim().isEmpty() || newp.trim().isEmpty() || email.trim().isEmpty()) {
        %>
        <script>
            alert("Please Fill All the Fields");
            window.location.href = "Acount.html";
        </script>
        <%
        } else {
            if (orgotp==inputotp && currenttime<=exptime) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "Raja@2005");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from userdata");

                    while (rs.next()) {
                        String userid = rs.getString("userid");
                        if (username.equalsIgnoreCase(userid)) {
        %>
        <script>
            alert("Duplicate Account Found");
            window.location.href = "Acount.html";
        </script>
        <%
            j = 1;
        }
    }

    if (j == 0) {
        int yearInt = Integer.parseInt(year.trim());
        if (yearInt >= 1950 && yearInt <= 2010) {
            String sql = "INSERT INTO userdata(email,username, userid, password) VALUES (?,?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2, newu);
            ps.setString(3, username);
            ps.setString(4, newp);
            int i = ps.executeUpdate();

            if (i > 0) {
        %>
        <script>
            var users = "<%=username%>";
            alert("Account Successfully Created. Your User-Id Is: " + users);
            window.location.href = "index.html";
        </script>
        <%
        }
    } else {
        %>
        <script>
            alert("Please enter valid BirthYear between 1950 to 2010");
            window.location.href = "Acount.html";
        </script>
        <%
    }
}
} catch (Exception e) {
e.printStackTrace();
}
} else if(currenttime>exptime) {

        %><script>if (confirm("Otp Has Expired.Do You Want To Resend Otp?")) {
                window.location.href = "resend.jsp";
            } else {
                window.location.href = "Acount.html";
            }




        </script>



        <%        } else {
        %>
        <script>
            alert("Otp Is Invalid Or Wrong");
            window.location.href = "inputotpresend.jsp";
        </script>
        <%
        }
    }
        %>
    </body>
</html>

