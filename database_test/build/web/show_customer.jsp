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
     
        <sql:query var="listCustomer"   dataSource="${myDS}">
            SELECT * FROM customer;
        </sql:query>
    
        <div align="center">
            <table border="1" cellpadding="5">
                <caption><h2>List of customer</h2></caption>
                <tr>
                    <th>id_cus</th>
                    <th>id_mem</th>
                    <th>district</th>
                    <th>day(year-month-day)</th>
                    <th>pay</th>
                </tr>
            <c:forEach var="cus" items="${listCustomer.rows}">
                <tr>
                    <td><c:out value="${cus.id_cus}" /></td>
                    <td><c:out value="${cus.id_mem}" /></td>
                    <td><c:out value="${cus.district}" /></td>
                    <td><c:out value="${cus.day}" /></td>
                    <td><c:out value="${cus.pay}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    </body>
</html>
