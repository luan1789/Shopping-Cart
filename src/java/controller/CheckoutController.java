/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.FoodDAO;
import daos.LogDAO;
import daos.OrderDAO;
import dtos.CartFoodDTO;
import dtos.FoodDTO;
import dtos.LogDTO;
import dtos.OrderDTO;
import dtos.UserDTO;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author PC
 */
@WebServlet(name = "CheckoutController", urlPatterns = {"/CheckoutController"})
public class CheckoutController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CheckoutController.class);
    private static final String ERROR = "viewcart.jsp";
    private static final String SUCCESS = "success.jsp";
    private static final String PAYPAL = "authorize_payment";

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
        String url = ERROR;
        try {

            List<String> listError = new ArrayList<>();
            HttpSession session = request.getSession();
            CartFoodDTO cart = (CartFoodDTO) session.getAttribute("CART");
            FoodDAO dao = new FoodDAO();

            boolean isEnough = true;
            String desLog = "FoodID: ";
            for (FoodDTO fdto : cart.getCart().values()) {
                int quantityDB = dao.getQuantityFood(fdto.getFoodID());
                if (quantityDB < fdto.getQuantity()) {
                    isEnough = false;
                    listError.add(fdto.getFoodName() + " have " + quantityDB + " left\n");
                } else {
                    desLog += ", " + fdto.getFoodID();
                }
            }
            if (isEnough) {
                float total = Float.parseFloat(request.getParameter("total"));
                String paymentMethod = request.getParameter("paymentMethod");
                UserDTO us = (UserDTO) session.getAttribute("LOGIN_USER");
                int oderID = utils.RamdomOder.randomInt(0, 9999);
                OrderDTO order = new OrderDTO(oderID, us.getUserID(),
                        Calendar.getInstance().getTime(), total);
                order.getListFood().addAll(cart.getCart().values());
                if ("Paypal".equals(paymentMethod)) {
                    url = PAYPAL + "?product=" + desLog + "&subtotal=" + total
                            + "&shipping=0&tax=0&total=" + total;
                    session.setAttribute("ORDER", order);
                } else {

                    OrderDAO odao = new OrderDAO();
                    LogDAO ldao = new LogDAO();
                    if (odao.inserFullOrder(order)) {
                        session.setAttribute("CART", null);
                        ldao.insertLog(
                                new LogDTO(0, us.getUserID(), "Shopping",
                                        desLog, new Timestamp(System.currentTimeMillis())));
                        url = SUCCESS;
                    }
                }
            } else {
                request.setAttribute("ERROR_CHECKOUT", listError);
            }

        } catch (Exception e) {
            LOGGER.error(e);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
