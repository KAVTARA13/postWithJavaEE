<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Luka
  Date: 4/25/2023
  Time: 2:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/spring" user="root" password=""/>
<%
  String id = request.getParameter("id");
%>
<c:set var="id" value="<%=id%>"/>
<sql:update dataSource="${db}" var="table">
  DELETE FROM `posts` WHERE ID = ?;
  <sql:param value="${id}"/>
</sql:update>
<a href="./index.jsp">Main</a>
</body>
</html>
