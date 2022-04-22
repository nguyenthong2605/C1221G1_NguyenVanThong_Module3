package controller;

import model.CustomerType;
import model.RentType;
import model.Service;
import model.ServiceType;
import service.IRentTypeService;
import service.IServiceService;
import service.IServiceTypeService;
import service.impl.RentTypeService;
import service.impl.ServiceService;
import service.impl.ServiceTypeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServiceServlet", urlPatterns = "/service")
public class ServiceServlet extends HttpServlet {
    IServiceService iServiceService = new ServiceService();

    IServiceTypeService iServiceTypeService = new ServiceTypeService();

    IRentTypeService iRentTypeService = new RentTypeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertService(request, response);
                break;
        }
    }

    private void insertService(HttpServletRequest request, HttpServletResponse response) {
        Integer maDichVu = null;
        String tenDichVu = request.getParameter("tenDichVu");
        Integer dienTich = Integer.parseInt(request.getParameter("dienTich"));
        Double chiPhiThue = Double.parseDouble(request.getParameter("chiPhiThue"));
        Integer soNguoiToiDa = Integer.parseInt(request.getParameter("soNguoiToiDa"));
        String tieuChuanPhong = request.getParameter("tieuChuanPhong");
        String moTaTienNghiKhac = request.getParameter("moTaTienNghiKhac");
        Double dienTichHoBoi = Double.parseDouble(request.getParameter("dienTichHoBoi"));
        Integer soTang = Integer.parseInt(request.getParameter("soTang"));
        Integer maKieuThue = Integer.parseInt(request.getParameter("maKieuThue"));
        Integer maLoaiDichVu = Integer.parseInt(request.getParameter("maLoaiDichVu"));
        Service service = new Service(maDichVu, tenDichVu, dienTich, chiPhiThue, soNguoiToiDa, tieuChuanPhong, moTaTienNghiKhac, dienTichHoBoi, soTang, maKieuThue, maLoaiDichVu);
        iServiceService.insertService(service);
        try {
            response.sendRedirect("/service");
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
                showCreateService(request, response);
                break;
            default:
                showListService(request, response);
        }
    }

    private void showCreateService(HttpServletRequest request, HttpServletResponse response) {
        List<RentType> rentTypeList = iRentTypeService.selectAllRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        List<ServiceType> serviceTypeList = iServiceTypeService.selectAllServiceType();
        request.setAttribute("serviceTypeList", serviceTypeList);
        try {
            request.getRequestDispatcher("view/service/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListService(HttpServletRequest request, HttpServletResponse response) {
        List<Service> serviceList = iServiceService.selectAllService();
        request.setAttribute("serviceList", serviceList);
        List<RentType> rentTypeList = iRentTypeService.selectAllRentType();
        request.setAttribute("rentTypeList", rentTypeList);
        List<ServiceType> serviceTypeList = iServiceTypeService.selectAllServiceType();
        request.setAttribute("serviceTypeList", serviceTypeList);
        try {
            request.getRequestDispatcher("view/service/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
