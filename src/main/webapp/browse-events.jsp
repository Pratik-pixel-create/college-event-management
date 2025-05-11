<%@ page import="java.util.List" %>
<%@ page import="com.collegeevent.controller.ListEventsServlet.Event" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Browse Events</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1E3C72, #2A5298);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 40px 30px;
            margin-top: 50px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            width: 95%;
            max-width: 1100px;
        }

        h2 {
            color: #2C3E50;
            text-align: center;
            margin-bottom: 20px;
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

        a {
            background-color: #2BC0E4;
            color: #fff;
            padding: 6px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #1993b3;
        }

        @media (max-width: 768px) {
            table, thead, tbody, th, td, tr {
                display: block;
            }

            thead tr {
                display: none;
            }

            td {
                position: relative;
                padding-left: 50%;
                text-align: left;
                border: none;
                border-bottom: 1px solid #ccc;
            }

            td::before {
                position: absolute;
                top: 12px;
                left: 16px;
                width: 45%;
                font-weight: bold;
                white-space: nowrap;
            }

            td:nth-of-type(1)::before { content: "Event ID"; }
            td:nth-of-type(2)::before { content: "Title"; }
            td:nth-of-type(3)::before { content: "Description"; }
            td:nth-of-type(4)::before { content: "Date"; }
            td:nth-of-type(5)::before { content: "Time"; }
            td:nth-of-type(6)::before { content: "Venue"; }
            td:nth-of-type(7)::before { content: "Register"; }
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
                    <th>Register</th>
                </tr>
            </thead>
            <tbody>
                <%
				    List<Event> events = (List<Event>) request.getAttribute("events");
				    if (events != null) {
				        for (Event event : events) {
				%>
				            <tr>
				                <td><%= event.getId() %></td>
				                <td><%= event.getTitle() %></td>
				                <td><%= event.getDescription() %></td>
				                <td><%= event.getDate() %></td>
				                <td><%= event.getTime() %></td>
				                <td><%= event.getVenue() %></td>
				                <td><a href="register-event.jsp?id=<%= event.getId() %>">Register</a></td>
				                
				            </tr>
				<%
				        }
				    } else {
				%>
				            <tr><td colspan="7">No events available at the moment.</td></tr>
				<%
				    }
				%>

            </tbody>
        </table>
    </div>
</body>
</html>
