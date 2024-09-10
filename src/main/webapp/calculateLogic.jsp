<%--
    Document   : logic
    Created on : Jul 19, 2024, 8:14:08 AM
    Author     : raja
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
        <link rel="stylesheet" href="last.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer">

    </head><body>
        <% Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "Raja@2005");
            String message= (String) session.getAttribute("message");
            String crop=request.getParameter("crop");
          String quality=request.getParameter("quality");
        int year = 0;
        float acre = 0;
        float quantity = 0;
        float rate = 0;
        float seed=0;
        float pes=0;
        float labor=0;
        float machine=0;
        float electricity=0;
        float other=0;
        String var="Other";
            year = Integer.parseInt(request.getParameter("year"));
            acre = Float.parseFloat(request.getParameter("acre"));
            quantity = Float.parseFloat(request.getParameter("quantity"));
            rate = Float.parseFloat(request.getParameter("rate"));
            seed=Float.parseFloat(request.getParameter("seed"));
            pes=Float.parseFloat(request.getParameter("pes"));
            labor=Float.parseFloat(request.getParameter("labor"));
            machine=Float.parseFloat(request.getParameter("machine"));
            electricity=Float.parseFloat(request.getParameter("electricity"));
            other=Float.parseFloat(request.getParameter("other"));
if(crop.equals(var)){
if(quality.trim().isEmpty()||quality.isEmpty()){
        %><script>alert("Please Fill All Fields");
       window.location.href="inputs.html";</script><%
            }else{
crop=quality;
}
            }if(year>=2020&&year<=2030){
float total=seed+pes+labor+machine+electricity+other;
float production=quantity*rate;
float profit=production-total;
float loss=0;
    if(profit<0){
        loss=Math.abs(profit);
        profit=0;
    }else{
        loss=0;
    }  
    int k=0; 
    try{
        String UserName=(String)session.getAttribute("message");
        String query = "select * from userdetails where user=? and crop=? and year=?";
        PreparedStatement pst = con.prepareStatement(query);
        pst.setString(1,UserName);
        pst.setString(2,crop);
        pst.setInt(3,year);
        ResultSet rst = pst.executeQuery();
            while(rst.next()){
                k++;
            }
    }catch(Exception e){
        e.printStackTrace();
    }
            if(k==0){
                try{
                    String sql = "INSERT INTO userdetails(user,crop,year,rate,acre,cost,pro,adv,loss,income) VALUES (?,?,?,?,?,?,?,?,?,?)";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1,message);
                    ps.setString(2,crop);
                    ps.setInt(3,year);
                    ps.setFloat(4,rate);
                    ps.setFloat(5,acre);
                    ps.setFloat(6,total);
                    ps.setFloat(7,quantity);
                    ps.setFloat(8,profit);
                    ps.setFloat(9,loss);
                    ps.setFloat(10,production);
int i = ps.executeUpdate();
if (i > 0) {
session.setAttribute("crop",crop);
session.setAttribute("acre",acre);
session.setAttribute("year",year);
session.setAttribute("seed",seed);
session.setAttribute("pes",pes);
session.setAttribute("labor",labor);
session.setAttribute("machine",machine);
session.setAttribute("electricity",electricity);
session.setAttribute("other",other);
session.setAttribute("quantity",quantity);
session.setAttribute("rate",rate);
session.setAttribute("total",total);
session.setAttribute("production",production);
session.setAttribute("profit",profit);
session.setAttribute("loss",loss);

        %>



<div class="bbody">
            <div class="box">
                <div class="row">
                    <div class="no n">No</div>
                    <div class="detail dtl" style="text-align: center;">Details:</div>
                    <div class="amount amnt">Cost</div>
                </div>
                <div class="row b">
                    <div class="no tono all" id="ss">1</div>
                    <div class="detail todtl all" id="ss">Crop Name:</div>
                    <div class="amount toamnt all" id="ss"><%=crop%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">2</div>
                    <div class="detail todtl all">Crop's Area(In Acre):</div>
                    <div class="amount toamnt all"><%=acre%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">3</div>
                    <div class="detail todtl all">Crop Quantity(In kg):</div>
                    <div class="amount toamnt all"><%=quantity%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">4</div>
                    <div class="detail todtl all">Seed Cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=seed%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">5</div>
                    <div class="detail todtl all">Pesticide & Fertilizer Cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=pes%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">6</div>
                    <div class="detail todtl all">Machinery Cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=machine%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">7</div>
                    <div class="detail todtl all">Electricity Cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=electricity%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">8</div>
                    <div class="detail todtl all">Labor Cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=labor%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">9</div>
                    <div class="detail todtl all">Other Cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=other%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">10</div>
                    <div class="detail todtl all">Retail Price (per kg)</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=rate%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">11</div>
                    <div class="detail todtl all">Total cost:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=total%></div>
                </div>
                <div class="row ">
                    <div class="no tono all">12</div>
                    <div class="detail todtl all">Revenue:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=production%></div>
                </div>
                    <%if(profit>0){%><div class="row ">
                        <div class="no fino1 all">13</div>
                    <div class="detail fidtl1 all">Crop's Profit:</div>
                    <div class="amount fiamnt1 all"><i class="fa-solid fa-indian-rupee-sign"></i><%=profit%></div>
                    </div><%}else if(loss>0){%>
                    <div class="row ">
                    <div class="no fino2 all">13</div>
                    <div class="detail fidtl2 all">Crop's Loss:</div>
                    <div class="amount fiamnt2 all"><i class="fa-solid fa-indian-rupee-sign"></i><%=loss%></div>
                </div><%}else if(loss==0){%> <div class="row ">
                    <div class="no tono all">13</div>
                    <div class="detail todtl all">Profit & Loss:</div>
                    <div class="amount toamnt all"><i class="fa-solid fa-indian-rupee-sign"></i><%=profit%></div>
                </div><%}%>
            </div>
            <div class="btns">
              <form action="home.jsp"><button class="a1">Back</button></form>
            </div>
 

                                 <% }else{


out.println("Data not inserted");
}
        }catch(Exception e){
e.printStackTrace();
}
}else{
%><script>alert("Duplicate Entry Found");
window.location.href="inputs.html";
</script>
<%
}}else{
%><script>
    alert("Please Enter Crop's Year Between 2020 to 2030");
    window.location.href="inputs.html";
</script>
<%
}%>
  </body>
  </html>