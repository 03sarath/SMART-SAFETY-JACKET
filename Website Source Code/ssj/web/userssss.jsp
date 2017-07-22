

<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User1</title>
       <meta http-equiv="refresh" content="5">

</style>
    </head>
    <body>
    <center>
        <%
        
         // Set refresh, autoload time as 5 seconds
         response.setIntHeader("Refresh", 5);
        %>
     
       <%
            //String username=request.getParameter("username");
            //String password=request.getParameter("password");
              try
      {
          Class.forName("com.mysql.jdbc.Driver");
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skp_test", "root" , "123");
             
           Statement stmt = connection.createStatement();
        ResultSet rs =stmt.executeQuery("SELECT * FROM iot_update ");
         
      
        
        
        while(rs.next()){       
        int $temp =Integer.parseInt(rs.getString("TEMPRATURE"));
        
        if($temp>28||
                
                
                
                
                

        {
        
        
        
        %>
        

           
                
                       
             
       
         
                 <% 
                
               
                  // ImageIcon aboutIcon = new ImageIcon("back.jpg");
                    out.print("<a href=sensor1.jsp>");
                    out.print("<img src=1.png  style=width:100px;height:100px;border:0>");
                    out.print("</a>");
                  //out.println("<img src='uploads/" + aboutIcon + "' />");
                  //out.println("<img src='uploads/" + "back.jpg" + "' />");
                   //value....................
                   
                   
               }
                else
               {
               out.print("<a href=sensor1.jsp>");
                    out.print("<img src=1.png  style=width:100px;height:100px;border:0>");
                    out.print("</a>");
               //value....................
               }%>
               
               
               
                 <% 
               int $temp1 =Integer.parseInt(rs.getString("TEMPRATURE")); 
               
               if($temp1>28)
               {
                  // ImageIcon aboutIcon = new ImageIcon("back.jpg");
                    out.print("<a href=sensor2.jsp>");
                    out.print("<img src=1.png  style=width:100px;height:100px;border:0>");
                    out.print("</a>");
                  //out.println("<img src='uploads/" + aboutIcon + "' />");
                  //out.println("<img src='uploads/" + "back.jpg" + "' />");
                   //value....................
                   
                   
               }
                else
               {
               out.print("<a href=sensor1.jsp>");
                    out.print("<img src=1.png  style=width:100px;height:100px;border:0>");
                    out.print("</a>");
               //value....................
               }%>
               
                 
           
      
             
             
                  
            
               <%
                   
                   int $hum =Integer.parseInt(rs.getString("HUMIDITY"));
                    if($hum>50)
               {
                 //value....................
               }
                    else
                    {
                    //value....................
                    }
                   
                   %> 
                   
                   
                    
               
              
               <%
                   
                   int $obst =Integer.parseInt(rs.getString("OBSTACLEcm"));
                    if($obst<120)
               {
                 //value....................
               }
                     else
                    {
                     //value....................
                    }
                   
                   %> 
                   
                   
                 
             
              <%
                   
                   float $ch4 =Float.parseFloat(rs.getString("CH4ppm"));
                    if($ch4>18)
               {
                 //value....................
               }
                     else
                    {
                     //value....................
                    }
                   
                   %> 
                   
                   
                    
      
                
          <%
                   
                   float $co =Float.parseFloat(rs.getString("COppm"));
                    if($co>20)
               {
                 //value....................
               }
                     else
                    {
                   //value....................
                    }
                   
                   %> 
                   
                   
                    
      <%
                   
                   float $motx =(Float.parseFloat(rs.getString("MotionAxisX"))*-1);
                   
                   
                    //if($motx<38)
               //{
                 //out.println("Motion ACross x-axis");
              // }
              
              if ($motx >= 10 && $motx <= 90) {

                //value....................
                        }
              else if($motx >= 11 && $motx <=40 )
                    {
                     //value....................
                    }
              else if($motx >= 1 && $motx <=10 )
                    {
                     //value....................
                    }
              float $cal =Float.parseFloat(rs.getString("MotionAxisX"));
                   if($cal >= 1 && $cal <=30)
                   
                    {
                   
                     
                     //value....................
                    }
                     
                   
                   %> 
                   
                <%
                   
                   float $moty =(Float.parseFloat(rs.getString("MotionAxisY"))*-1);
                    if ($moty >= 400 && $moty <= 462)
               {
                 //value....................
               }
                    else if ($moty >= 465 && $moty <= 475)
                    {
                     //value....................
                    }
                    else if($moty >= 476 && $moty <= 490)
                    {
                 //value....................
                    }
                     else if($moty >= 491&& $moty <= 520)
                    {
                    //value....................
                    }
                   
                   %> 
                   
               <%
                   
                   float $motz =(Float.parseFloat(rs.getString("MotionAxisZ"))*-1);
                    if ($motz >= 40 && $motz <= 50)
               {
                 //value....................
               }
                    else if ($motz >= 51 && $motz <= 100)
                    {
                     //value....................
                    }
                     else if ($motz >= 110 && $motz <= 150)
                    {
                     //value....................
                    }
                     else if ($motz >= 200 && $motz <= 250)
                    {
                     //value....................
                    }
                   
                   %> 
                   
                
               
                   
           
                
              <%
                   
                   float $emg =Float.parseFloat(rs.getString("Emergency"));
                    if($emg==1)
               {
                 //value....................
               }
                     else
                    {
                     //value....................
                    }
                   
                   %> 
                   
                   
                   
               
             
             
  
   
                
      
            
            
  
      
        
 
           
   
        
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
