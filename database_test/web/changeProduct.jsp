
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<%--<%@page import="java.sql.*"%>--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <sql:setDataSource
            var="myDS"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/project_milkteamanagement"
            user="root" password=""
        />
        
        
        <jsp:useBean id="proInfo" class="model.Product"></jsp:useBean> 
        <jsp:setProperty property="*" name="proInfo"/> 
        <sql:update var="updatePro" dataSource="${myDS}">
            UPDATE product
                SET quantity_pro = <jsp:getProperty property="quantity_pro" name="proInfo"/>
                WHERE id_pro = <jsp:getProperty property="id_pro" name="proInfo"/>
        </sql:update>
        
        <%@include  file="update_product.jsp" %>
    </body>
</html>
