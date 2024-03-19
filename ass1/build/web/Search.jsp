<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/search.css">
        
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
                    <img src="https://staysafeonline.org/wp-content/uploads/2023/03/toppng.com-apple-logo-logo-png-transparent-background-.png" alt="Apple Logo">
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
        <form action="search" method="get">
            <div class="search-bar">
                <input name="txt" type="text" placeholder="Tìm kiếm">
                <button type="submit" class="products" style="display: inline;">Search</button>
            </div>
        </form>
        <div class="product-group">
            <h2 class="title"> 
                <a href="iphone">Kết quả tìm kiếm</a>
            </h2>

            <div class="products">
                <c:forEach items="${requestScope.listSearch}" var="s">
                    <div class="product">
                        <img src="${s.images}" alt="Product">
                        <h3><a href="detail?id=${s.id}">${s.name}</a></h3>
                        <p style="font-weight: 700;
                           font-size: 15px;
                           line-height: 24px;
                           color: #0066CC;">Giá: ${s.price}USD</p>
                        <a href="add_cart?proId=${s.id}"> <button class="add-to-cart-button">Thêm vào giỏ hàng</button> </a>
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
