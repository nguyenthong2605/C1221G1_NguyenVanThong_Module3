package repository.impl;

import model.CustomerType;
import model.Service;
import repository.IServiceRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository implements IServiceRepository {
    private static final String SELECT_ALL_SERVICE = "select * from dich_vu";
    private static final String INSERT_SERVICE = "insert into dich_vu(ma_dich_vu,ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)";

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<Service> selectAllService() {
        List<Service> serviceList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer maDichVu = resultSet.getInt("ma_dich_vu");
                String tenDichVu = resultSet.getString("ten_dich_vu");
                Integer dienTich = resultSet.getInt("dien_tich");
                Double chiPhiThue = resultSet.getDouble("chi_phi_thue");
                Integer soNguoiToiDa = resultSet.getInt("so_nguoi_toi_da");
                String tieuChuanPhong = resultSet.getString("tieu_chuan_phong");
                String moTaTienNghiKhac = resultSet.getString("mo_ta_tien_nghi_khac");
                Double dienTichHoBoi = resultSet.getDouble("dien_tich_ho_boi");
                Integer soTang = resultSet.getInt("so_tang");
                Integer maKieuThue = resultSet.getInt("ma_kieu_thue");
                Integer maLoaiDichVu = resultSet.getInt("ma_loai_dich_vu");
                serviceList.add(new Service(maDichVu, tenDichVu, dienTich, chiPhiThue, soNguoiToiDa, tieuChuanPhong, moTaTienNghiKhac, dienTichHoBoi, soTang, maKieuThue, maLoaiDichVu));
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
        return serviceList;
    }

    @Override
    public void insertService(Service service) {
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(INSERT_SERVICE);
            preparedStatement.setInt(1, service.getMaDichVu());
            preparedStatement.setString(2, service.getTenDichVu());
            preparedStatement.setInt(3, service.getDienTich());
            preparedStatement.setDouble(4, service.getChiPhiThue());
            preparedStatement.setInt(5, service.getSoNguoiToiDa());
            preparedStatement.setString(6, service.getTieuChuanPhong());
            preparedStatement.setString(7, service.getMoTaTienNghiKhac());
            preparedStatement.setDouble(8, service.getDienTichHoBoi());
            preparedStatement.setInt(9, service.getSoTang());
            preparedStatement.setInt(10, service.getMaKieuThue());
            preparedStatement.setInt(11, service.getMaLoaiDichVu());
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
}
