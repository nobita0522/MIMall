package com.mimall.service.inter;

import com.mimall.vo.*;

import java.util.List;

public interface MiMallOrderService {

    /**
     * 用户准备创建订单
     * @param paySerialNumber
     * @param phoneNumber
     * @param contains
     * @return
     */
    Message userCreateMiMallOrder(String paySerialNumber, String phoneNumber, List<Contain> contains);

    /**
     * 通过phoneNumber 查询 他的所有miMallOrders
     * @param phoneNumber
     * @return
     */
    List<MiMallOrder> getAllMiMallOrdersByPhoneNumber(String phoneNumber);

    /**
     * 更新订单状态
     * @param orderState
     * @param paySerialNumber
     * @return
     */
    int updateMiMallOrderState(Integer orderState,String paySerialNumber);

    /**
     * 查询所有订单
     * @return
     */
    List<MiMallOrder> getAllMiMallOrders();

    /**
     * 插入一条订单信息
     * @param miMallOrder
     * @return
     */
    int addMiMallOrder(MiMallOrder miMallOrder);

    /**
     * 移除一条订单信息
     * @param paySerialNumber
     * @return
     */
    int removeMiMallOrder(String paySerialNumber);

    /**
     * 修改指定miMallOrder
     * @param miMallOrder
     * @return
     */
    int updateMiMallOrder(MiMallOrder miMallOrder);

    /**
     * 添加contains
     * @param contains
     * @return
     */
    int addContain(List<Contain> contains);

    /**
     * 移除指定的 contains
     * @param paySerialNumber
     * @return
     */
    int removeContain(String paySerialNumber);

    /**
     * 修改指定的contain
     * @param contain
     * @return
     */
    int updateContains(Contain contain);

    /**
     * 通过用户的手机号 查询其所有的ClientMiMallOrder
     * @param phoneNumber
     * @return
     */
    List<ClientMiMallOrder> getAllClientMiMallOrderByPhoneNumber(String phoneNumber) throws Exception;

    /**
     * 通过流水号查询 封装 类型clientMiMallOrder
     * @param paySerialNumber
     * @return
     */
    ClientMiMallOrder getClientMiMallOrderByPaySerialNumber(String paySerialNumber) throws Exception;

    /**
     * 根据流水号查询用户.
     * @param paySerialNumber
     * @return
     */
    Users getUserByPaySerialNumber(String paySerialNumber);

}
