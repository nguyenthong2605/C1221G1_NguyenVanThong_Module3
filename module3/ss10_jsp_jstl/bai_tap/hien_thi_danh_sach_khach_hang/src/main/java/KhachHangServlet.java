import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "KhachHangServlet", urlPatterns = "/khachhang")
public class KhachHangServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
        List<KhachHang> khachHangList = new ArrayList<KhachHang>();
        khachHangList.add( new KhachHang("Mai Văn Hoàn", "1983-08-03", "Hà Nội", "uq1.jpg"));
        khachHangList.add( new KhachHang("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "resources\\uq1.jpg"));
        khachHangList.add( new KhachHang("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "resources\\uq1.jpg"));
        khachHangList.add( new KhachHang("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "resources\\uq1.jpg"));
        khachHangList.add( new KhachHang("Nguyễn Đình Thi", "1983-08-19", "Hà Nội", "resources\\uq1.jpg"));
        request.setAttribute("danh_sach_khach_hang", khachHangList );
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }
}
