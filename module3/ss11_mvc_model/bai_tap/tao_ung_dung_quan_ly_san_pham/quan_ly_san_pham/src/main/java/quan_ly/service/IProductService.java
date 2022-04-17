package quan_ly.service;

import quan_ly.model.Product;

import java.util.List;
import java.util.Map;

public interface IProductService {
List<Product> getListProduct();
Map<String, String> create(Product product);
Map<String, String> update(Integer id, Product product);
 Product findById(int id);
}
