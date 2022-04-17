<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/15/2022
  Time: 4:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Quay lại danh sách sản phẩm</a>
</p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="name" id="name" value="${product.name}"></td>
            </tr>
            <tr>
                <td>Giá: </td>
                <td><input type="text" name="description" id="description" value="${product.price}"></td>
            </tr>
            <tr>
                <td>Mô tả sản phẩm </td>
                <td>
                    <select name="description" >
                        <option value="0">Hết</option>
                        <option value="1">Còn</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Nhà sản xuất: </td>
                <td><input type="text" name="producer" id="producer" value="${product.producer}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>

</body>
</html>
