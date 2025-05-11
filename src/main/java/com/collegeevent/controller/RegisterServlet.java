package com.collegeevent.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Update with your DB credentials
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/college_event_db";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to DB
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);

            // Check if email already exists
            PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                out.println("<h3 style='color:red;'>Email already registered!</h3>");
                return;
            }

            // Insert new user
            PreparedStatement stmt = conn.prepareStatement(
                "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)");
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, role);

            int i = stmt.executeUpdate();
            if (i > 0) {
                out.println("<h3 style='color:green;'>Registration successful!</h3>");
                out.println("<a href='login.jsp'>Click here to Login</a>");
            } else {
                out.println("<h3 style='color:red;'>Error during registration!</h3>");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red;'>Exception: " + e.getMessage() + "</h3>");
        }
    }
}
