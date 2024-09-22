
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
        
        
        <jsp:useBean id="memInfo" class="model.Member"></jsp:useBean> 
        <jsp:setProperty property="*" name="memInfo"/> 
        <sql:update var="update1" dataSource="${myDS}">
            INSERT INTO member (id_mem, name_mem, save_mark)
            VALUES (<jsp:getProperty property="id_mem" name="memInfo"/>,
                '<jsp:getProperty property="name_mem" name="memInfo"/>',
                0)
        </sql:update>
        
        <%@include  file="update_member.jsp" %>
    </body>
</html>
