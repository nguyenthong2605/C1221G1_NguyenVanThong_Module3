<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/12/2022
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/calculator" method="post">
    nProduct Descriptio: <input type="text" name="mo_ta">
    List Price: <input type="number" name="gia">
    Discount Percent: <input type="number" name="chiet_khau">
    <br>
    <button type="submit">Calculate Discount</button>
</form>
</body>
</html>
