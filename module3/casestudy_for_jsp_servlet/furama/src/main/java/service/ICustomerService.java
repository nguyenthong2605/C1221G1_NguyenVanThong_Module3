package service;

import model.Customer;
import model.CustomerType;

import java.util.List;

public interface ICustomerService {
    List<Customer> selectAllCustomer();
    List<CustomerType> selectAllCustomerType();

    void insertCustomer(Customer customer);

    Customer selectCustomerById(Integer maKhachHang);

    void ediCustomer(Customer customer);

    void deleteCustomer(Integer maKhachHang);
}
