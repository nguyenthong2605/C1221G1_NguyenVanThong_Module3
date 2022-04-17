package quan_ly.service;

import quan_ly.model.Product;
import quan_ly.repository.IProductRepository;
import quan_ly.repository.impl.ProductRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductService implements IProductService {
    private IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> getListProduct() {
        List<Product> productList = iProductRepository.getList();
        return productList;
    }

    @Override
    public Map<String, String> create(Product product) {
        Map<String, String> map = new HashMap<>();
        if (product.getName().equals("")) {
            map.put("name", "Tên không được để trống");
        } else if (!product.getName().matches("^[a-zA-Z ]+$")) {
            map.put("name", "Tên không hợp lệ");
        }
        if (map.isEmpty()) {
            iProductRepository.create(product);
        }
        return map;
    }

    @Override
    public Map<String, String> update(Integer id, Product product) {
        return null;
    }

    @Override
    public  Product findById(int id) {
        return iProductRepository.findById(id);
    }

}
