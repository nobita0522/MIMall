package com.mimall.dao.inter;

import com.mimall.vo.Contain;
import com.mimall.vo.MiMallOrder;
import com.mimall.vo.Users;

import java.util.List;

public interface MiMallOrderDao {

    /**
     * 查询指定用户的所有订单
     * @param phoneNumber
     * @return
     */
    List<MiMallOrder> queryAllMiMallOrderByPhoneNumber(String phoneNumber);

    /**
     * 更新订单状态
     * @param orderState
     * @return
     */
    int updateMiMallOrderState(Integer orderState,String paySerialNumber);

    /**
     * 查询所有订单
     * @return
     */
    List<MiMallOrder> queryAllMiMallOrder();

    /**
     * 通过流水号查询订单
     * @param paySerialNumber
     * @return
     */
    MiMallOrder queryMiMallOrderByPaySerialNumber(String paySerialNumber);

    /**
     * 添加指定一条 miMallOrder记录
     * @param miMallOrder
     * @return
     */
    int insertMiMallOrder(MiMallOrder miMallOrder);

    /**
     * 删除指定的miMallOrder
     * @param paySerialNumber
     * @return
     */
    int deleteMiMallOrder(String paySerialNumber);

    /**
     * 更新指定的miMallOrder
     * @param miMallOrder
     * @return
     */
    int updateMiMallOrder(MiMallOrder miMallOrder);

    /**
     * 通过流水号查询其 对应的包含商品的信息
     * @param paySerialNumber
     * @return
     */
    List<Contain> queryAllContainByPaySerialNumber(String paySerialNumber);

    /**
     * 插入 contain 数据
     * @param contains
     * @return
     */
    int insertContains(List<Contain> contains);

    /**
     * 删除指定 paySerialNumber订单的 商品
     * @param paySerialNumber
     * @return
     */
    int deleteContainsByPaySerialNumber(String paySerialNumber);

    /**
     * 修改指定的contain
     * @param contain
     * @return
     */
    int updateContain(Contain contain);

    /**
     * 根据paySerialNumber查询用户
     * @param paySerialNumber
     * @return
     */
    Users queryUserByPaySerialNumber(String paySerialNumber);
}
