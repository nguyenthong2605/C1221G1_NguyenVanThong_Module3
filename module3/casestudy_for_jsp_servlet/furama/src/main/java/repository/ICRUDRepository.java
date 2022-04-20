package repository;

import model.Customer;

import java.util.List;

public interface ICRUDRepository<E> {
    List<E> selectAllCustomerType();

    void insertCustomer(E e);

    Customer selectCustomerById(Integer maKhachHang);

    void ediCustomer(E e);

    void deleteCustomer(Integer maKhachHang);
}
