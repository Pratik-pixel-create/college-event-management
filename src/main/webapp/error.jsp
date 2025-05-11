<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #FF7A00, #FFBC00);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            color: #333;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
        }

        h2 {
            font-size: 32px;
            color: #FF5733;
            margin-bottom: 20px;
        }

        p {
            font-size: 18px;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #FF5733;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #D44F2C;
        }

        .error-icon {
            font-size: 50px;
            margin-bottom: 20px;
            color: #FF5733;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-icon"></div>
        <h2>Oops! Something went wrong.</h2>
        <p>We encountered an issue while processing your request. Please try again later.</p>
        <a href="student-dashboard.jsp">Go to Dashboard</a>
    </div>
</body>
</html>
