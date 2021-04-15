/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.FoodDAO;
import daos.TypeFoodDAO;
import dtos.FoodDTO;
import dtos.TypeDTO;
import java.io.IOException;
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
@WebServlet(name = "SearchADController", urlPatterns = {"/SearchADController"})
public class SearchADController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(SearchADController.class);
    private static final String SUCCESS = "ad_all_foods.jsp";

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
        String url = SUCCESS;
        try {

            String search = request.getParameter("txtSearch");
            float priceCheck = 1000;
            String priceString = request.getParameter("txtPriceCheck");
            if (!"".equals(priceString) && priceString != null) {
                priceCheck = Float.parseFloat(request.getParameter("txtPriceCheck"));
            }
            int pageNum = 1;
            int pageSize = 4;
            if (request.getParameter("page") != null) {
                pageNum = Integer.parseInt(request.getParameter("page"));
            }
            String category = request.getParameter("txtCategory");
            int noOfPages;
            List<FoodDTO> list;

            FoodDAO dao = new FoodDAO();
            TypeFoodDAO typeDao = new TypeFoodDAO();

            List<TypeDTO> listType = typeDao.getAllTypeDTOs();

            if ("All".equals(category) || "".equals(category)) {
                category = null;
            }
            search = search == null ? "" : search;
            noOfPages = (int) Math.ceil(dao.getNoOfRecordsSearchAdmin(category, search, priceCheck) * 1.0 / pageSize);
            list = dao.getFoodBySearchAdmin(category, search, priceCheck, pageSize, pageNum);

            HttpSession session = request.getSession();
            session.setAttribute("LIST_TYPE", listType);
            session.setAttribute("PAGE_FOODS", list);
            request.setAttribute("noOfPages", noOfPages);
            request.setAttribute("currentPage", pageNum);
            session.setAttribute("PriceCheck", priceCheck);

        } catch (Exception e) {
            LOGGER.equals(e);
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
