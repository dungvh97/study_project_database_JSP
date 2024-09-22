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
     
        <sql:query var="listCusPro"   dataSource="${myDS}">
            SELECT * FROM product;
        </sql:query>
    
        <div align="center">
            <table border="1" cellpadding="5">
                <caption><h2>List of products</h2></caption>
                <tr>
                    <th>id_pro</th>
                    <th>name_pro</th>
                    <th>quantity_pro</th>
                </tr>
            <c:forEach var="product" items="${listCusPro.rows}">
                <tr>
                    <td><c:out value="${product.id_pro}" /></td>
                    <td><c:out value="${product.name_pro}" /></td>
                    <td><c:out value="${product.quantity_pro}" /></td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    </body>
</html>
