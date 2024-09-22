
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
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
        
        <jsp:useBean id="cusInfo" class="model.Cus_pro"></jsp:useBean> 
        <jsp:setProperty property="*" name="cusInfo"/> 
        <sql:update var="update1" dataSource="${myDS}">
            INSERT INTO cus_pro (id_cus, id_pro, quantity_detail)
            VALUES (<jsp:getProperty property="id_cus" name="cusInfo"/>,
                    <jsp:getProperty property="id_pro" name="cusInfo"/>,
                    <jsp:getProperty property="quantity_detail" name="cusInfo" />);
        </sql:update>
        
        <%@include  file="cus_pro.jsp" %>
    </body>
</html>
