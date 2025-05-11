<%@ page import="java.sql.*, com.collegeevent.controller.ViewEventsServlet.Event" %>
<%
    int eventId = Integer.parseInt(request.getParameter("id"));
    Event event = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/college_event_db", "root", "root");

        String sql = "SELECT * FROM events WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, eventId);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            event = new Event(
                rs.getInt("id"),
                rs.getString("title"),
                rs.getString("description"),
                rs.getDate("date").toString(),
                rs.getTime("time").toString(),
                rs.getString("venue")
            );
        }

        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    if (event == null) {
        response.sendRedirect("view-events.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Event</title>
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
            margin-top: 60px;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 95%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 25px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            font-size: 16px;
            background-color: #2A5298;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #1E3C72;
        }

        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }

            input, textarea {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Event</h2>
        <form action="UpdateEventServlet" method="post">
            <input type="hidden" name="id" value="<%= event.getId() %>" />

            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="<%= event.getTitle() %>" required />

            <label for="description">Description:</label>
            <textarea id="description" name="description" required><%= event.getDescription() %></textarea>

            <label for="date">Date:</label>
            <input type="date" id="date" name="date" value="<%= event.getDate() %>" required />

            <label for="time">Time:</label>
            <input type="time" id="time" name="time" value="<%= event.getTime() %>" required />

            <label for="venue">Venue:</label>
            <input type="text" id="venue" name="venue" value="<%= event.getVenue() %>" required />

            <input type="submit" value="Update Event" />
        </form>
    </div>
</body>
</html>
