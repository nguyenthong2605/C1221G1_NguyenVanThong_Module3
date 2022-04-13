import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/calculator")
public class CalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        double firstOperand= 0;
        double secondOperand = 0;
        double result = 0;
        try {
            firstOperand = Double.parseDouble(request.getParameter("so_hang_dau"));
            secondOperand = Double.parseDouble(request.getParameter("so_hang_sau"));
        }catch (NumberFormatException exception){
            message ="Bạn không được để trống ";
        }
        String operator = request.getParameter("phep_tinh");
        switch (operator) {
            case "+":
                result = firstOperand + secondOperand;
                break;
            case "-":
                result = firstOperand - secondOperand;
                break;
            case "*":
                result = firstOperand * secondOperand;
                break;
            case "/":
                if (secondOperand != 0) {
                    result = firstOperand / secondOperand;
                } else {
                    message = "Không thể chia 1 số cho 0";
                }
                break;
        }
        request.setAttribute("message", message);
        request.setAttribute("ket_qua", result);
        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

}
