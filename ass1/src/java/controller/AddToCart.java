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
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Order;
import model.Product;

/**
 *
 * @author minhdang
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/add_cart"})
public class AddToCart extends HttpServlet {

    DecimalFormat df = new DecimalFormat("#.00");

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
            out.println("<title>Servlet AddToCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        int n = 0;
        int qty = 1;
        String id;
        DAO dao = new DAO();

        if (request.getParameter("proId") != null) {
            id = request.getParameter("proId");
            Product pro = dao.getProductById(id);
            if (pro != null) {
                if (request.getParameter("quantity") != null) {
                    qty = Integer.parseInt(request.getParameter("quantity"));
                }

                HttpSession session = request.getSession();
                if (session.getAttribute("order") == null) {
                    Order order = new Order();
                    List<Cart> list = new ArrayList<>();
                    Cart cart = new Cart();
                    cart.setQuantity(qty);
                    cart.setProduct(pro);
                    cart.setPrice(Double.parseDouble(pro.getPrice() + ""));
                    order.setSumPrice(0);
                    order.setSumPrice(order.getSumPrice() + cart.getPrice());
                    list.add(cart);
                    order.setCarts(list);
                    n = list.size();
                    session.setAttribute("length_order", n);
                    session.setAttribute("order", order);
                    session.setAttribute("sumprice", df.format(order.getSumPrice()));
                } else {
                    Order order = (Order) session.getAttribute("order");
                    List<Cart> list = order.getCarts();
                    boolean check = false;
                    for (Cart cart : list) {
                        if (Integer.parseInt(cart.getProduct().getId() + "") == Integer.parseInt(pro.getId() + "")) {
                            cart.setQuantity(qty + cart.getQuantity());
                            order.setSumPrice(order.getSumPrice() + Double.parseDouble(cart.getProduct().getPrice() + ""));
                            cart.setPrice(cart.getPrice() + Double.parseDouble(cart.getProduct().getPrice() + ""));
                            check = true;

                        }
                    }

                    if (check == false) {
                        Cart cart = new Cart();
                        cart.setQuantity(qty);
                        cart.setProduct(pro);
                        cart.setPrice(Double.parseDouble(pro.getPrice() + ""));
                        order.setSumPrice(order.getSumPrice() + Double.parseDouble(cart.getProduct().getPrice() + ""));
                        list.add(cart);
                    }
                    n = list.size();
                    session.setAttribute("length_order", n);
                    session.setAttribute("order", order);
                    session.setAttribute("sumprice", df.format(order.getSumPrice()));
                }

            }
            response.sendRedirect("cart");
        } 
            
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
