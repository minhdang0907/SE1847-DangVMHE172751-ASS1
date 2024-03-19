<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <title>Thông tin tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }

        .user-form {
            width: 350px;
            border: 1px solid #ccc;
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .user-form label {
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 80%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .update-button {
            background-color: #e74c3c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="user-form">
        <form action="acc" method="post">
        <h2>Thông tin tài khoản</h2>
        <label for="user">User</label>
        <input type="text" id="user" name="user" value="${acc.user}">
        <label for="password">Password</label>
    <div class="password-container">
        <input type="password" id="password" name="password" value="${acc.pass}">
        <span class="toggle-password">👁️</span>
    </div>
        <label for="user">Email</label>
        <input type="email" id="email" name="email" value="${acc.email}">
        <label for="user">Name</label>
        <input type="text" id="name" name="name" value="${acc.name}">
        <label for="user">Phone</label>
        <input type="text" id="phone" name="phone" value="${acc.phone}"><!-- comment -->
        <label for="user">Address</label>
        <input type="text" id="add" name="add" value="${acc.address}">
        <button class="update-button" type="submit">Cập nhật</button>
        </form>
        
    </div>
        
</body>
<script>
    const togglePassword = document.querySelector('.toggle-password');
    const passwordInput = document.getElementById('password');

    togglePassword.addEventListener('click', function () {
        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
        passwordInput.setAttribute('type', type);
        this.textContent = type === 'password' ? '👁️' : '👁️';
    });
</script>
</html>
