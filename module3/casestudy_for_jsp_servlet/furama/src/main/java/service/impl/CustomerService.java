package service.impl;

import model.Customer;
import model.CustomerType;
import repository.ICustomerRepository;
import repository.ICustomerTypeRepository;
import repository.impl.CustomerRepository;
import repository.impl.CustomerTypeRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    ICustomerRepository iCustomerRepository = new CustomerRepository();
    ICustomerTypeRepository iCustomerTypeRepository = new CustomerTypeRepository();
    @Override
    public List<Customer> selectAllCustomer() {
        return iCustomerRepository.selectAllCustomerType();
    }

    @Override
    public List<CustomerType> selectAllCustomerType() {
        return iCustomerTypeRepository.selectAllCustomerType();
    }

    @Override
    public void insertCustomer(Customer customer) {
        iCustomerRepository.insertCustomer(customer);
    }

    @Override
    public Customer selectCustomerById(Integer maKhachHang) {
        return iCustomerRepository.selectCustomerById(maKhachHang);
    }

    @Override
    public void ediCustomer(Customer customer) {
        iCustomerRepository.ediCustomer(customer);
    }

    @Override
    public void deleteCustomer(Integer maKhachHang) {
        iCustomerRepository.deleteCustomer(maKhachHang);
    }
}
