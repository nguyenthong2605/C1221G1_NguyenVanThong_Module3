package quan_ly.controller;

import quan_ly.model.Product;
import quan_ly.service.IProductService;
import quan_ly.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product", "/"})
public class ProductController extends HttpServlet {
    private IProductService iProductService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "update": {
                updateProduct(request, response);
            }
        }

    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        Integer description = Integer.parseInt(request.getParameter("description"));
        String producer = request.getParameter("producer");
        Integer id = Integer.parseInt(request.getParameter("id"));
        Product product = this.iProductService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error_404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            product.setProducer(producer);
            this.iProductService.update(id, product);
            request.setAttribute("product", product);
            request.setAttribute("message", "Thông tin khách hàng đã được cập nhật");
            dispatcher = request.getRequestDispatcher("update.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        Integer description = Integer.parseInt(request.getParameter("description"));
        String producer = request.getParameter("producer");
        if (description == -1) {
            description = null;
        }
        Integer id = (int) (Math.random() * 1000);
        Product product = new Product(id, name, price, description, producer);
        Map<String, String> map = iProductService.create(product);
        if (map.isEmpty()) {
            response.sendRedirect("/product");
        } else {
            request.setAttribute("error", map);
            request.getRequestDispatcher("create.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println(action);
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("create.jsp").forward(request, response);
                break;
            }
            case "update": {
                request.getRequestDispatcher("update.jsp").forward(request, response);
            }
            default: {
                List<Product> productList = iProductService.getListProduct();
                request.setAttribute("products", productList);
                request.getRequestDispatcher("list.jsp").forward(request, response);
            }
        }
    }
}
