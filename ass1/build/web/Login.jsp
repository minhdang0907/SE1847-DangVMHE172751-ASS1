<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <div class="container">
            <div class="image-column">
                <img src="https://shopdunk.com/images/uploaded/banner/VNU_M492_08%201.jpeg" alt="Hình ảnh đăng ký">
            </div>
            <div class="login-container">   
                <form class="login-form" action="login" method="post"> 
                     <c:set var="cookie" value="${pageContext.request.cookies}" />
                    <h2>Đăng nhập</h2>
                    <div class="input-container">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" value="${cookie.cuser.value}">
                    </div>
                    <div class="input-container">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" value="${cookie.cpass.value}">
                    </div>                    
                        <input type="checkbox" id="remember-me" name="remember" ${cookie.crem != null ?'checked':''}>
                        <label for="remember-me" style="margin-right: 620px;">Remember Me</label>
                    <p class="text-danger" style="color: red; font-weight: bold;">${mess}</p>
                    <button type="submit">Đăng nhập</button>
                </form>
                <div class="register-link">
                    <p>Chưa có tài khoản? <a href="Register.jsp">Đăng ký ngay</a></p>
                </div>
            </div>
        </div>
    </body>
</html>
