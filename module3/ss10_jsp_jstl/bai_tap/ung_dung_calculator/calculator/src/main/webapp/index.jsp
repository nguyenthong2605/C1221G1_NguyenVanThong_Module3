<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 4/13/2022
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form action="/calculator" method="get">
    <fieldset style="width: 30%">
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand</td>
                <td>
                    <input type="text" name="so_hang_dau">
                </td>
            </tr>
            <tr>
                <td>Operator</td>
                <td>
                    <select name="phep_tinh">
                        <option>+</option>
                        <option>-</option>
                        <option>*</option>
                        <option>/</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand</td>
                <td>
                    <input type="text" name="so_hang_sau">
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <button type="submit">Calculate</button>
                </td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
