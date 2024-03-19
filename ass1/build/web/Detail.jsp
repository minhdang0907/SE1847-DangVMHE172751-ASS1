
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/detail.css">
    </head>
    <body>
        <header>
            <nav>
                <ul class="menu">
                    <li><a href="home">Home</a></li>
                    <li><a href="cateProduct?id=1">Iphone</a></li>
                    <li><a href="cateProduct?id=2">Ipad</a></li>
                    <li><a href="cateProduct?id=3">MacBook</a></li>
                    <li><a href="cateProduct?id=4">AppleWatch</a></li>
                    <li><a href="cateProduct?id=5">Phụ kiện</a></li>
                </ul>
                <div class="logo">                    
                    <img src="https://upload.wikimedia.org/wikipedia/commons/a/ab/Apple-logo.png" alt="Apple Logo">
                </div>
                <div class="user-actions">
                    <c:if test="${sessionScope.Acc == null}">
                        <a href="Login.jsp">Đăng nhập</a>
                    </c:if>
                    <c:if test="${sessionScope.Acc != null}">
                        <a href="logout">Đăng xuất</a>
                        <a href="#">Hello ${sessionScope.Acc.user}</a>
                    </c:if> 
                    <c:if test="${sessionScope.Acc.isAdmin == 1}">
                        <a href="manage">Manage</a>
                    </c:if>    
                    <c:if test="${sessionScope.Acc.isAdmin == 0}">
                        <a href="Cart.jsp">Giỏ hàng</a>
                    </c:if> 
                </div>
            </nav>
        </header>

        <div class="container">
            <div class="row">              
                <div class="col-md-6">
                    <img src="${detail.images}" alt="Ảnh sản phẩm" class="img-fluid">
                </div>
                <div class="col-md-6" style="margin-top: 110px;">                       
                    <h2>${detail.name}</h2>              
                    <p>Giá: ${detail.price}USD</p>
                    <p>Màu sắc: ${detail.color}</p>
                    <p>Thông số kĩ thuật:</p>
                    <p>${detail.description}</p>
                    
                        <button class="buy-now-button"><a href="add_cart?proId=${detail.id}" style="    color: white;
                                                          text-decoration: none;">MUA NGAY</a></button>
                        
                </div>
            </div>
        </div>

        <div class="container related-products">
            <h3>Các sản phẩm khác</h3>
            <div class="row">
                <c:forEach items="${requestScope.listRelated}" var="r">
                    <div class="col-md-4">
                        <div class="related-product">
                            <img src="${r.images}" alt="images" class="img-fluid">
                            <h4><a style="text-decoration: none;
                                   font-family: sans-serif;
                                   font-weight: 700;
                                   font-size: 18px;
                                   line-height: 27px;
                                   color: #1D1D1F;" href="detail?id=${r.id}">${r.name}</a></h4>
                            <p>Giá: ${r.price}USD</p>
                        </div>                
                    </div>
                </c:forEach>
            </div>
        </div>
        <footer>
            <div class="footer-content">
                <p>&copy; 2023 Apple Store</p>
                <p>Address HaNoi</p>
                <p>PhoneNumber 099998888</p>
            </div>
        </footer>

    </body>


</html>
