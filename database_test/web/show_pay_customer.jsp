<%@page import="java.sql.ResultSet"%>
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
        
        <sql:query var="result" dataSource="${myDS}">
            SELECT MAX(id_cus) FROM customer
        </sql:query>
    
        <c:forEach var="row" items="${result.rowsByIndex}">
            <c:forEach var="column" items="${row}">
                <c:set var="number" value="${column}"/>
            </c:forEach>
        </c:forEach>
     
        <sql:query var="listCus"   dataSource="${myDS}">
            SELECT * FROM customer WHERE id_cus = "<c:out value="${number}"/>";
        </sql:query>
    
        <div align="center">
            <table border="1" cellpadding="5">
                <caption><h2>Bảng khách hàng</h2></caption>
                <tr>
                    <th>id_cus</th>
                    <th>id_mem</th>
                    <th>district</th>
                    <th>day</th>
                    <th>pay</th>
                </tr>
            <c:forEach var="customer" items="${listCus.rows}">
                <tr>
                    <td><c:out value="${customer.id_cus}" /></td>
                    <td><c:out value="${customer.id_mem}" /></td>
                    <td><c:out value="${customer.district}" /></td>
                    <td><c:out value="${customer.day}" /></td>
                    <td><c:out value="${customer.pay}" /></td>
                </tr>
            </c:forEach>
            </table>
        </div>
            
        <sql:query var="listCusPro"   dataSource="${myDS}">
            SELECT * FROM cus_pro WHERE id_cus = "<c:out value="${number}"/>";
        </sql:query>
            
        <div>
            <table border="1" cellpadding="5">
                <caption><h2>Bảng chi tiết sản phẩm</h2></caption>
                <tr>
                    <th>id_cus</th>
                    <th>id_pro</th>
                    <th>quantity_detail</th>
                </tr>
            <c:forEach var="cus_pro" items="${listCusPro.rows}">
                <tr>
                    <td><c:out value="${cus_pro.id_cus}" /></td>
                    <td><c:out value="${cus_pro.id_pro}" /></td>
                    <td><c:out value="${cus_pro.quantity_detail}" /></td>
                </tr>
            </c:forEach>
            </table>
        </div>
        
            
        <form action="home.jsp" method="POST">
            <br> <br>
            <input class="submit" type="submit" value="Xác nhận" name="bt_xac_nhan" style="margin-left: 550px"/>
        </form>
            
       
            
    </body>
</html>
