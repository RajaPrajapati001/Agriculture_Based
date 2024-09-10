<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, javax.mail.*, javax.mail.internet.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
        <%Random ran=new Random();
        int i=1000+ran.nextInt(9000);
        session.setAttribute("reotp",i);
        String str=String.valueOf(i);
            String result;
     String newu=(String)session.getAttribute("username");
     String year=(String)session.getAttribute("birthyear");
     String newp=(String)session.getAttribute("password");
    final String to= (String)session.getAttribute("mail");
    int j=0;
  try{Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "Raja@2005");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from userdata");

    while (rs.next()) {
        String emailid = rs.getString("email");
        if (emailid.equalsIgnoreCase(to)) {
        %>
        <script>
            alert("Email Already Exists.So Please Use Another Email");
            window.location.href = "Acount.html";
        </script>
        <%j=1;
}}}catch(Exception e){
           e.printStackTrace();
}if(j==0){
            final String subject = "OTP";
            final String messg = "Dear User,\n\n" +
                 "Thank you for registering with Jaikisan. Your one-time password (OTP) is:\n\n" +
                 str + "\n\n" +
                 "Please enter this OTP on the website to complete your registration.\n\n" +
                 "If you did not request this OTP, please ignore this email.\n\n" +
                 "Best regards,\n" +
                 "The Jaikisan Team";
            final String from = "jaikishanweb001@gmail.com";
            final String pass = "mjoytbpgsdvirwap";
            String host = "smtp.gmail.com";
            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(from, pass);
                }
            });

            mailSession.setDebug(true);

            try {
                MimeMessage message = new MimeMessage(mailSession);
                message.setFrom(new InternetAddress(from));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject(subject);
                message.setText(messg);
                Transport.send(message);
                result = "Message sent successfully!";
            } catch (MessagingException e) {
                e.printStackTrace();
                result = "Error: unable to send message.";
}if(result=="Message sent successfully!"){
       long currenttime=System.currentTimeMillis();
       long exptime=currenttime+1*60*1000;
       session.setAttribute("expirytime",exptime);
        response.sendRedirect("inputotpresend.jsp");


    }}
        %>

    </body>
</html>

