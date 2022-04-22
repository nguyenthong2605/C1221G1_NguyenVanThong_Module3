<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/19/2022
  Time: 9:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="col-1" style="float: left; background: #cddfef; height: 100%; position: fixed"></div>
<div class="col-1" style="float: right; background: #cddfef; height: 100%; position: fixed; right: 0"></div>
<div class="container">
    <nav class="navbar navbar-light bg-light">
        <div>
            <a class="navbar-brand" href="#">
                <img src="https://phuongviethcm.com/wp-content/uploads/2019/07/FURAMA.png" width="80" height="80"
                     class="d-inline-block align-top" alt="">
                <span class="furama">FURAMA</span>
            </a>
        </div>
        <div>
            <p class="">Nguyễn Văn Thông</p>
        </div>
    </nav>

    <nav class="navbar navbar-expand-lg navbar-light bg-light mx-auto" style="width: 80% ">
        <a class="navbar-brand" href="/index.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/employee">Employee <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/customer">Customer <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/service">Service <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="#">Contract <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" method="get">
                <input type="hidden" name="action" value="search">
                <input class="form-control mr-sm-2" type="text" placeholder="Tìm kiếm" aria-label="Search"
                       name="search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
            </form>
        </div>
    </nav>
    <center>
        <h1>Khách Hàng</h1>
        <h2>
            <a href="/customer?action=create">Thêm Mới Khách Hàng</a>
        </h2>
        <h2><a href="/index.jsp">Quay lại trang chủ</a></h2>
    </center>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Mã khách hàng</th>
            <th scope="col">Mã loại khách</th>
            <th scope="col">Họ tên</th>
            <th scope="col">Ngày sinh</th>
            <th scope="col">giới tính</th>
            <th scope="col">Số cmnd</th>
            <th scope="col">Số điện thoại</th>
            <th scope="col">Email</th>
            <th scope="col">Địa chỉ</th>
            <th scope="col">Thao tác</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
        <tr>
            <td><c:out value="${customer.maKhachHang}"/></td>

            <c:forEach var="customerType" items="${customerTypeList}">
                <c:if test="${customer.maLoaiKhach == customerType.maLoaiKhach}">
                    <td><c:out value="${customerType.tenLoaiKhachHang}"></c:out></td>
                </c:if>
            </c:forEach>

            <td><c:out value="${customer.hoTen}"/></td>
            <td><c:out value="${customer.ngaySinh}"/></td>

            <td>
                <c:if test="${customer.gioiTinh==1}">
                    <c:out value="Nam"></c:out>
                </c:if>
                <c:if test="${customer.gioiTinh==0}">
                    <c:out value="Nữ"></c:out>
                </c:if>
            </td>
            <td><c:out value="${customer.soCMND}"/></td>
            <td><c:out value="${customer.soDienThoai}"/></td>
            <td><c:out value="${customer.email}"/></td>
            <td><c:out value="${customer.diaChi}"/></td>
            <td>
                <a href="/customer?action=edit&maKhachHang=${customer.maKhachHang}">Sửa</a>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong"
                        onclick="deleteModal(${(customer.maKhachHang)}, '${customer.hoTen}')">
                    Xóa
                </button>
            </td>
        </tr>

        </c:forEach>
    </table>

    <!-- Modal -->
    <form method="post">
        <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="maKhachHang" id="maKhachHangCanXoa">
                        Bạn có chắc muốn xóa khách hàng có thông tin: <br>
                        Mã khách hàng: <p id="maKhachHang"></p>
                        Tên khách hàng: <p id="hoTen"></p>
                        <p style="color: red">Lưu ý: Xóa rồi không thể hoàn tác!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Xóa</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        function deleteModal(maKhachHang, hoTen) {
            document.getElementById("maKhachHang").innerText = maKhachHang;
            document.getElementById("maKhachHangCanXoa").value = maKhachHang;
            document.getElementById("hoTen").innerText = hoTen;
        }
    </script>
</body>
</html>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>