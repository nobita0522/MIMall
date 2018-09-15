package com.mimall.service.impl;

import com.mimall.dao.impl.MiMallOrderDaoImpl;
import com.mimall.dao.impl.ProductDaoImpl;
import com.mimall.dao.impl.UserDaoimpl;
import com.mimall.dao.inter.MiMallOrderDao;
import com.mimall.dao.inter.ProductDao;
import com.mimall.dao.inter.UserDao;
import com.mimall.service.inter.MiMallOrderService;
import com.mimall.util.Utility;
import com.mimall.vo.*;

import java.util.ArrayList;
import java.util.List;

public class MiMallOrderServiceImpl implements MiMallOrderService {

    UserDao userDao = new UserDaoimpl();
    MiMallOrderDao miMallOrderDao = new MiMallOrderDaoImpl();
    ProductDao productDao = new ProductDaoImpl();

    /**
     * 用户准备创建订单
     *
     * @param paySerialNumber
     * @param phoneNumber
     * @param contains
     * @return
     */
    @Override
    public Message userCreateMiMallOrder(String paySerialNumber, String phoneNumber, List<Contain> contains) {
        // create order.contains  if success empty shoppingCart.
        Message message = new Message(false, "创建订单失败");
        Integer orderState = 0;
        String payMethod = "暂未支付";
        String createTime = Utility.getCurrentTime();
        String payOrCancelTime = "0";

        MiMallOrder miMallOrder = new MiMallOrder(paySerialNumber, orderState, payMethod, createTime, payOrCancelTime, phoneNumber);
        int addMiMallOrderSuccess = addMiMallOrder(miMallOrder);
        if (addMiMallOrderSuccess == 1) {
            // add success.then add contains
            int addContainsSuccess = miMallOrderDao.insertContains(contains);
            if (addContainsSuccess == contains.size()) {
                // add success
                message = new Message(true, "创建订单成功");
            } else {
                removeContain(paySerialNumber);
            }
        } else {
            // add fails.delete
            removeMiMallOrder(paySerialNumber);
        }
        return message;
    }

    /**
     * 通过phoneNumber 查询 他的所有miMallOrders
     *
     * @param phoneNumber
     * @return
     */
    @Override
    public List<MiMallOrder> getAllMiMallOrdersByPhoneNumber(String phoneNumber) {
        List<MiMallOrder> miMallOrders = miMallOrderDao.queryAllMiMallOrderByPhoneNumber(phoneNumber);
        return miMallOrders;
    }

    /**
     * 更新订单状态
     *
     * @param orderState
     * @param paySerialNumber
     * @return
     */
    @Override
    public int updateMiMallOrderState(Integer orderState, String paySerialNumber) {
        return miMallOrderDao.updateMiMallOrderState(orderState,paySerialNumber);
    }

    /**
     * 查询所有订单
     *
     * @return
     */
    @Override
    public List<MiMallOrder> getAllMiMallOrders() {
        return miMallOrderDao.queryAllMiMallOrder();
    }

    /**
     * 插入一条订单信息
     *
     * @param miMallOrder
     * @return
     */
    @Override
    public int addMiMallOrder(MiMallOrder miMallOrder) {
        return miMallOrderDao.insertMiMallOrder(miMallOrder);
    }

    /**
     * 移除一条订单信息
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public int removeMiMallOrder(String paySerialNumber) {
        return miMallOrderDao.deleteContainsByPaySerialNumber(paySerialNumber);
    }

    /**
     * 修改指定miMallOrder
     *
     * @param miMallOrder
     * @return
     */
    @Override
    public int updateMiMallOrder(MiMallOrder miMallOrder) {
        return miMallOrderDao.updateMiMallOrder(miMallOrder);
    }

    /**
     * 添加contains
     *
     * @param contains
     * @return
     */
    @Override
    public int addContain(List<Contain> contains) {
        return miMallOrderDao.insertContains(contains);
    }

    /**
     * 移除指定的 contains
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public int removeContain(String paySerialNumber) {
        return miMallOrderDao.deleteContainsByPaySerialNumber(paySerialNumber);
    }

    /**
     * 修改指定的contain
     *
     * @param contain
     * @return
     */
    @Override
    public int updateContains(Contain contain) {
        return miMallOrderDao.updateContain(contain);
    }

    /**
     * 通过用户的手机号 查询其所有的ClientMiMallOrder
     *
     * @param phoneNumber
     * @return
     */
    @Override
    public List<ClientMiMallOrder> getAllClientMiMallOrderByPhoneNumber(String phoneNumber) throws Exception {

        List<ClientMiMallOrder> clientMiMallOrders = new ArrayList<>();
        List<MiMallOrder> miMallOrders = miMallOrderDao.queryAllMiMallOrderByPhoneNumber(phoneNumber);
        for (MiMallOrder miMallOrder : miMallOrders) {
            ClientMiMallOrder clientMiMallOrder = getClientMiMallOrderByPaySerialNumber(miMallOrder.getPaySerialNumber());
            clientMiMallOrders.add(clientMiMallOrder);
        }
        return clientMiMallOrders;
    }

    /**
     * 通过流水号查询 封装 类型clientMiMallOrder
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public ClientMiMallOrder getClientMiMallOrderByPaySerialNumber(String paySerialNumber) throws Exception {
        ClientMiMallOrder clientMiMallOrder = new ClientMiMallOrder();
        MiMallOrder miMallOrder = miMallOrderDao.queryMiMallOrderByPaySerialNumber(paySerialNumber);
        List<Contain> contains = miMallOrderDao.queryAllContainByPaySerialNumber(paySerialNumber);
        List<Product> products = new ArrayList<>();
        List<Integer> purchaseNumbers = new ArrayList<>();
        for (Contain contain : contains) {
            Product product = new ProductDaoImpl().getProductById(Integer.valueOf(contain.getPid()));
            Integer purchaseNumber = contain.getPurchaseNumber();
            products.add(product);
            purchaseNumbers.add(purchaseNumber);
        }
        Users user = getUserByPaySerialNumber(paySerialNumber);
        clientMiMallOrder.setUser(user);
        clientMiMallOrder.setMiMallOrder(miMallOrder);
        clientMiMallOrder.setProducts(products);
        clientMiMallOrder.setPurchaseNumbers(purchaseNumbers);
        return clientMiMallOrder;
    }

    /**
     * 根据流水号查询用户.
     * @param paySerialNumber
     * @return
     */
    @Override
    public Users getUserByPaySerialNumber(String paySerialNumber) {
        return miMallOrderDao.queryUserByPaySerialNumber(paySerialNumber);
    }
}
