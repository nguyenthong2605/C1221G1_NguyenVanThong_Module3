package controller;

import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.impl.CustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "FuramaServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService iCustomerService = new CustomerService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                insertCustomer(request,response);
                break;
            case "edit":
                editCustomer(request,response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer maKhachHang = Integer.parseInt(request.getParameter("maKhachHang"));
        iCustomerService.deleteCustomer(maKhachHang);
        response.sendRedirect("/customer");
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer maKhachHang = Integer.parseInt(request.getParameter("maKhachHang"));
        Integer maLoaiKhach = Integer.parseInt(request.getParameter("maLoaiKhach"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        Integer gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
        String soCMND = request.getParameter("soCMND");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Customer customer = new Customer(maKhachHang, maLoaiKhach, hoTen, ngaySinh, gioiTinh, soCMND, soDienThoai, email, diaChi);
        iCustomerService.ediCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertCustomer(HttpServletRequest request, HttpServletResponse response) {
        Integer maKhachHang = null;
        Integer maLoaiKhach = Integer.parseInt(request.getParameter("maLoaiKhach"));
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        Integer gioiTinh = Integer.parseInt(request.getParameter("gioiTinh"));
        String soCMND = request.getParameter("soCMND");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Customer customer = new Customer(maKhachHang, maLoaiKhach, hoTen, ngaySinh, gioiTinh, soCMND, soDienThoai, email, diaChi);
        iCustomerService.insertCustomer(customer);
        try {
            response.sendRedirect("/customer");
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateCustomer(request, response);
                break;
            case "edit":
                showEditCustomer(request,response);
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                showListCustomer(request, response);
        }
    }

    private void showEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        Integer maKhachHang = Integer.valueOf(request.getParameter("maKhachHang"));
        Customer customer = iCustomerService.selectCustomerById(maKhachHang);
        request.setAttribute("customer", customer);
        try {
            request.getRequestDispatcher("view/customer/edit.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerService.selectAllCustomerType();
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = iCustomerService.selectAllCustomerType();
        List<Customer> customerList = iCustomerService.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            request.getRequestDispatcher("view/customer/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

