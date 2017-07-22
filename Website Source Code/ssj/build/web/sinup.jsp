

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%
      String Num=request.getParameter("Num");
      String Username=request.getParameter("Username");
      String PLACE=request.getParameter("PLACE");
      
              try
      {
          Class.forName("com.mysql.jdbc.Driver");
            Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/skp_test", "root", "");
             
           Statement stmt = con.createStatement();
            stmt.executeUpdate("INSERT INTO iot_update (Num,Username,PLACE) VALUES ('"+Num+"','"+Username+"','"+PLACE+"')");
  out.println("<html>");

out.println("<head>");

out.println("</head>");

out.println("<body>");
out.println("<center>");
out.println("<h1 style='color: darkslategray'>CHANGES HAS BEEN SAVED  </h1>"); 
out.println("<h2 style='color: darkslategray'> Thank you for Registration! </h2>"); 
out.println("</center>");
out.println("</body>");

out.println("</html>");
          //JOptionPane.showMessageDialog(null, "RegisterSucessfully");
      }catch(Exception e)
      {
             //JOptionPane.showMessageDialog(null, e);
          out.println(e);
      }
      
      
      
      
      
      
      
      
      
      %>
    </body>
</html>
