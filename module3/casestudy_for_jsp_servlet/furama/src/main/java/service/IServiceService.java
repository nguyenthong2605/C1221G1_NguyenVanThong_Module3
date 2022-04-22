package service;

import model.Service;

import java.util.List;

public interface IServiceService {
    List<Service> selectAllService();

    void insertService(Service service);
}
