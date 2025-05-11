package com.collegeevent.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class ViewEventsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection info
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Event> events = new ArrayList<>();
        
        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the DB
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            
            // Query events
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM events");
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
                events.add(event);
            }

            // Close DB connections
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Set events list as request attribute
        request.setAttribute("events", events);
        
        // Forward to JSP
        request.getRequestDispatcher("view-events.jsp").forward(request, response);
    }

    // Event class to store event data
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

        // ✅ Add these getters
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
