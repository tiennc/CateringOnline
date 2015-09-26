/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.SendEmail;
import model.UserProcess;

/**
 *
 * @author Windows 10
 */
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public static void main(String[] args) {

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        UserProcess db = new UserProcess();
        String ac = request.getParameter("ac");

        if (ac.equals("login")) {

            String u = request.getParameter("txtUser");
            String p = request.getParameter("txtPass");
            if (request.getParameter("cbRemember") != null) {
                String[] cookieNames = {"user", "pass", "cb"};
                String[] cookieValues = {u.toString(), p.toString(), "ok"};
                for (int i = 0; i < cookieNames.length; i++) {
                    Cookie cookie = new Cookie(cookieNames[i], cookieValues[i]);
                    cookie.setMaxAge(30 * 24 * 60 * 60);
                    response.addCookie(cookie);
                }
            }
            if (db.checkLogin(u, p)) {
                HttpSession session = request.getSession();
                session.setAttribute("login", u);
                response.sendRedirect("Home.jsp");
            } else {
                response.sendRedirect("Error.jsp");
            }
        }

        if (ac.equals("logout")) {

            HttpSession session = request.getSession();
            session.setAttribute("login", null);
            response.sendRedirect("Home.jsp");;

        }

        if (ac.equals("register")) {
            String id = db.takeId("u", "UserId", "tblUser");
            String name = request.getParameter("username");
            String pass = request.getParameter("password");
            String email = request.getParameter("email");
            int role = Integer.parseInt(request.getParameter("rbRole"));
            String codeActive = UUID.randomUUID().toString();
            System.out.println("before if");
            if (db.registerUser(id, name, pass, email, role, codeActive)) {
                SendEmail sm = new SendEmail();
                sm.sendEmail(email, name, codeActive, id);
                System.out.println("jush send email");
//                request.setAttribute("register", "success");
//                request.getRequestDispatcher("/Menu.jsp").forward(request, response);
                response.sendRedirect("Home.jsp?register=success");
                System.out.println("redirect");
            } else {
                response.sendRedirect("Error.jsp?id=" + id);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
