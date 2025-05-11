<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    String eventIdParam = request.getParameter("eventId");
    int eventId = eventIdParam != null ? Integer.parseInt(eventIdParam) : 0;

    String title = "", description = "", date = "", time = "", venue = "";

    if (eventId > 0) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college_event_db", "root", "root");

            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM events WHERE id = ?");
            stmt.setInt(1, eventId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                title = rs.getString("title");
                description = rs.getString("description");
                date = rs.getString("date");
                time = rs.getString("time");
                venue = rs.getString("venue");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Registration Successful</title>
    <style>
        body {
            background: linear-gradient(135deg, #1E3C72, #2A5298);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            text-align: center;
            padding: 60px 20px;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            color: #333;
            padding: 35px 45px;
            border-radius: 14px;
            display: inline-block;
            text-align: left;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.35);
            max-width: 600px;
            width: 100%;
        }

        h2 {
            color: #2A5298;
            margin-bottom: 25px;
            text-align: center;
            font-size: 26px;
        }

        .event-details p {
            margin: 12px 0;
            font-size: 17px;
            line-height: 1.5;
        }

        .event-details strong {
            color: #1E3C72;
        }

        .back-link {
            margin-top: 35px;
            text-align: center;
        }

        .back-link a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2A5298;
            color: #fff;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .back-link a:hover {
            background-color: #1e3c72;
        }

        @media (max-width: 640px) {
            .container {
                padding: 25px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>🎉 Registration Successful!</h2>
        <div class="event-details">
            <p><strong>Event Title:</strong> <%= title %></p>
            <p><strong>Description:</strong> <%= description %></p>
            <p><strong>Date:</strong> <%= date %></p>
            <p><strong>Time:</strong> <%= time %></p>
            <p><strong>Venue:</strong> <%= venue %></p>
        </div>
        <div class="back-link">
            <a href="student-dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
