package quan_ly.repository.impl;

import quan_ly.model.Product;
import quan_ly.repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static{
        productList.add(new Product(1, "Bánh", 10.0, 1, "Việt Nam"));
        productList.add(new Product(2, "Kẹo", 20.0, 0, "Trung Quốc"));
        productList.add(new Product(3, "Áo", 15.5, 1, "Mỹ"));
        productList.add(new Product(4, "Quần", 14.5, 0, "Triều Tiên"));
        productList.add(new Product(5, "Giày", 20.5, 0, "Lào"));
        productList.add(new Product(6, "Mũ", 10.5, 1, "Việt Nam"));

    }
    @Override
    public List getList() {
        return productList;
    }



    @Override
    public void create(Product  product ) {
        productList.add(product);
    }

    @Override
    public void updaate(Product product) {
        productList.add(product);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }


}
