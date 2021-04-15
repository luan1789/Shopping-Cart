package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;

/**
 *
 * @author User
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(MainController.class);

    private final static String ERROR = "invalid.html";
    private final static String LOGIN = "LoginController";
    private final static String LOGIN_PAGE = "login.jsp";
    private final static String SEARCH = "SearchController";
    private final static String AD_SEARCH = "SearchADController";
    private final static String FOOD_FAGE = "FoodPageController";

    private final static String LOGOUT = "LogoutController";
    private final static String HOME = "home.jsp";

    private final static String ADD = "AddController";
    private final static String VIEW_CART = "viewcart.jsp";
    private final static String UPDATE_CART = "UpdateController";
    private final static String DELETE_CART = "DeleteController";
    private final static String CHECK_OUT = "CheckoutController";
    private final static String PURCHASE = "PurchaseController";

    private final static String EDIT = "EditFoodController";
    private final static String UPDATE_FOOD = "UpdateFoodController";
    private final static String DELETE_FOOD = "DeleteFoodController";

    private final static String CREATE_FOOD_PAGE = "create_food_page.jsp";
    private final static String CREATE_FOOD = "CreateFoodController";

    private final static String AD_GET_LOG = "GetListLogController";
    private final static String AD_GET_PAGE = "GetPageADController";
    private final static String HISTOTY = "GetAllOrderController";
    private final static String DETAIL_ORDER = "GetOrderDetailController";
    private final static String SEARCH_HISTOTY = "SearchHistotyController";

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
        String URL = ERROR;
        try {
            String action = request.getParameter("btnAction");

            if ("LoginPage".equals(action)) {
                URL = LOGIN_PAGE;
            }
            if ("Login".equals(action)) {
                URL = LOGIN;
            }

            if ("Search".equals(action)) {
                URL = SEARCH;
            }
            if ("SearchAD".equals(action)) {
                URL = AD_SEARCH;
            }
            if ("Logout".equals(action)) {
                URL = LOGOUT;
            }
            if ("Food_page".equals(action)) {
                URL = FOOD_FAGE;
            }

            if ("Add".equals(action)) {
                URL = ADD;
            }
            if ("View".equals(action)) {
                URL = VIEW_CART;
            }

            if ("Checkout".equals(action)) {
                URL = CHECK_OUT;
            }

            if ("Edit".equals(action)) {
                URL = EDIT;
            }
            if ("Update".equals(action)) {
                URL = UPDATE_CART;
            }
            if ("Delete".equals(action)) {
                URL = DELETE_CART;
            }
            if ("UpdateFood".equals(action)) {
                URL = UPDATE_FOOD;
            }
            if ("DeleteFood".equals(action)) {
                URL = DELETE_FOOD;
            }
            if ("Create_Food_Page".equals(action)) {
                URL = CREATE_FOOD_PAGE;
            }
            if ("Create_Food".equals(action)) {
                URL = CREATE_FOOD;
            }

            if ("Get_Page".equals(action)) {
                URL = AD_GET_PAGE;
            }
            if ("List_log".equals(action)) {
                URL = AD_GET_LOG;
            }

            if ("Histoty".equals(action)) {
                URL = HISTOTY;
            }
            if ("Detail".equals(action)) {
                URL = DETAIL_ORDER;
            }
            if ("Home".equals(action)) {
                URL = HOME;
            }
            if ("Search_Histoty".equals(action)) {
                URL = SEARCH_HISTOTY;
            }
        } catch (Exception e) {
            LOGGER.error(e);
        } finally {
            request.getRequestDispatcher(URL).forward(request, response);
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
