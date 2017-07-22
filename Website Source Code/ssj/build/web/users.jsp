


<%@page import="javafx.scene.media.Media"%>
<%@page import="javax.sound.sampled.Clip"%>
<%@page import="javax.sound.sampled.AudioSystem"%>
<%@page import="javax.sound.sampled.AudioInputStream"%>
<%@page import="java.io.File"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.sql.*"%>
<html>
    <head>
        <title>Users</title>
    </head>
<body>
    
<center>
    <marquee scrollamount="15"><p><font size="10" color="green">W</font><font size="10">elcome to <font size="10" color="greem">U</font>sers <font size="10" color="green">M</font>onitoring <font size="10" color="green">W</font>indow</p></marquee>
    <p><font size="10" color="green">Please select the User</font></p>
    <br>
    <br>
    <br>
    <br>
  
    
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
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/skp_test", "root" , "");
             
           Statement stmt = connection.createStatement();
        ResultSet rs =stmt.executeQuery("SELECT * FROM iot_update ");
         
      
        
        
        rs.next();     
        int $temp =Integer.parseInt(rs.getString("TEMPRATURE"));
         int $hum =Integer.parseInt(rs.getString("HUMIDITY"));
          int $obst =Integer.parseInt(rs.getString("OBSTACLEcm"));
          float $ch4 =Float.parseFloat(rs.getString("CH4ppm"));
          float $co =Float.parseFloat(rs.getString("COppm"));
          float $emg =Float.parseFloat(rs.getString("Emergency"));
          
        
          if($temp>30||$hum<30||$obst<10||$ch4>16||$co>2||$emg==1)
          {
          %>
                
           <a href="sensor1.jsp">
  <img src="userdan1_1.png"  style="width:100px;height:100px;border:0">
 
</a>  
        
                      <audio autoplay="true" src="Alert.mp3">
                      </audio>
      
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
      <%    }
else
{

%>
<a href="sensor1.jsp">
  <img src="1.png"  style="width:100px;height:100px;border:0">
 
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<%}
  //***************************************************pqrstuvwxyz*****
        rs.next();    
           int $tempp =Integer.parseInt(rs.getString("TEMPRATURE"));
         int $hump =Integer.parseInt(rs.getString("HUMIDITY"));
          int $obstp =Integer.parseInt(rs.getString("OBSTACLEcm"));
          float $ch4p =Float.parseFloat(rs.getString("CH4ppm"));
          float $cop =Float.parseFloat(rs.getString("COppm"));
          float $emgp =Float.parseFloat(rs.getString("Emergency"));


          
          //********************************************************
if($tempp>30||$hump<30||$obstp<10||$ch4p>16||$cop>2||$emgp==1)
{
%>

<a href="sensor2.jsp">
  <img src="userdan2_1.png"  style="width:100px;height:100px;border:0">
 
</a>


                      <audio autoplay="true" src="Alert.mp3">
                      </audio>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;


<%}
else
{

%>
<a href="sensor2.jsp">
  <img src="2.png"  style="width:100px;height:100px;border:0">
 
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<%}


 //***************************************************pqrstuvwxyz*****
        rs.next();    
           int $tempq =Integer.parseInt(rs.getString("TEMPRATURE"));
         int $humq =Integer.parseInt(rs.getString("HUMIDITY"));
          int $obstq =Integer.parseInt(rs.getString("OBSTACLEcm"));
          float $ch4q =Float.parseFloat(rs.getString("CH4ppm"));
          float $coq =Float.parseFloat(rs.getString("COppm"));
          float $emgq =Float.parseFloat(rs.getString("Emergency"));


          
          //********************************************************
if($tempq>30||$humq<30||$obstq<10||$ch4q>16||$coq>2||$emgq==1)
{
%>

<a href="sensor3.jsp">
  <img src="userdan3_1.png"  style="width:100px;height:100px;border:0">
  
     
       
               
 
</a>



                      <audio autoplay="true" src="Alert.mp3">
                      </audio>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<%}
else
{

%>
<a href="sensor3.jsp">
  <img src="3.png"  style="width:100px;height:100px;border:0">
 
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<%}


//***************************************************pqrstuvwxyz*****
        rs.next();    
           int $tempr =Integer.parseInt(rs.getString("TEMPRATURE"));
         int $humr =Integer.parseInt(rs.getString("HUMIDITY"));
          int $obstr =Integer.parseInt(rs.getString("OBSTACLEcm"));
          float $ch4r =Float.parseFloat(rs.getString("CH4ppm"));
          float $cor =Float.parseFloat(rs.getString("COppm"));
          float $emgr =Float.parseFloat(rs.getString("Emergency"));


          
          //********************************************************
if($tempr>30||$humr<30||$obstr<10||$ch4r>16||$cor>2||$emgr==1)
{
%>

<a href="sensor4.jsp">
  <img src="userdan4_1.png"  style="width:100px;height:100px;border:0">
 
</a>


                      <audio autoplay="true" src="Alert.mp3">
                      </audio>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<%}
else
{

%>
<a href="sensor4.jsp">
  <img src="4.png"  style="width:100px;height:100px;border:0">
 
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<%}

//***************************************************pqrstuvwxyz*****
        rs.next();    
           int $temps =Integer.parseInt(rs.getString("TEMPRATURE"));
         int $hums =Integer.parseInt(rs.getString("HUMIDITY"));
          int $obsts =Integer.parseInt(rs.getString("OBSTACLEcm"));
          float $ch4s =Float.parseFloat(rs.getString("CH4ppm"));
          float $cos =Float.parseFloat(rs.getString("COppm"));
          float $emgs =Float.parseFloat(rs.getString("Emergency"));


          
          //********************************************************
if($temps>30||$hums<30||$obsts<10||$ch4s>16||$cos>2||$emgs==1)
{
%>

<a href="sensor5.jsp">
  <img src="userdan5_1.png"  style="width:100px;height:100px;border:0">
 
</a>


                      <audio autoplay="true" src="Alert.mp3">
                      </audio>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<%}
else
{

%>
<a href="sensor5.jsp">
  <img src="5.png"  style="width:100px;height:100px;border:0">
 
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<%}


}
catch(Exception e)
     {
             //JOptionPane.showMessageDialog(null, e);
         out.println(e);
      }
            %>
  

&nbsp;
&nbsp;

<a href="14828148147879.asp">
  <img src="6.png"  style="width:100px;height:100px;border:0">
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<a href="14828148147879.asp">
  <img src="7.png"  style="width:100px;height:100px;border:0">
</a>

&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;
<a href="14828148147879.asp">
  <img src="8.png"  style="width:100px;height:100px;border:0">
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;



<a href="14828148147879.asp">
  <img src="9.png"  style="width:100px;height:100px;border:0">
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<br>
<br>
<br>
<br>
<br>



<a href="14828148147879.asp">
  <img src="10.png"  style="width:100px;height:100px;border:0">
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<a href="14828148147879.asp">
  <img src="11.png"  style="width:100px;height:100px;border:0">
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<a href="14828148147879.asp">
  <img src="12.png"  style="width:100px;height:100px;border:0">
</a>
&nbsp;
&nbsp;
&nbsp;
&nbsp;
&nbsp;

<a href="14828148147879.asp">
  <img src="13.png"  style="width:100px;height:100px;border:0">
</a>

</center>

</body>
</html>