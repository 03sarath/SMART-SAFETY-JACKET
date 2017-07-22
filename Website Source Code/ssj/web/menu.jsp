

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
              <style>
div {
    background-color: lightgrey;
    width: 350px;
    border: 17px solid green;
    padding: 17px;
    margin: 17px;
}
</style>
    </head>
    <body>
        <center>
              <%
        
         // Set refresh, autoload time as 5 seconds
         response.setIntHeader("Refresh", 5);
        %>
            <div><font size="5" color="blue"> Select Required Option<font></div>

         
            

       <%
            //String username=request.getParameter("username");
            //String password=request.getParameter("password");
              try
      {
          Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/vibration_test", "root" , "");
             
           Statement stmt = connection.createStatement();
        ResultSet rs =stmt.executeQuery("select *from updatevib");
        
        
        while(rs.next()){%>
      <p>Status of Earthquake</p>
        <table align="center" border="1" cellpadding="5">
         
          <tr  cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
              <td> <img src="earthquake.png" width="100dp" height="100dp"></td>   
              <td width="100"><center><%=rs.getString("value")%></center></td>
                <td><% 
               int $val =Integer.parseInt(rs.getString("value")); 
               if($val>28)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <% 
                 
               }
               else
               {
                   out.println ("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                           }
                %>
           </td>
            </tr>
          
                                 
        </table>
           
           <p>Status of RFID</p>
           
           <table align="center" border="1" cellpadding="5">
               
                 <tr  cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
              <td> <img src="id.jpg" width="100dp" height="100dp"></td>   
              <td width="100"><center><%=rs.getString("RFID")%></center></td>
                <td><% 
               int $rfid =Integer.parseInt(rs.getString("RFID")); 
               if($rfid==1)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 
                 %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <% 
               }
               else
               {
                   out.println ("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                           }
                %>
           </td>
            </tr>
               
               
               
           </table>
               
                   
            <a href="manageuser.html" target="_blank"><img src="name.png" style="width:190px;height:190px;border:0">
          
           
           </a>
            <p>Manage users</p>
      

          
             
          
  
           
    </center>
        
        
        <%}
           
          //JOptionPane.showMessageDialog(null, "RegisterSucessfully");
      }catch(Exception e)
     {
             //JOptionPane.showMessageDialog(null, e);
         out.println(e);
      }
            %>
            
    </body>
</html>
