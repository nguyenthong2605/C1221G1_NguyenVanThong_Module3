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
    @Override
    public List<Customer> selectAll() {
        return iCustomerRepository.selectAll();
    }

    @Override
    public void insert(Customer customer) {
        iCustomerRepository.insert(customer);
    }

    @Override
    public Customer selectById(Integer maKhachHang) {
        return iCustomerRepository.selectById(maKhachHang);
    }

    @Override
    public void edit(Customer customer) {
        iCustomerRepository.edit(customer);
    }

    @Override
    public void delete(Integer maKhachHang) {
        iCustomerRepository.delete(maKhachHang);
    }

    @Override
    public List<Customer> searchByName(String hoTen) {
        return iCustomerRepository.searchByName(hoTen);
    }
}
