package controller;

import model.*;
import service.IDivisionService;
import service.IEducationDegreeService;
import service.IEmployeeService;
import service.IPositionService;
import service.impl.DivisionService;
import service.impl.EducationDegreeService;
import service.impl.EmployeeService;
import service.impl.PositionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService iEmployeeService = new EmployeeService();
    IPositionService iPositionService = new PositionService();
    IEducationDegreeService iEducationDegreeService = new EducationDegreeService();
    IDivisionService iDivisionService = new DivisionService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                insertEmployee(request, response);
                break;
            case "edit":
//                editEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
        }

    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer maNhanVien = Integer.parseInt(request.getParameter("maNhanVien"));
        iEmployeeService.delete(maNhanVien);
        try {
            response.sendRedirect("/employee");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer maNhanVien = null;
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String soCMND = request.getParameter("soCMND");
        Double luong = Double.parseDouble(request.getParameter("luong"));
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String diaChi = request.getParameter("diaChi");
        Integer maViTri = Integer.parseInt(request.getParameter("maViTri"));
        Integer maTrinhDo = Integer.parseInt(request.getParameter("maTrinhDo"));
        Integer maBoPhan = Integer.parseInt(request.getParameter("maBoPhan"));
        Employee employee = new Employee(maNhanVien, hoTen, ngaySinh, soCMND, luong, soDienThoai, email, diaChi,maViTri,maTrinhDo,maBoPhan);
        iEmployeeService.insert(employee);
        try {
            response.sendRedirect("/employee");
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
                showCreateEmployee(request, response);
                break;
            case "edit":
//                showEditEmployee(request, response);
                break;
            case "delete":
                break;
            case "search":
//                searchByName(request, response);
                break;
            default:
                showListEmployee(request, response);
        }
    }

    private void showCreateEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Position> positionList = iPositionService.selectAllPosition();
        System.out.println(positionList);
        request.setAttribute("positionList", positionList);
        List<EducationDegree> educationDegreeList = iEducationDegreeService.selectAllEducationDegree();
        request.setAttribute("educationDegreeList", educationDegreeList);
        List<Division> divisionList = iDivisionService.selectAllDivision();
        request.setAttribute("divisionList",divisionList);
        try {
            request.getRequestDispatcher("view/employee/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = iEmployeeService.selectAll();
        request.setAttribute("employeeList", employeeList);
        List<Position> positionList = iPositionService.selectAllPosition();
        request.setAttribute("positionList", positionList);
        List<EducationDegree> educationDegreeList = iEducationDegreeService.selectAllEducationDegree();
        request.setAttribute("educationDegreeList", educationDegreeList);
        List<Division> divisionList = iDivisionService.selectAllDivision();
        request.setAttribute("divisionList",divisionList);
        try {
            request.getRequestDispatcher("view/employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
