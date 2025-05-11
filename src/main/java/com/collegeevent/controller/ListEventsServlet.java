package com.collegeevent.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class ListEventsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            PreparedStatement stmt = conn.prepareStatement("SELECT id, title, description, date, time, venue FROM events");
            ResultSet rs = stmt.executeQuery();

            List<Event> events = new ArrayList<>();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String desc = rs.getString("description");
                String date = rs.getString("date");
                String time = rs.getString("time");
                String venue = rs.getString("venue");

                events.add(new Event(id, title, desc, date, time, venue));
            }

            request.setAttribute("events", events);
            request.getRequestDispatcher("browse-events.jsp").forward(request, response);

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            // Optional: forward to error page or show message
        }
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

        public int getId() { return id; }
        public String getTitle() { return title; }
        public String getDescription() { return description; }
        public String getDate() { return date; }
        public String getTime() { return time; }
        public String getVenue() { return venue; }
    }
}
