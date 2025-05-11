<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Event</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1E3C72, #2A5298); /* Blue gradient */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
        }

        h2 {
            color: #1E3C72;
            margin-bottom: 25px;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
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

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #2A5298;
            text-decoration: none;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Create New Event</h2>
        <% if (request.getAttribute("msg") != null) { %>
		    <p style="color: green; font-weight: bold;"><%= request.getAttribute("msg") %></p>
		<% } %>
        
        <form action="AddEventServlet" method="post">
            <label for="title">Event Title:</label>
            <input type="text" name="title" required>

            <label for="description">Event Description:</label>
            <textarea name="description" rows="4" cols="50" required></textarea>

            <label for="date">Event Date:</label>
            <input type="date" name="date" required>

            <label for="time">Event Time:</label>
            <input type="time" name="time" required>

            <label for="venue">Event Venue:</label>
            <input type="text" name="venue" required>

            <input type="submit" value="Add Event">
        </form>
        <div class="back-link">
            <p><a href="admin-dashboard.jsp">Back to Admin Dashboard</a></p>
        </div>
    </div>
</body>
</html>
