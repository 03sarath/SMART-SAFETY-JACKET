<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List Users Records</title>
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
<body id="image" style="background: url(fea1769ede71e5ab072a721497e4089c.jpg) no-repeat; width: 100%; height: 160px; background-size: 155%;">
    <sql:setDataSource
        var="skp_test"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/skp_test"
        user="root" password=""
    />
     
    <sql:query var="index"   dataSource="${skp_test}">
    
      SELECT * FROM iot_update message;
       
    </sql:query>
<center>
    <div><font size ="5"> List Of Users</font></div>
</center>
<center>
    <div align="center">
        <table border="1" cellpadding="5">
      
            <tr cellspacing="0" cellpadding="0" border="0" background="gre.jpg">
                <th>S.No</th>
                <th>UserName</th>
                <th>Place</th>
  
              
             
              
            </tr>
         
            <c:forEach var="iot_update" items="${index.rows}">
                <tr cellspacing="0" cellpadding="0" border="0" background="org.jpg">
                    
                    <td  width="50"><center><c:out value="${iot_update.Num}" /></center></td>
                    <td width="50"><c:out value="${iot_update.Username}" /></td>
                    <td width="50"><c:out value="${iot_update.PLACE}" /></td>
                   
                 
                </tr>
            </c:forEach>
               
        </table>
    </div>
</center>
</body>
</html>