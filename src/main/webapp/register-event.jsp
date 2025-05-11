<%@ page import="jakarta.servlet.http.*, java.sql.*, java.util.*" %>
<%
    String eventIdStr = request.getParameter("id");
    int eventId = Integer.parseInt(eventIdStr);
    Integer userId = (Integer) session.getAttribute("userId");

    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Optional: Load event details from DB (for display)
    String title = "", date = "", venue = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college_event_db", "root", "root");

        PreparedStatement ps = conn.prepareStatement("SELECT title, date, venue FROM events WHERE id = ?");
        ps.setInt(1, eventId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            title = rs.getString("title");
            date = rs.getString("date");
            venue = rs.getString("venue");
        }

        rs.close(); ps.close(); conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Register for Event</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #7f7fd5, #86a8e7, #91eae4);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            margin-top: 60px;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        p {
            font-size: 16px;
            margin: 10px 0;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            color: #555;
        }

        input[type="number"],
        select {
            margin-top: 5px;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #388e3c;
        }

        strong {
            color: #2e2e2e;
        }

        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register for Event: <%= title %></h2>
        <form action="RegisterEventServlet" method="post">
            <input type="hidden" name="eventId" value="<%= eventId %>">
            
            <p>Event: <strong><%= title %></strong></p>
            <p>Date: <strong><%= date %></strong></p>
            <p>Venue: <strong><%= venue %></strong></p>

            <label for="tickets">No. of Tickets:</label>
            <input type="number" id="tickets" name="tickets" min="1" required>

            <label for="payment">Payment Method:</label>
            <select id="payment" name="payment" required>
                <option value="cash">Cash</option>
                <option value="online">Online</option>
            </select>

            <input type="submit" value="Confirm Registration">
        </form>
    </div>
</body>
</html>
