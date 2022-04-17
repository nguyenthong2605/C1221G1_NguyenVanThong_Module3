<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/15/2022
  Time: 9:41 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/product">Quay lại danh sách sản phẩm</a>
<form method="post">
    <label>Tên sản phẩm</label>
    <input type="text" name="name"><br>
    <label>Giá tiền</label>
    <input type="text" name="price"><br>
    <label>Mô tả sản phẩm</label>
    <select name="description" >
        <option value="0">Hết</option>
        <option value="1">Còn</option>
    </select><br>
    <label>Nhà sản xuất</label>
    <input type="text" name="producer"><br>
    <button type="submit">Thêm mới</button>
</form>

</body>
</html>
