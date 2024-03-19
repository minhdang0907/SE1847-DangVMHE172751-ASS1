
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/manage.css">
    </head>
    <body>
        <h1>Manage Product</h1>
        <a href="home" style="padding-left: 670px;">&#127968;</a>
        <button id="addProductButton"><a href="add">Add Product</a></button>
        <table>
            <thead>
                <tr>
                    <th class="select-all">
                        <input type="checkbox" id="checkAll">
                    </th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Màu sắc</th>
                    <th>Price</th>
                    <th class="action-buttons">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.listP}" var="p">
                    <tr>
                        <td>
                            <input type="checkbox" class="checkbox">
                        </td>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.color}</td>
                        <td>${p.price}</td>
                        <td class="action-buttons">
                            <button><a href="edit?id=${p.id}">Edit</a></button>
                            <button><a href="delete?id=${p.id}">Delete</a></button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <script>
            // Lắng nghe sự kiện khi checkbox "Select All" thay đổi
            document.getElementById("checkAll").addEventListener("change", function () {
                var checkboxes = document.querySelectorAll(".checkbox");

                // Lặp qua tất cả các checkbox dưới và đặt chúng giống với trạng thái của "Select All"
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = this.checked;
                }
            });
            
        </script>
    </body>
</html>
