/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import daos.FoodDAO;
import dtos.FoodDTO;
import dtos.FoodErrorDTO;
import java.util.Date;
import org.apache.log4j.Logger;
import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author PC
 */
@WebServlet(name = "CreateFoodController", urlPatterns = {"/CreateFoodController"})
public class CreateFoodController extends HttpServlet {

    private static final Logger LOGGER = Logger.getLogger(CreateFoodController.class);
    private static final String SUCCESS = "SearchADController";
    private static final String ERROR = "create_food_page.jsp";

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
        FoodErrorDTO error = new FoodErrorDTO();
        boolean check = true;
        try {
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (!isMultipart) {
            } else {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;

                try {
                    items = upload.parseRequest(request);
                } catch (FileUploadException e) {
                    LOGGER.error(e);
                }
                Iterator itr = items.iterator();
                Hashtable params = new Hashtable();
                String fileName = null;
                while (itr.hasNext()) {
                    FileItem item = (FileItem) itr.next();
                    if (item.isFormField()) {
                        String name = item.getFieldName();
                        String value = item.getString();
                        params.put(item.getFieldName(), item.getString());
                    } else {
                        try {
                            String itemName = item.getName();
                            fileName = itemName.substring(itemName.lastIndexOf("\\") + 1);
                            String realPath = getServletContext().getRealPath("/")
                                    + "images\\" + fileName;
                            File saveFile = new File(realPath);
                            String diskPath = "images/" + fileName;
                            item.write(saveFile);
                            request.setAttribute("hinh", diskPath);

                        } catch (Exception e) {
                            LOGGER.error(e);
                        }
                    }
                }
                String foodID = (String) params.get("txtFoodID");
                String imageAddress = "images/" + fileName;
                String foodName = (String) params.get("txtFoodName");
                String des = (String) params.get("txtDes");
                String quantityString = (String) params.get("txtQuantity");
                int quantity = Integer.parseInt(quantityString);
                String priceString = (String) params.get("txtPrice");
                float price = Float.parseFloat(priceString);
                String category = (String) params.get("txtCategory");
                FoodDAO dao = new FoodDAO();
                if (dao.getFoodDTO(foodID) != null) {
                    check = false;
                    error.setFoodIDError("FoodID was duplicate");
                }
                if (check) {
                    FoodDTO dTO = new FoodDTO(foodID, foodName, price, des, imageAddress, new Date(), category, quantity, true);
                    dao.createFood(dTO);
                    url = SUCCESS;
                } else {
                    request.setAttribute("FOOD_ERROR", error);
                }
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
