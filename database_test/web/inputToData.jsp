<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>

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
        
        <% 
            Date dNow = new Date(); 
            SimpleDateFormat ft = 
            new SimpleDateFormat ("yyyy-MM-dd");
            String s = ft.format(dNow);
        %>
        
        <jsp:useBean id="cusInfo" class="model.Customer"></jsp:useBean> 
        <jsp:setProperty property="*" name="cusInfo"/> 
        <sql:update var="update1" dataSource="${myDS}">
            INSERT INTO customer (id_cus, id_mem, district, day, pay)
            VALUES (<jsp:getProperty property="id_cus" name="cusInfo"/>,
                <jsp:getProperty property="id_mem" name="cusInfo"/>,
                '<jsp:getProperty property="district" name="cusInfo" />', 
                '<%= s %>', 
                0)
        </sql:update>
        
        <%@include  file="cus_pro.jsp" %>
    </body>
</html>
