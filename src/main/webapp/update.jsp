<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Luka
  Date: 4/25/2023
  Time: 3:00 AM
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
<sql:query var="resultSet" dataSource="${db}">
    SELECT * FROM `posts` WHERE id = ?;
    <sql:param value="${id}"/>
</sql:query>

<c:forEach var="post" items="${resultSet.rows}" varStatus="loopStatus">
    <c:if test="${loopStatus.index == 0}">
        <form method="post" action="./updateResult.jsp?id=<%=id%>">
            Title <input type="text" name="Title" value="<c:out value='${post.Title}'/>"/>
            Author <input type="text" name="Author" value="<c:out value='${post.Author}'/>"/>
            Content <input type="text" name="Content" value="<c:out value='${post.Content}'/>"/>
            Date <input type="date" name="Date" value="<c:out value='${post.Date}'/>"/>
            <button type="submit">Submit</button>
        </form>
    </c:if>
</c:forEach>
</body>
</html>
