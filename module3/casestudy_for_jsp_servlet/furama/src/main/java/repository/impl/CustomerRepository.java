package repository.impl;

import model.Customer;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private static final String SELECT_ALL_CUSTOMER = "select * from khach_hang";

    private static final String INSERT_CUSTOMER = "insert into khach_hang(ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi ) value (?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_CUSTOMER_BY_ID = "select * from khac_hang where ma_khach_hang=?";

    private static final String UPDATE_CUSTOMER = "update khach_hang set ma_loai_khach=?, ho_ten=?, ngay_sinh=?, gioi_tinh=?, so_cmnd=?, so_dien_thoai=?, email=?, dia_chi=? where ma_khach_hang = ?";

    private static final String DELETE_CUSTOMER = "delete from khach_hang where ma_khach_hang = ?";
    BaseRepository baseRepository = new BaseRepository();


    @Override
    public List<Customer> selectAllCustomerType() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_CUSTOMER);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer maKhachHang = resultSet.getInt("ma_khach_hang");
                Integer maLoaiKhach = resultSet.getInt("ma_loai_khach");
                String hoTen = resultSet.getString("ho_ten");
                String ngaySinh = resultSet.getString("ngay_sinh");
                Integer gioiTinh = resultSet.getInt("gioi_tinh");
                String soCMND = resultSet.getString("so_cmnd");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String diaChi = resultSet.getString("dia_chi");
                customerList.add(new Customer(maKhachHang, maLoaiKhach, hoTen, ngaySinh, gioiTinh, soCMND, soDienThoai, email, diaChi));
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
        return customerList;
    }

    @Override
    public void insertCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setInt(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
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
    public Customer selectCustomerById(Integer maKhachHang) {
        Connection connection = baseRepository.getConnection();
        Customer customer = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
            preparedStatement.setInt(1, maKhachHang);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer maLoaiKhach = resultSet.getInt("ma_loai_khach");
                String hoTen = resultSet.getString("ho_ten");
                String ngaySinh = resultSet.getString("ngay_sinh");
                Integer gioiTinh = resultSet.getInt("gioi_tinh");
                String soCMND = resultSet.getString("so_cmnd");
                String soDienThoai = resultSet.getString("so_dien_thoai");
                String email = resultSet.getString("email");
                String diaChi = resultSet.getString("dia_chi");
                customer = new Customer(maKhachHang, maLoaiKhach, hoTen, ngaySinh, gioiTinh, soCMND, soDienThoai, email, diaChi);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return customer;

    }

    @Override
    public void ediCustomer(Customer customer) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(UPDATE_CUSTOMER);
            preparedStatement.setInt(1, customer.getMaLoaiKhach());
            preparedStatement.setString(2, customer.getHoTen());
            preparedStatement.setString(3, customer.getNgaySinh());
            preparedStatement.setInt(4, customer.getGioiTinh());
            preparedStatement.setString(5, customer.getSoCMND());
            preparedStatement.setString(6, customer.getSoDienThoai());
            preparedStatement.setString(7, customer.getEmail());
            preparedStatement.setString(8, customer.getDiaChi());
            preparedStatement.setInt(9,customer.getMaKhachHang());
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
    public void deleteCustomer(Integer maKhachHang) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_CUSTOMER);
            preparedStatement.setInt(1,maKhachHang);
            preparedStatement.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
}

