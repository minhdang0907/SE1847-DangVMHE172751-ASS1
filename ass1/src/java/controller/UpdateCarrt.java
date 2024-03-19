/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.DecimalFormat;
import java.util.List;
import model.Cart;
import model.Order;

/**
 *
 * @author minhdang
 */
@WebServlet(name="UpdateCarrt", urlPatterns={"/updateCart"})
public class UpdateCarrt extends HttpServlet {
     DecimalFormat df = new DecimalFormat("#.00");
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateCarrt</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCarrt at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher(request.getContextPath()+"/cart").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();   
        Order order = (Order) session.getAttribute("order");
        List<Cart> listCart = order.getCarts();
        order.setSumPrice(0);
        
        for(Cart c : listCart) {
            double price = Double.parseDouble(c.getProduct().getPrice()+"");
            c.setPrice(price);
            c.setQuantity(Integer.parseInt(request.getParameter(""+c.getProduct().getId())));
            order.setSumPrice(order.getSumPrice()+ c.getPrice()*c.getQuantity());
            
        }
        order.setCarts(listCart);
        session.setAttribute("order", order);
        session.setAttribute("sumprice", df.format(order.getSumPrice()));
        
        
        response.sendRedirect(request.getContextPath()+"/cart");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
