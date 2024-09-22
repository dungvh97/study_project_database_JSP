
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*,java.sql.*" session="true" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    
    <title>List Customer Records</title>
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
                <c:set var="number" value="${column+1}"/>
            </c:forEach>
    </c:forEach>
        
    <form action="inputToData.jsp" method="POST">
    <div class="div1">
        <h2> Nhập thông tin khách hàng có id là <c:out value="${number}"/></h2>
        <input type="hidden" name="id_cus" value="<c:out value="${number}"/>" />
        Mã thành viên : 
        <input type="text" name="id_mem" value="" size="11" style="margin-left: 5px"/> <br><br>
        Quận : 
        <select name="district" style="margin-left: 63px">
            <option>Hai Chau</option>
            <option>Thanh Khe</option>
            <option>Cam le</option>
            <option>Son Tra</option>
            <option>Ngu Hanh Son</option>
            <option>Lien Chieu</option>
            
        </select> <br><br>
        <input type="submit" value="Nhập vào"/> <br><br>
    </div>
    </form>
    
    <%@include  file="show_customer.jsp" %>
</body>
</html>