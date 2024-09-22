<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*,java.sql.*" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mycss.css">
    </head>
    <body>
        
        <sql:setDataSource
            var="myDS"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/project_milkteamanagement"
            user="root" password=""
        />
     
        <sql:query var="listShip"   dataSource="${myDS}">
            SELECT * FROM ship;
        </sql:query>
    
        <div align="center">
            <table border="1" cellpadding="5">
                <caption><h2>List of ships</h2></caption>
                <tr>
                    <th>id_ship</th>
                    <th>district</th>
                    <th>price_ship</th>
                </tr>
            <c:forEach var="ship" items="${listShip.rows}">
                <tr>
                    <td><c:out value="${ship.id_ship}" /></td>
                    <td><c:out value="${ship.district}" /></td>
                    <td><c:out value="${ship.price_ship}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    </body>
</html>
