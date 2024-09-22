
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="mycss.css">

    </head>
    <body>
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection=DriverManager.getConnection("jdbc:mysql://localhost/project_milkteamanagement?useUnicode=true&characterEncoding=UTF-8", "root", "");
            String strProcedure="{call show_discounted()}";
            CallableStatement cs = connection.prepareCall(strProcedure);
            cs.execute();
            ResultSet resultset = cs.getResultSet();
        %>
        
        
        
        <TABLE BORDER="1">
            <caption><h2>Thống kê tiền giảm giá của thành viên</h2></caption>
            <TR>
                <TH>ID_member</TH>
                <TH>Discounted</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getInt(1) %></td>
                <TD> <%= resultset.getInt(2) %></TD>
            </TR>
            <% } %>
        </TABLE>
        
        <form action="home.jsp" method="POST">
            <br> <br>
            <input class="submit" type="submit" value="Xác nhận" name="bt_xac_nhan" style="margin-left: 550px"/>
        </form>
        
    </body>
</html>
