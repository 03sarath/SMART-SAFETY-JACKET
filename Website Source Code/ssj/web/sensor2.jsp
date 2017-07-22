

<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User2</title>
       <meta http-equiv="refresh" content="5">
        <style>
div {
    background-color: lightgrey;
    width: 300px;
    border: 17px solid green;
    padding: 17px;
    margin: 17px;
}
</style>
    </head>
    <body  id="image" style="background: url(back.jpg) no-repeat; width: 100%; height: 160px; background-size: 155%;" >
    <center>
        <%
        
         // Set refresh, autoload time as 5 seconds
         response.setIntHeader("Refresh", 5);
        %>
        <div>USER-2 VINITH SENSOR DATA</div>
       <%
            //String username=request.getParameter("username");
            //String password=request.getParameter("password");
              try
      {
          Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skp_test", "root" , "");
             
           Statement stmt = connection.createStatement();
        ResultSet rs =stmt.executeQuery("select *from iot_update where Num=2");
        
        
        while(rs.next()){%>
        
        <table align="left" cellpadding="1" cellspacing="1" border="1">

            <tr  cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                
                       
          <td> <img src="493afc65911a4263fe62505dbc2c0c16.gif" width="100dp" height="100dp"></td>      
         <td><b><font  face="Tahoma"  color="black">TEMPERATURE(°C)</font></b></td>
         <td  width="100"><center><%=rs.getString("TEMPRATURE")%></center></td>
                <td> <% 
               int $temp =Integer.parseInt(rs.getString("TEMPRATURE")); 
               
               if($temp>30)
               {
                  // ImageIcon aboutIcon = new ImageIcon("back.jpg");
                   
                  //out.println("<img src='uploads/" + aboutIcon + "' />");
                  //out.println("<img src='uploads/" + "back.jpg" + "' />");
                   out.print("<img src='photo.jpg' alt='image' width=100 height =100 />");
                   
                            %>
                   <audio autoplay="true" src="Alert.mp3">
                  </audio>
               <% 
               }
                else
               {
               
               out.print("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
               }%>
               </td>
                 
            </tr>
      
             
               
            <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                <td> <img src="wsymbol_a0025_light_rain_showers_night.gif" width="100dp" height="100dp"></td>
                <td><b><font  face="Tahoma"  color="black">HUMIDITY(%)</font></b></td>
                  
                 <td><center><%=rs.getString("HUMIDITY")%></center></td>
               <td><%
                   
                   int $hum =Integer.parseInt(rs.getString("HUMIDITY"));
                    if($hum<30)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 
                 
                 
                          %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <% 
               }
                    else
                    {
                     out.println("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
                    
               
              
                 <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                     <td> <img src="obst.jpg" width="100dp" height="100dp"></td>
                 <td><b><font  face="Tahoma"  color="black">OBSTACLE(cm)</font></b></td>
                
               <td><center><%=rs.getString("OBSTACLEcm")%></center></td>
               <td><%
                   
                   int $obst =Integer.parseInt(rs.getString("OBSTACLEcm"));
                    if($obst<10)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 
                 
                          %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <% 
               }
                     else
                    {
                     out.println("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
            
                 
             
                    <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                        <td> <img src="ch4.png" width="100dp" height="100dp"></td>
                   <td><b><font  face="Tahoma"  color="black">Methane(ppm)</font></b></td>
                
               <td><center><%=rs.getString("CH4ppm")%></center></td>
               <td><%
                   
                   float $ch4 =Float.parseFloat(rs.getString("CH4ppm"));
                    if($ch4>16)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 
                          %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <% 
               }
                     else
                    {
                     out.println("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
                    
      
                 
                  <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                      <td> <img src="co.gif" width="100dp" height="100dp"></td>
                 <td><b><font  face="Tahoma"  color="black">CO(ppm)</font></b></td>
                 
               <td><center><%=rs.getString("COppm")%></center></td>
               <td><%
                   
                   float $co =Float.parseFloat(rs.getString("COppm"));
                    if($co>2)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 
                 
                 
                          %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <% 
               }
                     else
                    {
                     out.println("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
                    
        </table>
                   <table align="middle" cellpadding="1" cellspacing="1" border="1"> 
           
                <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                    <td> <img src="ezgif.com-add-text.gif" width="100dp" height="100dp"></td>
                    <td><b><font  face="Tahoma"  color="black">Motion(x-Axis)</font></b></td>
               <td  width="100"><center><%=rs.getString("MotionAxisX")%></center></td>
               <td><%
                   
                   float $motx =(Float.parseFloat(rs.getString("MotionAxisX"))*-1);
                   
                   
                    //if($motx<38)
               //{
                 //out.println("Motion ACross x-axis");
              // }
              
              if ($motx >= 90 || $motx <=10) {

                    out.println("<img src='x1.png' alt='image' width=100 height =100 />");
                        }
              else if($motx >= 11 || $motx <=40 )
                    {
                     out.println("<img src='x4.png' alt='image' width=100 height =100 />");
                    }
              else if($motx >= 1 || $motx <=10 )
                    {
                     out.println("<img src='x6.png' alt='image' width=100 height =100 />");
                    }
              
                     
                   
                   %> </td>
                   
                    </tr>
                  <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                      <td> <img src="ezgif.com-add-text.gif" width="100dp" height="100dp"></td>
                      <td><b><font  face="Tahoma"  color="black">Motion(y-Axis)</font></b></td>
               <td><center><%=rs.getString("MotionAxisY")%></center></td>
               <td><%
                   
                   float $moty =(Float.parseFloat(rs.getString("MotionAxisY"))*-1);
                    if ($moty >= 400 || $moty <= 462)
               {
                 out.println("<img src='y1.png' alt='image' width=100 height =100 />");
               }
                    else if ($moty >= 465 || $moty <= 475)
                    {
                     out.println("<img src='y4.png' alt='image' width=100 height =100 />");
                    }
                    else if($moty >= 476 || $moty <= 490)
                    {
                    out.println("<img src='y6.png' alt='image' width=100 height =100 />");
                    }
                     else if($moty >= 491 || $moty <= 520)
                    {
                    out.println("<img src='y9.png' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
                        <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                            <td> <img src="ezgif.com-add-text.gif" width="100dp" height="100dp"></td>
                            <td><b><font  face="Tahoma"  color="black">Motion(z-Axis)</font></b></td>
               <td><center><%=rs.getString("MotionAxisZ")%></center></td>
               <td><%
                   
                   float $motz =(Float.parseFloat(rs.getString("MotionAxisZ"))*-1);
                    if ($motz >= 40 || $motz <= 50)
               {
                 out.println("<img src='z1.png' alt='image' width=100 height =100 />");
               }
                    else if ($motz >= 51 || $motz <= 100)
                    {
                     out.println("<img src='z10.png' alt='image' width=100 height =100 />");
                    }
                     else if ($motz >= 110 || $motz <= 150)
                    {
                     out.println("<img src='z4.png' alt='image' width=100 height =100 />");
                    }
                     else if ($motz >= 200 || $motz <= 250)
                    {
                     out.println("<img src='z6.png' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
               
                   
           
                 <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                      <td> <img src="Emergency_Light.gif" width="100dp" height="100dp"></td>
                 <td><b>Emergency(logic)</b></td>
               <td><center><%=rs.getString("Emergency")%></center></td>
               <td><%
                   
                   float $emg =Float.parseFloat(rs.getString("Emergency"));
                    if($emg==1)
               {
                 out.println("<img src='photo.jpg' alt='image' width=100 height =100 />");
                 
                          %>
                   <audio autoplay="true" src="Alert.mp3">
                   </audio>
               <%  
               }
                     else
                    {
                     out.println("<img src='coollogo_com-11278285.gif' alt='image' width=100 height =100 />");
                    }
                   
                   %> </td>
                   
                    </tr>
                   
               
             
             
  
   
                
      
            
            
            
        </table>
      
        
 
           
   
        
        <%}
           
          //JOptionPane.showMessageDialog(null, "RegisterSucessfully");
      }catch(Exception e)
     {
             //JOptionPane.showMessageDialog(null, e);
         out.println(e);
      }
            %>
            
    </center>
    
    </body>
</html>
