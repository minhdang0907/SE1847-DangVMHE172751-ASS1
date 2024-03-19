<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css">
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
                        <a href="acc?uID=${sessionScope.Acc.uID}">Hello ${sessionScope.Acc.user}</a>
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
                <button type="submit" class="products" style="display: inline;" >Search</button>
            </div>
        </form>

        <!-- Thân trang web -->
        <div class="product-groups">
            <div class="product-group">
                <h2 class="title"> 
                    <a href="">Iphone</a>
                </h2>

                <div class="products">
                    <c:forEach items="${requestScope.listPhone}" var="o">
                        <div class="product">
                            <img src="${o.images}" alt="Product">         
                            <h3><a href="detail?id=${o.id}">${o.name}</a></h3>                            
                            <p style="font-weight: 700;
                               font-size: 15px;
                               line-height: 24px;
                               color: #0066CC;">Giá: ${o.price}USD</p>
                            <a href="add_cart?proId=${o.id}">  <button class="add-to-cart-button">Thêm vào giỏ hàng</button> </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="product-group">
                <h2 class="title">
                    <a href="">Ipad</a>
                </h2>
                <div class="products">
                    <c:forEach items="${requestScope.listPad}" var="a">
                        <div class="product">
                            <img src="${a.images}" alt="Product">
                            <h3><a href="detail?id=${a.id}">${a.name}</a></h3>
                            <p style="font-weight: 700;
                               font-size: 15px;
                               line-height: 24px;
                               color: #0066CC;">Giá: ${a.price}USD</p>
                            <a href="add_cart?proId=${a.id}"> <button class="add-to-cart-button">Thêm vào giỏ hàng</button> </a>             
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="product-group">
                <h2 class="title">
                    <a href="">MacBook</a>
                </h2>
                <div class="products">
                    <c:forEach items="${requestScope.listMac}" var="m">
                        <div class="product">
                            <img src="${m.images}" alt="Product">
                            <h3><a href="detail?id=${m.id}">${m.name}</a></h3>
                            <p style="font-weight: 700;
                               font-size: 15px;
                               line-height: 24px;
                               color: #0066CC;">Giá: ${m.price}USD</p>
                            <a href="add_cart?proId=${m.id}"> <button class="add-to-cart-button">Thêm vào giỏ hàng</button> </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="product-group">
                <h2 class="title">
                    <a href="">AppleWatch</a>
                </h2>
                <div class="products">
                    <c:forEach items="${requestScope.listWatch}" var="w">
                        <div class="product">
                            <img src="${w.images}" alt="Product">
                            <h3><a href="detail?id=${w.id}">${w.name}</a></h3>
                            <p style="font-weight: 700;
                               font-size: 15px;
                               line-height: 24px;
                               color: #0066CC;">Giá: ${w.price}USD</p>
                            <a href="add_cart?proId=${w.id}"> <button class="add-to-cart-button">Thêm vào giỏ hàng</button> </a>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="product-group">
                <h2 class="title">
                    <a href="">Phụ kiện</a>
                </h2>

                <div class="products">
                    <c:forEach items="${requestScope.listPk}" var="pk">
                        <div class="product">
                            <img src="${pk.images}" alt="Product">
                            <h3><a href="detail?id=${pk.id}">${pk.name}</a></h3>
                            <p style="font-weight: 700;
                               font-size: 15px;
                               line-height: 24px;
                               color: #0066CC;">Giá: ${pk.price}USD</p>
                            <a href="add_cart?proId=${pk.id}"> <button class="add-to-cart-button">Thêm vào giỏ hàng</button> </a>
                        </div>
                    </c:forEach>
                </div>
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
