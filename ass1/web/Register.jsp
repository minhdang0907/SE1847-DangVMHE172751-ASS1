<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/register.css">
    </head>
    <body>
        <div class="container">
            <div class="image-column">
                <img src="https://shopdunk.com/images/uploaded/banner/VNU_M492_08%201.jpeg" alt="Hình ảnh đăng ký">
            </div>
            <div class="register-container">
                <form action="register" method="post" class="register-form">
                    <h2>Đăng ký</h2> 
                    <div class="input-container">
                        <label for="username">Tên đăng nhập</label>
                        <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập">
                    </div>
                    <div class="input-container">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu">
                    </div>
                    <div class="input-container">
                        <label for="repassword">Nhập lại mật khẩu</label>
                        <input type="password" id="password" name="repassword" placeholder="Nhập mật khẩu">
                    </div>

                    <div class="input-container">
                        <label for="user">Email</label>
                        <input type="email" id="email" name="email" value="${acc.email}">
                    </div>
                    <div class="input-container">
                        <label for="user">Name</label>
                        <input type="text" id="name" name="name" value="${acc.name}">
                    </div>
                    <div class="input-container">
                        <label for="user">Phone</label>
                        <input type="text" id="phone" name="phone" value="${acc.phone}"><!-- comment -->
                    </div>
                    <div class="input-container">
                        <label for="user">Address</label>
                        <input type="text" id="add" name="add" value="${acc.address}">
                    </div>
                    <p class="text-danger" style="color: red; font-weight: bold;">${mess}</p>
                    <button type="submit">Đăng ký</button>
                </form>
            </div>
    </body>
</html>
