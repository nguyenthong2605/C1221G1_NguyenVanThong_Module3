<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/15/2022
  Time: 8:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
          integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
<button class="btn btn-primary" style="color: white"><a href="/product?action=create">Thêm mới</a></button>
<table class="table table-striped">
    <tr class="row">
        <th class="col-1" >STT</th>
        <th class="col-1">Mã sản phẩm</th>
        <th class="col-2">Tên sản phẩm</th>
        <th class="col-2">Giá sản phẩm</th>
        <th class="col-2">Mô tả sản phẩm</th>
        <th class="col-2">Nhà sản xuất</th>
        <th class="col-2">Sửa</th>
    </tr>
    <c:forEach var="product" items="${products}" varStatus="thong">
        <tr class="row">
            <td class="col-1">${thong.count}</td>
            <td class="col-1">${product.id}</td>
            <td class="col-2">${product.name}</td>
            <td class="col-2">${product.price}</td>
            <td class="col-2">
                <c:if test="${product.description == 0 }">
                    Hết
                </c:if>
                <c:if test="${product.description == 1}">
                    Còn
                </c:if>
            </td>
            <td class="col-2">${product.producer}</td>
            <td class="col-2" style="color: black"><a href="/product?action=update&id=${product.id}">Sửa</a></td>

        </tr>
    </c:forEach>
</table>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"></script>
</body>
</html>
