
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="model.*,java.sql.*" session="true" errorPage="error.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    
    <title>Quản lý quán trà sữa</title>
    <link rel="stylesheet" type="text/css" href="mycss.css">
</head>
<body>
    
    <div class="div1">
        <h2> Mời bạn chọn tác vụ</h2>
        <form action="update_customer.jsp" method="POST">
            Thêm khách hàng : 
            <input class="submit" type="submit" value="Thêm khách hàng" name="add_customer" style="margin-left: 38px"/> <br><br>
        </form>    
        <form action="update_member.jsp" method="POST">
            Thêm thành viên : 
            <input class="submit" type="submit" value="Thêm thành viên" name="add_member" style="margin-left: 45px"/> <br><br>
        </form>
        <form action="update_product.jsp" method="POST">
            Cập nhật sản phẩm : 
            <input class="submit" type="submit" value="Cập nhật sản phẩm" name="add_member" style="margin-left: 31px"/> <br><br>
        </form>
        <form action="show_save_off.jsp" method="POST">
            Thống kê tiền giảm giá: 
            <input class="submit" type="submit" value="Thống kê" name="statistic" style="margin-left: 10px"/> <br><br>
        </form>
        
    </div>
        
</body>
</html>