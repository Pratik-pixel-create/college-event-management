<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Event Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1E3C72, #2A5298); /* Rich blue gradient */
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            justify-content: center;
            align-items: center;
        }

        .login-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            width: 350px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #1E3C72;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #2A5298;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #1E3C72;
        }

        .register-link {
            text-align: center;
            margin-top: 15px;
        }

        .register-link a {
            color: #2A5298;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>User Login</h2>
        <form action="LoginServlet" method="post">
            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>
        <div class="register-link">
            <p><a href="register.jsp">Don't have an account? Register</a></p>
        </div>
    </div>
</body>
</html>
