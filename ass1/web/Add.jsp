<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                background-color: #B0E0E6;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }


            #addProductForm {
                background-color: #fff; /* Màu nền trắng cho form */
                padding: 20px;
                border-radius: 10px;
                width: 50%;
                text-align: center;
            }

            #formHeader {
                text-align: center;
                font-weight: bold;
            }

            .form-input {
                margin: 10px 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .form-input label {
                flex: 1;
                text-align: right;
            }

            .form-input select,
            .form-input input {
                flex: 2;
                padding: 5px;
            }
            #addButton{
                background-color: #1E90FF;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                margin-bottom: 8px
            }
            #cancelButton {
                background-color: #1E90FF;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }
            #addButton:hover,
            #cancelButton:hover {
                background-color: #0066CC;
            }

            .form-input:last-child {
                text-align: center; /* Căn phải */
            }
        </style>
    </head>
    <body>
       
        <div id="addProductForm">
            <form action="add" method="post">
            <h2 id="formHeader">Add Product</h2>      
            <div class="form-input">
                <label for="productName">Name:</label>
                <input type="text" id="productName" name="name">
            </div>          
                <div class="form-input">               
                    <label>Category name:</label>  
                    <select name="category">
                        <c:forEach items="${requestScope.listC}" var="c">   
                            <option value="${c.cateId}">${c.cateName}</option>
                        </c:forEach> 
                    </select>
                </div>
            <div class="form-input">
                <label for="productPrice">Price:</label>
                <input type="text" id="productPrice" name="price">
            </div>
            <div class="form-input">
                <label for="productColor">Color:</label>
                <input type="text" id="productColor" name="color">
            </div>
            <div class="form-input">
                <label for="productImages">Images:</label>
                <input type="text" id="productImages" name="images">
            </div>
            <div class="form-input">
                <label for="productDescription">Description:</label>
                <input type="text" id="productDescription" name="description">
            </div>           
            <button id="addButton" type="submit" value="add" >Add</button>
           
            
             </form>
            <button id="cancelButton">Cancel</button>
            <script>
                const cancelButton = document.getElementById('cancelButton');
                cancelButton.addEventListener('click', () => {
                    // Quay lại trang "Manage Product"
                    window.location.href = 'manage';
                });
            </script>
        </div>    
    </body>
</html>
