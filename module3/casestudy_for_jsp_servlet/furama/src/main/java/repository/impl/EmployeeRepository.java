package repository.impl;

import model.Customer;
import model.Employee;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private static final String SELECT_ALL_EMPLOYEE = "select * from nhan_vien";
    private static final String INSERT_EMPLOYEE =  "insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan) value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String DELETE_EMPLOYEE = "delete from nhan_vien where ma_nhan_vien = ?";
    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Employee> selectAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer maNhanVien = resultSet.getInt("ma_nhan_vien");
                String hoTen = resultSet.getString("ho_ten");
                String ngaySinh = resultSet.getString("ngay_sinh");
                String soCMND = resultSet.getString("so_cmnd");
                Double luong = resultSet.getDouble("luong");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String diaChi = resultSet.getString("dia_chi");
                Integer maViTri = resultSet.getInt("ma_vi_tri");
                Integer maTrinhDo = resultSet.getInt("ma_trinh_do");
                Integer maBoPhan = resultSet.getInt("ma_bo_phan");
                employeeList.add(new Employee(maNhanVien,hoTen,ngaySinh,soCMND,luong,soDienThoai,email,diaChi,maViTri,maTrinhDo,maBoPhan));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return employeeList;
    }

    @Override
    public void insert(Employee employee) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
            preparedStatement.setString(1, employee.getHoTen());
            preparedStatement.setString(2, employee.getNgaySinh());
            preparedStatement.setString(3, employee.getSoCMND());
            preparedStatement.setDouble(4, employee.getLuong());
            preparedStatement.setString(5, employee.getSoDienThoai());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getDiaChi());
            preparedStatement.setInt(8, employee.getMaViTri());
            preparedStatement.setInt(9, employee.getMaTrinhDo());
            preparedStatement.setInt(10, employee.getMaBoPhan());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public Customer selectById(Integer maKhachHang) {
        return null;
    }

    @Override
    public void edit(Employee employee) {

    }

    @Override
    public void delete(Integer maNhanVien) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_EMPLOYEE);
            preparedStatement.setInt(1, maNhanVien);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    @Override
    public List<Employee> searchByName(String hoTen) {
        return null;
    }
}
