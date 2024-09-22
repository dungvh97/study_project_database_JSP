
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*,java.sql.*" session="true" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update member</title>
    </head>
    <body>
        
        <sql:setDataSource
            var="myDS"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/project_milkteamanagement"
            user="root" password=""
        />
     
        <sql:query var="result" dataSource="${myDS}">
            SELECT MAX(id_mem) FROM member
        </sql:query>

        <c:forEach var="row" items="${result.rowsByIndex}">
                <c:forEach var="column" items="${row}">
                    <c:set var="number" value="${column+1}"/>
                </c:forEach>
        </c:forEach>
            
        
        <div class="div1">
            <form action="inputToMember.jsp" method="POST">
                <h2> Thêm thành viên có id là <c:out value="${number}"/></h2>
                <input type="hidden" name="id_mem" value="<c:out value="${number}"/>" />
                Tên thành viên :
                <input type="text" name="name_mem" value="" size="11" style="margin-left: 5px"/> <br><br>


                <input type="submit" value="Thêm"/> <br><br>
            </form>
                
            <form action="home.jsp" method="POST">
                <input type="submit" value="Trở về"/> <br><br>
            </form>
        </div>
        
        <%@include  file="show_member.jsp" %>
    </body>
</html>
