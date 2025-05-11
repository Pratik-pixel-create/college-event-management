package com.collegeevent.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

public class RegisterEventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection info
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        int eventId = Integer.parseInt(request.getParameter("eventId"));
        int tickets = Integer.parseInt(request.getParameter("tickets"));
        String paymentMethod = request.getParameter("payment");

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            // Optional: Prevent duplicate registration
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT * FROM registrations WHERE user_id = ? AND event_id = ?"
            );
            checkStmt.setInt(1, userId);
            checkStmt.setInt(2, eventId);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Already registered
            	// After successful registration
            	response.sendRedirect("registration-success.jsp?eventId=" + eventId);

                rs.close();
                checkStmt.close();
                conn.close();
                return;
            }

            rs.close();
            checkStmt.close();

            // Insert registration
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO registrations (user_id, event_id, tickets, payment_method) VALUES (?, ?, ?, ?)"
            );
            stmt.setInt(1, userId);
            stmt.setInt(2, eventId);
            stmt.setInt(3, tickets);
            stmt.setString(4, paymentMethod);

            stmt.executeUpdate();

            stmt.close();
            conn.close();

         // After successful registration
            response.sendRedirect("registration-success.jsp?eventId=" + eventId);



        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("browse-events.jsp?error=1");
        }
    }
}
