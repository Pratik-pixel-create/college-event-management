<%@ page import="java.util.List" %>
<%@ page import="com.collegeevent.controller.MyRegistrationsServlet.Event" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Registered Events</title>
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

        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 1100px;
        }

        h2 {
            color: #2C3E50;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 16px;
        }

        th, td {
            padding: 14px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #2C3E50;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        tr:nth-child(even) td {
            background-color: #f2f2f2;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #2A5298;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Your Registered Events</h2>
        <table>
            <thead>
                <tr>
                    <th>Event Title</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Venue</th>
                    <th>Days Remaining</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Event> registrations = (List<Event>) request.getAttribute("registrations");
                    if (registrations != null && !registrations.isEmpty()) {
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                        for (Event event : registrations) {
                            LocalDate eventDate = LocalDate.parse(event.getDate(), formatter);
                            long daysRemaining = java.time.temporal.ChronoUnit.DAYS.between(LocalDate.now(), eventDate);
                %>
                <tr>
                    <td><%= event.getTitle() %></td>
                    <td><%= event.getDescription() %></td>
                    <td><%= event.getDate() %></td>
                    <td><%= event.getVenue() %></td>
                    <td><%= daysRemaining %> Days</td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5">You haven't registered for any events yet.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="back-link">
            <p><a href="student-dashboard.jsp">Back to Dashboard</a></p>
        </div>
    </div>
</body>
</html>
