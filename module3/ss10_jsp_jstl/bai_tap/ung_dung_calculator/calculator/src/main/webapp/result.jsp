<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/13/2022
  Time: 4:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:choose>
    <c:when test="${!message.equals('')}">
        <h3>${message}</h3>
    </c:when>
    <c:otherwise>
        <h1>Result:</h1>
        <h3>${ket_qua}</h3>
    </c:otherwise>
</c:choose>











</body>
</html>
