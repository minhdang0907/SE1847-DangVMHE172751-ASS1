<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">     
        <style>
            @media (min-width: 1025px) {
                .h-custom {
                    height: 100vh !important;
                }
            }
        </style>
    </head>
    <body>
        <section class="h-100 h-custom">
            <div class="container h-100 py-5">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <form action="updateCart" method="post">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>                                            
                                            <th scope="col" class="h5">Product Cart</th>
                                            <th scope="col">Màu sắc</th>
                                            <th scope="col">Số lượng</th>
                                            <th scope="col">Giá</th>
                                            <th scope="col">Delete</th>      
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${order.carts}" var="c">
                                            <tr>                                                
                                                <th scope="row">
                                                    <div class="d-flex align-items-center">
                                                        <img src="${c.product.images}" class="img-fluid rounded-3"
                                                             style="width: 120px;" alt="Book">
                                                        <div class="flex-column ms-4">
                                                            <p class="mb-2">${c.product.name}</p>

                                                        </div>
                                                    </div>
                                                </th>
                                                <td class="align-middle">
                                                    <p class="mb-0" style="font-weight: 500;">${c.product.color}</p>
                                                </td>
                                                <td class="align-middle">
                                                    <div class="d-flex flex-row">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="1" name="${c.product.id}" value="${c.quantity}" type="number"
                                                               class="form-control form-control-sm" style="width: 50px;" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                </td>
                                                <td class="align-middle">
                                                    <p class="mb-0" style="font-weight: 500;">${c.product.price}</p>
                                                </td>
                                                <td class="align-middle">
                                                    <p class="mb-0" style="font-weight: 500;"><a href="deleteCart?id=${c.product.id}">&#128465;</a></p>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <tr>
                                            <td>
                                                <input type="submit" value="Update Cart"/>
                                            </td>
                                    <button><a href="home" style="color: black;
                                               text-decoration-line: none;">Tiếp tục mua hàng</a></button> 
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                                <div class="card-body p-4">

                                    <div class="row">
                                        <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                                            <form>
                                                <div class="d-flex flex-row pb-3">
                                                    <div class="d-flex align-items-center pe-2">
                                                        <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1v"
                                                               value="" aria-label="..." checked />
                                                    </div>
                                                    <div class="rounded border w-100 p-3">
                                                        <p class="d-flex align-items-center mb-0">
                                                            <i class="fab fa-cc-mastercard fa-2x text-dark pe-2"></i>Thẻ tín dụng

                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="d-flex flex-row pb-3">
                                                    <div class="d-flex align-items-center pe-2">
                                                        <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel2v"
                                                               value="" aria-label="..." />
                                                    </div>
                                                    <div class="rounded border w-100 p-3">
                                                        <p class="d-flex align-items-center mb-0">
                                                            <i class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Thẻ ngân hàng
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="d-flex flex-row">
                                                    <div class="d-flex align-items-center pe-2">
                                                        <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel3v"
                                                               value="" aria-label="..." />
                                                    </div>
                                                    <div class="rounded border w-100 p-3">
                                                        <p class="d-flex align-items-center mb-0">
                                                            <i class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
                                                        </p>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="col-md-6 col-lg-4 col-xl-6">
                                            <div class="row">
                                                <div class="col-12 col-xl-6">
                                                    <div class="form-outline mb-4 mb-xl-5">
                                                        <input type="text" id="typeName" class="form-control form-control-lg" siez="17"
                                                               placeholder="John Smith" />
                                                        <label class="form-label" for="typeName">Tên thẻ</label>
                                                    </div>

                                                    <div class="form-outline mb-4 mb-xl-5">
                                                        <input type="text" id="typeExp" class="form-control form-control-lg" placeholder="MM/YY"
                                                               size="7" id="exp" minlength="7" maxlength="7" />
                                                        <label class="form-label" for="typeExp">Thời hạn</label>
                                                    </div>
                                                </div>
                                                <div class="col-12 col-xl-6">
                                                    <div class="form-outline mb-4 mb-xl-5">
                                                        <input type="text" id="typeText" class="form-control form-control-lg" siez="17"
                                                               placeholder="1111 2222 3333 4444" minlength="19" maxlength="19" />
                                                        <label class="form-label" for="typeText">Số thẻ</label>
                                                    </div>

                                                    <div class="form-outline mb-4 mb-xl-5">
                                                        <input type="password" id="typeText" class="form-control form-control-lg"
                                                               placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                                        <label class="form-label" for="typeText">Cvv</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                          
                                        <div class="col-lg-4 col-xl-3">
                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                <p class="mb-2">Thành tiền</p>
                                                <p class="mb-2">${sumprice}</p>
                                            </div>

                                            <div class="d-flex justify-content-between" style="font-weight: 500;">
                                                <p class="mb-0">Phí vận chuyển</p>
                                                <p class="mb-0">Freeship</p>
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                                                <p class="mb-2">Tổng</p>
                                                <p class="mb-2">${sumprice}</p>
                                            </div>

                                            <button type="button" class="btn btn-primary btn-block btn-lg">
                                                <div class="d-flex justify-content-between">
                                                    <span><a href="checkout" style="color: white;
                                                             text-decoration: none;">Thanh toán</a></span>
                                                    <span>${sumprice}</span>
                                                </div>
                                            </button>
                                        </div>          
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <script>
                // Function to update the total price when quantity changes
                function updateTotalPrice(inputElement, priceElement) {
                    const quantity = inputElement.value;
                    const pricePerUnit = parseFloat(priceElement.dataset.price);
                    const totalPrice = quantity * pricePerUnit;
                    priceElement.textContent = "$" + totalPrice.toFixed(2);
                }

                // Get all quantity input elements and price elements
                const quantityInputs = document.querySelectorAll('input[name="quantity"]');
                const priceElements = document.querySelectorAll('.product-price');

                // Add event listeners to each quantity input
                quantityInputs.forEach((input, index) => {
                    input.addEventListener('input', () => {
                        updateTotalPrice(input, priceElements[index]);
                    });
                });

                // Calculate and display the initial total prices
                quantityInputs.forEach((input, index) => {
                    updateTotalPrice(input, priceElements[index]);
                });
            </script>
        </section>
    </body>
</html>
