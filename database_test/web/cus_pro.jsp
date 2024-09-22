
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*,java.sql.*" session="true" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <title>JSP List Users Records</title>
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
    
    
    <div class="div1">
        <form action="inputCusPro.jsp" method="POST">
            <h2> Nhập sản phẩm muốn mua của khách hàng có id là <c:out value="${number}"/></h2>
            <input type="hidden" name="id_cus" value="<c:out value="${number}"/>" />
            ID sản phẩm: <input type="text" name="id_pro" value="" size="11" /> <br> <br>
            Số lượng : <input type="text" name="quantity_detail" value="" size="11" style="margin-left: 19px"/> <br><br>
            <input type="submit" value="Thêm"/> <br><br>
        </form>
        
        <form action="calculate_pay.jsp" method="POST">
            <input type="hidden" name="id_cus" value="<c:out value="${number}"/>" />
            <input type="submit" value="Tính tiền"/>
        </form>
        
    </div>    
    
        <%@include file="show_product.jsp" %> 
    
</body>
</html>