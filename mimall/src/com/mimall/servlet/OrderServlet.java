package com.mimall.servlet;

import com.mimall.service.impl.MiMallOrderServiceImpl;
import com.mimall.service.inter.MiMallOrderService;
import com.mimall.util.AjaxUtil;
import com.mimall.util.Utility;
import com.mimall.vo.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderServlet extends HttpServlet {

    MiMallOrderService miMallOrderService = new MiMallOrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if (action.equals("getAllOrdersByPhoneNumber")) {
            getAllOrdersByPhoneNumber(req, resp);
        } else if (action.equals("submitOrders")) {
            submitOrders(req, resp);
        } else if (action.equals("getAllOrders")) {
            getAllOrders(req,resp);
        } else if (action.equals("findOrderDetails")) {
            try {
                findOrderDetails(req,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if (action.equals("cancelOrderByPaySerialnumber")) {
            cancelOrderByPaySerialnumber(req,resp);
        }

    }

    private void cancelOrderByPaySerialnumber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String paySerialNumber = req.getParameter("paySerialNumber");
        Integer orderState = Integer.valueOf(req.getParameter("orderState"));
        miMallOrderService = new MiMallOrderServiceImpl();
        int lines = miMallOrderService.updateMiMallOrderState(orderState,paySerialNumber);
        if (lines == 1){
            // success
            getAllOrders(req,resp);
        } else {
            // fail
            Message message = new Message(false,"更新失败");
            AjaxUtil.updatePageWithAjaxJson(resp,message);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    public void getAllOrdersByPhoneNumber(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Users user = (Users) req.getSession(true).getAttribute("user");
        miMallOrderService = new MiMallOrderServiceImpl();
        try {
            List<ClientMiMallOrder> clientMiMallOrders = miMallOrderService.getAllClientMiMallOrderByPhoneNumber(user.getUPHONE());
            req.getSession(true).setAttribute("clientMiMallOrders", clientMiMallOrders);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("html/myform.jsp").forward(req, resp);
    }

    public void submitOrders(HttpServletRequest req, HttpServletResponse resp) {
        miMallOrderService = new MiMallOrderServiceImpl();
        javax.servlet.http.HttpSession session = req.getSession(true);
        String phoneNumber = ((Users) session.getAttribute("user")).getUPHONE();
        String paySerialNumber = Utility.getPaySerialNumber();
        List<Contain> contains = new ArrayList<>();
        List<shoppingcart> shoppingcarts = (List<shoppingcart>) req.getSession(true).getAttribute("shoppingcarts");
        for (shoppingcart shoppingcart : shoppingcarts) {
            Contain contain = new Contain();
            contain.setPaySerialNumber(paySerialNumber);
            contain.setPurchaseNumber(shoppingcart.getCartcount());
            contain.setPid(shoppingcart.getPID());
            contains.add(contain);
        }
        Message message = miMallOrderService.userCreateMiMallOrder(paySerialNumber, phoneNumber, contains);
        if (message.isSuccess()) {
            // empty shoppingCart
            session.removeAttribute("shoppingCart");
        }
        try {
            req.getRequestDispatcher("html/myform.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void getAllOrders(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        miMallOrderService = new MiMallOrderServiceImpl();
        List<MiMallOrder> miMallOrders = miMallOrderService.getAllMiMallOrders();
        List<Users> usersList = new ArrayList<>();
        if (miMallOrders.size() > 0) {
            for (MiMallOrder miMallOrder : miMallOrders) {
                Users users =  miMallOrderService.getUserByPaySerialNumber(miMallOrder.getPaySerialNumber());
                usersList.add(users);
            }
        }
        req.setAttribute("usersList",usersList);
        req.setAttribute("miMallOrders",miMallOrders);
        req.getRequestDispatcher("WEB-INF/jsp/admin/order/orderMain.jsp").forward(req,resp);
    }

    private void findOrderDetails(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        miMallOrderService = new MiMallOrderServiceImpl();
        String paySerialNumber = req.getParameter("paySerialNumber");
        ClientMiMallOrder clientMiMallOrder = miMallOrderService.getClientMiMallOrderByPaySerialNumber(paySerialNumber);
        req.setAttribute("clientMiMallOrder",clientMiMallOrder);
        req.getRequestDispatcher("WEB-INF/jsp/admin/order/findOrderDetails.jsp").forward(req,resp);
    }

}
