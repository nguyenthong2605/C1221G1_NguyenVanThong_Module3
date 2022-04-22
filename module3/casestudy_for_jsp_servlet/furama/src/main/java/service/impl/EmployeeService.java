package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepository;
import service.IEmployeeService;

import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepository iEmployeeRepository = new EmployeeRepository();
    @Override
    public List<Employee> selectAll() {
        return iEmployeeRepository.selectAll();
    }

    @Override
    public void insert(Employee employee) {
        iEmployeeRepository.insert(employee);
    }

    @Override
    public void delete(Integer maNhanVien) {
        iEmployeeRepository.delete(maNhanVien);
    }
}
