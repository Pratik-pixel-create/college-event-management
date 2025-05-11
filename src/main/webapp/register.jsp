<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Event Management System</title>
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

        .register-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
            width: 350px;
        }

        .register-container h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #1E3C72;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
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

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

        .login-link a {
            color: #2A5298;
            text-decoration: none;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="register-container">
        <h2>User Registration</h2>
        <form action="RegisterServlet" method="post">
            <label>Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <label>Role:</label>
            <select name="role">
                <option value="student">Student</option>
                <option value="admin">Admin</option>
            </select>

            <input type="submit" value="Register">
        </form>
        <div class="login-link">
            <p><a href="login.jsp">Already have an account? Login</a></p>
        </div>
    </div>
</body>
</html>
