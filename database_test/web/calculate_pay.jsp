
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@page import="java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id_cus = request.getParameter("id_cus");
            Integer id_cus1 = Integer.valueOf(id_cus);
        
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/project_milkteamanagement?useUnicode=true&characterEncoding=UTF-8", "root", "");
            String strProcedure="{call calculate_pay(?)}";
            CallableStatement cs = con.prepareCall(strProcedure);
            cs.setInt(1, id_cus1); 
            cs.execute();
            ResultSet resultset = cs.getResultSet();
            request.setAttribute("show_table", resultset);
        %>
        
        
        
        <TABLE BORDER="1">
            <caption><h2>Bảng tính tiền từng loại</h2></caption>
            <TR>
                <TH>Pay_pro</TH>
                <TH>Pay_ship</TH>
                <TH>Pay_sale_off</TH>
                <TH>Pay_total</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getInt(1) %></td>
                <TD> <%= resultset.getInt(2) %></TD>
                <TD> <%= resultset.getInt(3) %></TD>
                <TD> <%= resultset.getInt(4) %></TD>
            </TR>
            <% } %>
        </TABLE>
        
        <%@include file="show_pay_customer.jsp" %>
        
    </body>
</html>
