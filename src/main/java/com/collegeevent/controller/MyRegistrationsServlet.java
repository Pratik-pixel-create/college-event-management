package com.collegeevent.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class MyRegistrationsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection info
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Event> registrations = new ArrayList<>();

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the DB
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            // Query registered events for the user
            String sql = "SELECT e.id, e.title, e.description, e.date, e.time, e.venue " +
                         "FROM events e " +
                         "JOIN registrations r ON e.id = r.event_id " +
                         "WHERE r.user_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Event event = new Event(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("date"),
                        rs.getString("time"),
                        rs.getString("venue")
                );
                registrations.add(event);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set registered events as request attribute
        request.setAttribute("registrations", registrations);

        // Forward to JSP
        request.getRequestDispatcher("my-registrations.jsp").forward(request, response);
    }

    public static class Event {
        private int id;
        private String title;
        private String description;
        private String date;
        private String time;
        private String venue;

        public Event(int id, String title, String description, String date, String time, String venue) {
            this.id = id;
            this.title = title;
            this.description = description;
            this.date = date;
            this.time = time;
            this.venue = venue;
        }

        // Getters for the fields
        public int getId() {
            return id;
        }

        public String getTitle() {
            return title;
        }

        public String getDescription() {
            return description;
        }

        public String getDate() {
            return date;
        }

        public String getTime() {
            return time;
        }

        public String getVenue() {
            return venue;
        }
    }
}
