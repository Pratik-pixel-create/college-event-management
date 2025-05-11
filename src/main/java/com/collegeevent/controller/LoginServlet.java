package com.collegeevent.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection info
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Load driver and connect
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            // Prepare statement
            PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM users WHERE email = ? AND password = ?");
            stmt.setString(1, email);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login success
                String role = rs.getString("role");
                int userId = rs.getInt("id");

                // Start session
                HttpSession session = request.getSession();
                session.setAttribute("userId", userId);
                session.setAttribute("userRole", role);
                session.setAttribute("userName", rs.getString("name"));

                if ("admin".equals(role)) {
                    response.sendRedirect("admin-dashboard.jsp");
                } else {
                    response.sendRedirect("student-dashboard.jsp");
                }
            } else {
                out.println("<h3 style='color:red;'>Invalid email or password!</h3>");
                out.println("<a href='login.jsp'>Try Again</a>");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Exception: " + e.getMessage() + "</h3>");
        }
    }
}
