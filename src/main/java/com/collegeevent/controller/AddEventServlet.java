package com.collegeevent.controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class AddEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String venue = request.getParameter("venue");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            String insertQuery = "INSERT INTO events (title, description, date, time, venue) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setString(3, date);
            stmt.setString(4, time);
            stmt.setString(5, venue);

            int i = stmt.executeUpdate();
            conn.close();

            if (i > 0) {
                request.setAttribute("msg", "Event successfully added!");
            } else {
                request.setAttribute("msg", "Failed to add event.");
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("add-event.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Exception occurred while adding event.");
            request.getRequestDispatcher("add-event.jsp").forward(request, response);
        }
    }
}
