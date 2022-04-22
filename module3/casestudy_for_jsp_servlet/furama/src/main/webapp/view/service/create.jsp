<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/19/2022
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        input {
            width: 300px;
        }
    </style>
</head>
<body>
<center>
    <h1>DỊCH VỤ</h1>
    <h2><a href="/index.jsp">Quay Lại Danh Sách Khách Hàng</a></h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>Thêm Mói Dịch Vụ</h2>
            </caption>
            <tr>
                <th>Tên dịch vụ:</th>
                <td>
                    <input type="text" name="tenDichVu" id="tenDichVu"/>
                </td>
            </tr>
            <tr>
                <th>Diện tích:</th>
                <td>
                    <input type="text" name="dienTich" id="dienTich"/>
                </td>
            </tr>
            <tr>
                <th>Chi phí thuê:</th>
                <td>
                    <input type="text" name="chiPhiThue" id="chiPhiThue"/>
                </td>
            </tr>
            <tr>
                <th>Số người tối đa:</th>
                <td>
                    <input type="text" name="soNguoiToiDa" id="soNguoiToiDa"/>
                </td>
            </tr>
            <tr>
                <th>Tiêu chuẩn phòng:</th>
                <td>
                    <input type="text" name="tieuChuanPhongf" id="tieuChuanPhong"/>
                </td>
            </tr>
            <tr>
                <th>Mô tả tiện nghi khác:</th>
                <td>
                    <input type="text" name="moTaTienNghiKhac" id="moTaTienNghiKhac"/>
                </td>
            </tr>
            <tr>
                <th>Diện tích hồ bơi:</th>
                <td>
                    <input type="text" name="dienTichHoBoi" id="dienTichHoBoi"/>
                </td>
            </tr>
            <tr>
                <th>Số tầng:</th>
                <td>
                    <input type="text" name="soTang" id="soTang"/>
                </td>
            </tr>
            <tr>
                <th>Mã kiểu thuê:</th>
                <td>
                    <select name="maKieuThue" id="">
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.maKieuThue}">${rentType.tenKieuThue}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Mã loại dịch vụ:</th>
                <td>
                    <select name="maLoaiDichVu" id="">
                        <c:forEach var="serviceType" items="${serviceTypeList}">
                            <option value="${serviceType.maLoaiDichVu}">${serviceType.tenLoaiDichVu}</option>
                        </c:forEach>
                    </select>
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

