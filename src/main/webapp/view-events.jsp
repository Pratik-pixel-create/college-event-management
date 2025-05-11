<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.collegeevent.controller.ViewEventsServlet.Event" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<%
    if (session == null || !"admin".equals(session.getAttribute("userRole"))) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Event> events = (List<Event>) request.getAttribute("events");
%>
<!DOCTYPE html>
<html>
<head>
    <title>View Events</title>
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
            width: 900px;
            overflow: auto;
        }

        h2 {
            color: #1E3C72;
            margin-bottom: 20px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ccc;
        }

        th, td {
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2A5298;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        a {
            color: #2A5298;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
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
    <div class="container">
        <h2>All Events</h2>

        <table>
            <thead>
                <tr>
                    <th>Event ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Venue</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if (events != null && !events.isEmpty()) {
                        for (Event e : events) {
                %>
                <tr>
		           <td><%= e.getId() %></td>
						<td><%= e.getTitle() %></td>
						<td><%= e.getDescription() %></td>
						<td><%= e.getDate() %></td>
						<td><%= e.getTime() %></td>
						<td><%= e.getVenue() %></td>

                    <td>
                        <a href="edit-event.jsp?id=<%= e.getId() %>">Edit</a> |
                        <a href="DeleteEventServlet?id=<%=  e.getId() %>">Delete</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7">No events found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <div class="back-link">
            <p><a href="admin-dashboard.jsp">Back to Admin Dashboard</a></p>
        </div>
    </div>
</body>
</html>
