package com.collegeevent.controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class UpdateEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String venue = request.getParameter("venue");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            String sql = "UPDATE events SET title = ?, description = ?, date = ?, time = ?, venue = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setString(2, description);
            stmt.setString(3, date);
            stmt.setString(4, time);
            stmt.setString(5, venue);
            stmt.setInt(6, id);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            response.sendRedirect("ViewEventsServlet");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
