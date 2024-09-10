<%-- 
    Document   : a
    Created on : Jul 28, 2024, 10:52:32 PM
    Author     : sys
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%
                           try {
                           String name=request.getParameter("ids");
                           int id=0;
            id=Integer.parseInt(name);


            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ams","root","Raja@2005");
    PreparedStatement pst=con.prepareStatement("delete from userdetails where id=?");
   pst.setInt(1,id);
    int i=pst.executeUpdate();
   if(i>0){
         %>
         <script>
                    window.location.href="table.jsp";</script>
         <%
     }else{
         %>
                <script>
                    alert("Data Not Deleted");
                    window.location.href = "table.jsp";
                </script>
         <%
            }
}catch (Exception e) {
         %>
                <script>
                     alert("An error occurred: <%=e.getMessage()%> ");
                    window.location.href = "table.jsp";
                </script>
            <%
            // TODO Auto-generated catch block
            e.printStackTrace();
}
            %>
    </body>
</html>
