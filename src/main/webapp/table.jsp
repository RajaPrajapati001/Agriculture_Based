<%--
    Document   : table
    Created on : Jul 19, 2024, 3:05:48 PM
    Author     : raja
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Previous Data Page</title>
        <style>
            /* Basic reset */
            * {
                margin: 0;
                /*    padding: 0;*/
                box-sizing: border-box;
            }
            body{
                /*    background-image: url("depositphotos_162298886-stock-photo-green-texture-background.jpg");*/
                background-image: repeating-linear-gradient(68deg,rgb(22, 108, 14) 0%,rgb(144, 239, 136) 50%,rgb(212, 172, 98) 50%,rgb(210, 201, 185) 100%);
                background-size:cover;
                height:100vh;
                width:100vw;
                display:flex;
                justify-content: center;
                flex-direction: column;
                align-items:center;
            }

            /* Center container */
            .container {
                background-color: rgb(209, 219, 226);
                backdrop-filter: blur(7px);
                /*    margin: auto;*/
                display: flex;
                flex-direction: column;
                align-items: center;
                padding-bottom: 20px;
                border-radius: 10px;
                width: 80%;
                /*    margin-top: 7%*/

            }

            /* Style for the header */
            .head {
                text-align: center;
                font-size: 24px;
                margin: 20px 0;
                font-weight: bold;
                color: black;
            }

            /* Style for the table */
            .box {
                width: 96%;
                max-width: 96%;
                overflow-x: auto;
                overflow-y: auto;
                max-height: 400px; /* Adjust this value as needed */
            }

            table {
                min-width: 100%;
                /*    border-collapse: collapse;*/

            }
            thead tr{
                position: sticky;
                top: 0;
            }

            th, td {
                padding: 10px;
                text-align: center;
                height:auto;
                width:auto;
                /* border: 1px solid #ccc; */
            }

            /* Even and odd row colors */
            tbody tr:nth-child(odd) {
                background-color: #f9f9f9;
            }

            tbody tr:nth-child(even) {
                background-color: #e9e9e9;
            }

            /* Responsive table */
            @media screen and (max-width: 200px) {
                table, thead, tbody, th, td, tr {
                    display: block;
                }

                thead tr {
                    display: none;
                }

                tbody tr {
                    margin-bottom: 10px;
                }

                tbody td {
                    text-align: right;
                    padding-left: 50%;
                    position: relative;
                    font-size:1rem;
                }

                tbody td::before {
                    content: attr(data-label);
                    position: absolute;
                    left: 0;
                    width: 50%;
                    padding-left: 10px;
                    font-weight: bold;
                    text-align: left;
                }
            }
            th{
                height:auto;
                background-color: white;
            }

            .back{
                position:  absolute;
                left:2%;
                top:2%;
                width: 90px;
                height: 40px;
                border-radius: 20px;
                background-color: rgb(255, 255, 255);
                border: 1px solid white;
                backdrop-filter: blur(9px);
                font-weight:bold;
            }
            button:hover{
                box-shadow: 1px 1px 7px 1px black;
            }
            .back a{
                text-decoration: none;
                font-size: 18px;
                font-weight: 800;
                color:black;
            }
            .back:hover{
                box-shadow: 1px 1px 6px 0px rgb(195, 255, 0);
            }
            tbody tr:hover{
                background-color:#e9e9e9;
            }
            #deletebtn{
                font-family:arial;
                font-weight:bold;
                color:white;
                background-color:#ff3333;
                border:1px solid black;
                border-radius:5px;

            }

        </style>
    </head>
    <body>
        <%
             String UserName = (String) session.getAttribute("message");
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "Raja@2005");
             String query = "SELECT * FROM userdetails WHERE user = ?";
             PreparedStatement ps = con.prepareStatement(query);
             ps.setString(1, UserName);
             ResultSet rs = ps.executeQuery();

             if (!rs.next()) {
        %>
        <script>
            alert("Empty Set! Please Enter Data");
            window.location.href = "inputs.html";
        </script>
        <%
            } else {
        %>
        <form action="home.jsp">
            <button class="back">Back</button>
        </form>

        <div class="container">
            <div class="head">User's Crop Data</div>
            <div class="box">
                <table>
                    <thead>
                        <tr>
                            <th>Crop</th>
                            <th>Year</th>
                            <th>Rate(Rs/Kg)</th>
                            <th>Acre</th>
                            <th>Cost(Rs.)</th>
                            <th>Production(kg.)</th>
                            <th>Revenue(Rs)</th>
                            <th>Profit(Rs.)</th>
                            <th>Loss(Rs)</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            do {
                                int id = rs.getInt("id");
                                String name = rs.getString("crop");
                                int year = rs.getInt("year");
                                float rate = rs.getFloat("rate");
                                float acre = rs.getFloat("acre");
                                float cost = rs.getFloat("cost");
                                float production = rs.getFloat("pro");
                                float profit = rs.getFloat("adv");
                                float loss = rs.getFloat("loss");
                                float revenue = rs.getFloat("income");
                        %>
                        <tr>
                            <td><%= name %></td>
                            <td><%= year %></td>
                            <td><%= rate %></td>
                            <td><%= acre %></td>
                            <td><%= cost %></td>
                            <td><%= production %></td>
                            <td><%= revenue %></td>
                            <td><%= profit %></td>
                            <td><%= loss %></td>
                            <td>
                                <form action="confirm.jsp" method="post">
                                    <input type="hidden" name="id" value="<%= id %>">
                                    <input type="submit" value="Delete" id="deletebtn">
                                </form>
                            </td>
                        </tr>
                        <%
                            } while (rs.next());
                        %>
                    </tbody>
                </table>
            </div>
        </div>
        <%
            }
            con.close();
        %>

    </body>
</html>

