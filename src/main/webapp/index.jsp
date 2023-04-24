<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/spring" user="root" password=""/>
    <sql:query var="resultSet" dataSource="${db}">
        SELECT * FROM `posts`;
    </sql:query>
    <form action="./add.jsp" method="post">
        <label>
            Title:
            <input name="Title" type="text"/>
        </label>
        <br>
        <label>
            Author:
            <input name="Author" type="text"/>
        </label>
        <br>
        <label>
            Content:
            <textarea name="Content" type="text"></textarea>
        </label>
        <br>
        <label>
            Date:
            <input name="Date" type="date"/>
        </label>
        <br>
        <button type="submit" >Add</button>
    </form>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Date</th>
        <th>Author</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${resultSet.rows}">
    <tr>
        <th><c:out value="${post.ID}"/></th>
        <th><c:out value="${post.Title}"/></th>
        <th><c:out value="${post.Content}"/></th>
        <th><c:out value="${post.Date}"/></th>
        <th><c:out value="${post.Author}"/></th>
        <th><a type="button" href="./delete.jsp?id=${post.ID}">delete</a> </th>
        <th><a type="button" href="./update.jsp?id=${post.ID}">edit</a> </th>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>