package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> selectAll();

    void insert(Employee employee);

    void delete(Integer maNhanVien);
}
