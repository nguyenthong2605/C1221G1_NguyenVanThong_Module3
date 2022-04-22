package repository.impl;

import model.CustomerType;
import model.ServiceType;
import repository.IServiceTypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ServiceTypeRepository implements IServiceTypeRepository {
    private static final String SELECT_ALL_SERVICE_TYPE = "select * from loai_dich_vu";

    BaseRepository baseRepository = new BaseRepository();

    @Override
    public List<ServiceType> selectAllServiceType() {
        List<ServiceType> serviceTypeList = new ArrayList<>();
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = connection.prepareStatement(SELECT_ALL_SERVICE_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Integer maLoaiDichVu = resultSet.getInt("ma_loai_dich_vu");
                String tenLoaiDichVu = resultSet.getString("ten_loai_dich_vu");
                serviceTypeList.add(new ServiceType(maLoaiDichVu, tenLoaiDichVu));
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
        return serviceTypeList;
    }
}
