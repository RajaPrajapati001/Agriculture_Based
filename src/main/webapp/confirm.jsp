<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Deletion</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
        %>
        <form id="confirmdelete" action="DeleteLogic.jsp" method="post">
            <input type="hidden" name="ids" value="<%= id %>">
        </form>
        <script>
            if (confirm("Do you want to delete this data?")) {
                document.getElementById("confirmdelete").submit();
            } else {
                window.location.href = "table.jsp";
            }
        </script>
    </body>
</html>
