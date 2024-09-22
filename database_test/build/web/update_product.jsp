
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
        
        
        <div class="div1">
            <form action="changeProduct.jsp" method="POST">
                <h2> Cập nhật sản phẩm </h2>
                ID sản phẩm :
                <input type="text" name="id_pro" value="" size="11" style="margin-left: 47px"/> <br><br>
                Số lượng sản phẩm :
                <input type="text" name="quantity_pro" value="" size="11" style="margin-left: 5px"/> <br><br>

                <input type="submit" value="Cập nhật"/> <br><br>
            </form>
            
            <form action="home.jsp" method="POST">
                <input type="submit" value="Trở về"/> <br><br>
            </form>
        </div>
        
        
        <%@include  file="show_product.jsp" %>
    </body>
</html>
