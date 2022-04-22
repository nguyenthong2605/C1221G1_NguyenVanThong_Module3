package service.impl;

import model.RentType;
import repository.IRentTypeRepository;
import repository.impl.RentTypeRepository;
import service.IRentTypeService;

import java.util.List;

public class RentTypeService implements IRentTypeService {
    IRentTypeRepository iRentTypeRepository = new RentTypeRepository();
    @Override
    public List<RentType> selectAllRentType() {
        return iRentTypeRepository.selectAllRentType();
    }
}
