<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    String id = request.getParameter("id");
%>
<c:set var="title" value="<%=title%>"/>
<c:set var="author" value="<%=author%>"/>
<c:set var="content" value="<%=content%>"/>
<c:set var="date" value="<%=date%>"/>
<c:set var="id" value="<%=id%>"/>
<sql:update dataSource="${db}" var="table">
    UPDATE `posts` SET `Title` = ?,
    `Author` = ?,
    `Content` = ?,
    `Date` = ?
    WHERE ID = ?
    <sql:param value="${title}"/>
    <sql:param value="${author}"/>
    <sql:param value="${content}"/>
    <sql:param value="${date}"/>
    <sql:param value="${id}"/>
</sql:update>
<a href="./index.jsp">Main</a>
</body>
</html>
