package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAll();

    void insert(Customer customer);

    Customer selectById(Integer maKhachHang);

    void edit(Customer customer);

    void delete(Integer maKhachHang);

    List<Customer> searchByName(String hoTen);

}
