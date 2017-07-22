<%-- 
    Document   : login
    Created on : 16 Sep, 2016, 7:02:45 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ERROR</title>
    </head>
        <%
           String us,psw;
           us=request.getParameter("uname");
            psw=request.getParameter("psw");
            
if (us.equals("ece") && psw.equals("ece")) {
       response.sendRedirect("choose.html");
    }
else
{
    
    out.println("<center><h1 style=\"color:darkblue\">Sorry ur username and password not valid</h1></center>");
    
    
}
       %>
</html>
