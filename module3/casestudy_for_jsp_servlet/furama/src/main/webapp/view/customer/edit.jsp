<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/18/2022
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <style>
        input {
            width: 300px;
        }
    </style>
</head>
<body>
<center>
    <h1>KHÁCH HÀNG</h1>

    <h2><a href="/index.jsp">Quay Lại Danh Sách Khách Hàng</a></h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Sửa Khách Hàng
                </h2>
            </caption>
            <c:if test="${customer != null}">
                <input type="hidden" name="maKhachHang" value="<c:out value='${customer.maKhachHang}' />"/>
            </c:if>
            <tr>
                <th>Mã loại khách:</th>
                <td>
                    <select name="maLoaiKhach" id="">
                        <c:forEach var="customerType" items="${customerTypeList}">

                            <option value="${customerType.maLoaiKhach}">${customerType.tenLoaiKhachHang}</option>

                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Họ tên:</th>
                <td>
                    <input type="text" name="hoTen" id="hoTen"/>
                </td>
            </tr>
            <tr>
                <th>Ngày sinh:</th>
                <td>
                    <input type="date" name="ngaySinh" id="ngaySinh"/>
                </td>
            </tr>
            <tr>
                <th>Giới tính:</th>
                <td>
                    <select name="gioiTinh">
                        <option value="1">Nam</option>
                        <option value="0">Nữ</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Số cmnd:</th>
                <td>
                    <input type="text" name="soCMND" id="soCMND"/>
                </td>
            </tr>
            <tr>
                <th>Số điện thoại:</th>
                <td>
                    <input type="text" name="soDienThoai" id="soDienThoai"/>
                </td>
            </tr>
            <tr>
                <th>Email:</th>
                <td>
                    <input type="text" name="email" id="email"/>
                </td>
            </tr>
            <tr>
                <th>Địa chỉ:</th>
                <td>
                    <input type="text" name="diaChi" id="diaChi"/>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
