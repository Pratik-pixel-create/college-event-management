<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
        response.sendRedirect("login.jsp");
        return;
    }
    String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1E3C72, #2A5298);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .dashboard-container {
            background-color: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
        }

        h2 {
            color: #1E3C72;
            margin-bottom: 25px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin: 15px 0;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2A5298;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #1E3C72;
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>Welcome, Admin <%= userName %>!</h2>
        <ul>
            <li><a href="add-event.jsp">Add Event</a></li>
            <li><a href="ViewEventsServlet">Manage Events</a></li>
<!--             <li><a href="ViewRegistrationsServlet">View Event Registrations</a></li> -->
            <li><a href="LogoutServlet">Logout</a></li>
        </ul>
    </div>
</body>
</html>
