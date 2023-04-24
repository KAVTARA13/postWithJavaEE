<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Luka
  Date: 4/25/2023
  Time: 2:02 AM
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
    String title = request.getParameter("Title");
    String author = request.getParameter("Author");
    String content = request.getParameter("Content");
    String date = request.getParameter("Date");
%>
<c:set var="title" value="<%=title%>"/>
<c:set var="author" value="<%=author%>"/>
<c:set var="content" value="<%=content%>"/>
<c:set var="date" value="<%=date%>"/>
<sql:update dataSource="${db}" var="table">
    INSERT INTO `posts`(`Title`, `Author`, `Content`, `Date`) VALUES (?,?,?,?)
    <sql:param value="${title}"/>
    <sql:param value="${author}"/>
    <sql:param value="${content}"/>
    <sql:param value="${date}"/>
</sql:update>
<a href="./index.jsp">Home</a>
</body>
</html>
