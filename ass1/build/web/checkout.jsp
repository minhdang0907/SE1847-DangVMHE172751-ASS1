<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* styles.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f7f7f7;
}

.container {
    margin-top: 20px;
    background-color: #fff;
    padding: 20px;
}

.checkout-area {
    display: flex;
    justify-content: space-between;
}

.checkout-left {
    width: 70%;
    margin-right: 20px;
}

.panel-group {
    margin-top: 20px;
}

.panel {
    border: 1px solid #ccc;
    margin-bottom: 20px;
}

.panel-title {
    color: #754110;
}

.aa-checkout-single-bill {
    margin-bottom: 10px;
}

input[type="text"],
input[type="email"],
input[type="tel"],
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

input[type="date"] {
    display: none;
}

.aa-checkout-single-bill input[type="text"] {
    display: none;
}

.checkout-right {
    width: 100%;
    background-color: #fff;
    padding: 20px;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
}

.aa-order-summary-area {
    background-color: #f7f7f7;
    padding: 10px;
}

table {
    width: 100%;
}

th, td {
    padding: 10px;
}

.aa-payment-method label {
    display: block;
    margin-bottom: 10px;
}

.aa-payment-method input[type="radio"] {
    margin-right: 10px;
}

.aa-browse-btn {
    background-color: #754110;
    color: #fff;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
}

.aa-browse-btn:hover {
    background-color: #5c3410;
}

p[style="color: red"] {
    color: red;
}

a {
    text-decoration: none;
    color: #754110;
}

        </style>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="checkout-area">
                        <form action="transaction" method="post">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="checkout-left">
                                        <div class="panel-group" >
                                            <c:if test="${sessionScope.Acc.user == null}">
                                                <p> Bạn cần đăng nhập để thanh toán! Đăng nhập <a href="Login.jsp" style="color: #754110">Tại Đây!</a></p>
                                            </c:if>
                                            <c:if test="${sessionScope.Acc.user != null}">
                                                <!-- Shipping Address -->
                                                <div class="panel panel-default aa-checkout-billaddress">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title" style="color:#754110">
                                                            Địa chỉ giao hàng
                                                        </h4>
                                                    </div>
                                                    <div id="collapseFour">
                                                        <div class="panel-body">
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <input type="text" placeholder="Họ Tên*" required="required" name="transaction_name" value="${Acc.name}" >
                                                                    </div>                             
                                                                </div>

                                                            </div> 

                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <input type="email" placeholder="Email*" required="required" name="transaction_email" value="${Acc.email}" >
                                                                    </div>                             
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <input type="tel" placeholder="Số điện thoại*" required="required" name="transaction_phone" value="${Acc.phone}">
                                                                    </div>
                                                                </div>
                                                            </div> 
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <input cols="8" rows="3" required="required" placeholder="Địa chỉ*" name="transaction_address" value="${Acc.address}">
                                                                    </div>                             
                                                                </div>                            
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <textarea cols="8" rows="3" placeholder="Ghi chú" name="transaction_mess"></textarea>
                                                                    </div>                             
                                                                </div>                            
                                                            </div>     

                                                            <div class="row">
                                                                <div class="col-md-12">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <input type="date" placeholder="Password" name="transaction_created" id="the-date" style="display: none">             
                                                                    </div>                             
                                                                </div>                            
                                                            </div>             

                                                            <div class="row" style="display: none">
                                                                <div class="col-md-12">
                                                                    <div class="aa-checkout-single-bill">
                                                                        <input type="text" placeholder="userid_session" name="transaction_usersession" value="${Acc.user}"> 

                                                                        <input type="text" placeholder="totalmoney_session" name="transaction_amount" value="${sumprice}">         
                                                                    </div>                             
                                                                </div>                            
                                                            </div>              
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="checkout-right">
                                        <h4>Thông tin đơn hàng</h4>
                                        <div class="aa-order-summary-area">
                                            <table class="table table-responsive">
                                                <thead>
                                                    <tr>
                                                        <th>Sản phẩm</th>
                                                        <th>Số tiền</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${order.carts}" var="item">
                                                        <tr>
                                                            <td>${item.product.name} <strong> x  ${item.quantity}</strong></td>
                                                            <td>${item.price} USD</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th>Tạm tính</th>
                                                        <td>${sumprice} USD</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Thuế</th>
                                                        <td>0 USD</td>
                                                    </tr>
                                                    <tr>
                                                        <th>Tổng cộng</th>
                                                        <td><strong>${sumprice} USD</strong></td>
                                                    </tr>
                                                </tfoot>
                                            </table>
                                        </div>
                                        <h4>Hình thức thanh toán</h4>
                                        <div class="aa-payment-method">                    
                                            <label for="cashdelivery"><input type="radio" id="cashdelivery" name="transaction_payment" checked value="0"> Thanh toán khi nhận hàng (COD) </label>
                                            <label for="paypal"><input type="radio" id="paypal" name="transaction_payment" value="1" > Thanh toán bằng thể ngân hàng (ATM) </label>
                                                
                                            <input type="submit" value="Đặt hàng" class="aa-browse-btn">
                                        </div>
                                        <c:if test="${sessionScope.Acc.user != null && sessionScope.order == null}">
                                            <br>
                                            <p style="color: red">Bạn đã đặt hàng thành công!</p>
                                            <a href="home">Back To Home</a>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>

<script>
    var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10)
        month = "0" + month;
    if (day < 10)
        day = "0" + day;

    var today = year + "-" + month + "-" + day;


    document.getElementById('the-date').value = today;
</script>
</html>
