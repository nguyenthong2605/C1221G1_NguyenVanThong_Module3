package repository;

import model.Customer;

import java.util.List;

public interface ICRUDRepository<E> {
    List<E> selectAll();

    void insert(E e);

    Customer selectById(Integer maKhachHang);

    void edit(E e);

    void delete(Integer maKhachHang);

    List<E> searchByName(String hoTen);
}
