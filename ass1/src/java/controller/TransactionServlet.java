/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Cart;
import model.Order;
import model.Ordered;
import model.Transactions;

/**
 *
 * @author minhdang
 */
@WebServlet(name = "TransactionServlet", urlPatterns = {"/transaction"})
public class TransactionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TransactionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TransactionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        DAO dao = new DAO();
        String tr_usersession = request.getParameter("transaction_usersession");
        String tr_username = request.getParameter("transaction_name");
        String tr_usermail = request.getParameter("transaction_email");
        String tr_userphone = request.getParameter("transaction_phone");
        String tr_useraddress = request.getParameter("transaction_address");
        String tr_usermess = request.getParameter("transaction_mess");
        String tr_amount = request.getParameter("transaction_amount");
        String tr_payment = request.getParameter("transaction_payment");
        String tr_created = request.getParameter("transaction_created");

        Transactions transaction = new Transactions();
        transaction.setUser_session(tr_usersession);
        transaction.setUser_name(tr_username);
        transaction.setUser_mail(tr_usermail);
        transaction.setUser_phone(tr_userphone);
        transaction.setAddress(tr_useraddress);
        transaction.setMessage(tr_usermess);
        transaction.setAmount(tr_amount);
        transaction.setPayment(tr_payment);
        transaction.setCreated(tr_created);

        dao.insertTran(transaction);

        int maxid = 0;
        List<Transactions> transactions = dao.getAllTran();
        if (transactions.size() == 0) {
            maxid = 0;
        } else {
            for (Transactions transactions2 : transactions) {
                if (transactions2.getId() >= maxid) {
                    maxid = transactions2.getId();
                }
            }
        }
        HttpSession session = request.getSession(true);
        Order order = (Order) session.getAttribute("order");
        List<Cart> listItems = order.getCarts();
        for (Cart item : listItems) {
            Ordered ordered = new Ordered();
            ordered.setProduct_id(item.getProduct().getId());
            ordered.setQty(item.getQuantity());
            ordered.setTransacsion_id(String.valueOf(maxid));
            dao.insertOrd(ordered);
        }
        if (session != null) {
            session.removeAttribute("order"); //remove session
            session.removeAttribute("sumprice"); //remove session
            session.removeAttribute("length_order"); //remove session
        }
        response.sendRedirect("checkout");

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
