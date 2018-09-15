package com.mimall.dao.impl;


import com.mimall.dao.inter.MiMallOrderDao;
import com.mimall.util.ConnOracle;
import com.mimall.vo.Contain;
import com.mimall.vo.MiMallOrder;
import com.mimall.vo.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MiMallOrderDaoImpl implements MiMallOrderDao {

    Connection connection;
    String sql;
    PreparedStatement preparedStatement;
    Statement statement;
    ResultSet resultSet;

    /**
     * 查询指定用户的所有订单
     *
     * @param phoneNumber
     * @return
     */
    @Override
    public List<MiMallOrder> queryAllMiMallOrderByPhoneNumber(String phoneNumber) {
        String sql = "select * from MIMALLORDER where phoneNumber = ?";
        connection = ConnOracle.getConnection();
        List<MiMallOrder> miMallOrders = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, phoneNumber);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                MiMallOrder miMallOrder = new MiMallOrder();
                String paySerialNumber = resultSet.getString(1);
                Integer orderState = resultSet.getInt(2);
                String payMethod = resultSet.getString(3);
                String createTime = resultSet.getString(4);
                String payOrCancelTime = resultSet.getString(5);
                miMallOrder.setPaySerialNumber(paySerialNumber);
                miMallOrder.setOrderState(orderState);
                miMallOrder.setPayMethod(payMethod);
                miMallOrder.setCreateTime(createTime);
                miMallOrder.setPayOrCancelTime(payOrCancelTime);
                miMallOrder.setPhoneNumber(phoneNumber);
                miMallOrders.add(miMallOrder);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return miMallOrders;
    }

    /**
     * 更新订单状态
     *
     * @param orderState
     * @return
     */
    @Override
    public int updateMiMallOrderState(Integer orderState, String paySerialNumber) {
        String sql = "update miMallOrder set orderstate = ? where paySerialNumber = ?";
        connection = ConnOracle.getConnection();
        int lines = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, orderState);
            preparedStatement.setString(2, paySerialNumber);
            lines = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lines;
    }

    /**
     * 查询所有订单
     *
     * @return
     */
    @Override
    public List<MiMallOrder> queryAllMiMallOrder() {

        String sql = "select * from MIMALLORDER";
        connection = ConnOracle.getConnection();
        List<MiMallOrder> miMallOrders = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                MiMallOrder miMallOrder = new MiMallOrder();
                String paySerialNumber = resultSet.getString(1);
                Integer orderState = resultSet.getInt(2);
                String payMethod = resultSet.getString(3);
                String createTime = resultSet.getString(4);
                String payOrCancelTime = resultSet.getString(5);
                String phoneNumber = resultSet.getString(6);
                miMallOrder.setPaySerialNumber(paySerialNumber);
                miMallOrder.setOrderState(orderState);
                miMallOrder.setPayMethod(payMethod);
                miMallOrder.setCreateTime(createTime);
                miMallOrder.setPayOrCancelTime(payOrCancelTime);
                miMallOrder.setPhoneNumber(phoneNumber);
                miMallOrders.add(miMallOrder);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return miMallOrders;
    }

    /**
     * 通过流水号查询订单
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public MiMallOrder queryMiMallOrderByPaySerialNumber(String paySerialNumber) {
        String sql = "select * from miMallOrder where paySerialNumber = ?";
        MiMallOrder miMallOrder = new MiMallOrder();
        connection = ConnOracle.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paySerialNumber);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                miMallOrder.setPaySerialNumber(paySerialNumber);
                Integer orderState = resultSet.getInt(2);
                String payMethod = resultSet.getString(3);
                String createTime = resultSet.getString(4);
                String payOrCancelTime = resultSet.getString(5);
                String phoneNumber = resultSet.getString(6);
                miMallOrder.setOrderState(orderState);
                miMallOrder.setPayMethod(payMethod);
                miMallOrder.setCreateTime(createTime);
                miMallOrder.setPayOrCancelTime(payOrCancelTime);
                miMallOrder.setPhoneNumber(phoneNumber);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return miMallOrder;
    }

    /**
     * 添加指定一条 miMallOrder记录
     *
     * @param miMallOrder
     * @return
     */
    @Override
    public int insertMiMallOrder(MiMallOrder miMallOrder) {
        String sql = "insert into miMallOrder(paySerialNumber,orderState,payMethod,createTime,payOrCancelTime,phoneNumber) values(?,?,?,?,?,?)";
        connection = ConnOracle.getConnection();
        int lines = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, miMallOrder.getPaySerialNumber());
            preparedStatement.setInt(2, miMallOrder.getOrderState());
            preparedStatement.setString(3, miMallOrder.getPayMethod());
            preparedStatement.setString(4, miMallOrder.getCreateTime());
            preparedStatement.setString(5, miMallOrder.getPayOrCancelTime());
            preparedStatement.setString(6, miMallOrder.getPhoneNumber());
            lines = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lines;
    }

    /**
     * 删除指定的miMallOrder
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public int deleteMiMallOrder(String paySerialNumber) {
        String sql = "delete miMallOrder where paySerialNumber = ?";
        int lines = 0;
        connection = ConnOracle.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paySerialNumber);
            lines = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lines;
    }

    /**
     * 更新指定的miMallOrder
     *
     * @param miMallOrder
     * @return
     */
    @Override
    public int updateMiMallOrder(MiMallOrder miMallOrder) {
        String sql = "update miMallOrder set orderstate = ?,payMethod = ?,createTime = ?,payOrCancelTime = ?,phoneNumber = ? where paySerialNumber = ?";
        int lines = 0;
        connection = ConnOracle.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, miMallOrder.getOrderState());
            preparedStatement.setString(2, miMallOrder.getPayMethod());
            preparedStatement.setString(3, miMallOrder.getCreateTime());
            preparedStatement.setString(4, miMallOrder.getPayOrCancelTime());
            preparedStatement.setString(5, miMallOrder.getPhoneNumber());
            preparedStatement.setString(6, miMallOrder.getPaySerialNumber());
            lines = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lines;
    }

    /**
     * 通过流水号查询其 对应的包含商品的信息
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public List<Contain> queryAllContainByPaySerialNumber(String paySerialNumber) {
        String sql = "select * from contain where paySerialNumber = ?";
        List<Contain> contains = new ArrayList<>();
        connection = ConnOracle.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paySerialNumber);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Contain contain = new Contain();
                int pid = resultSet.getInt(2);
                Integer purchaseNumber = resultSet.getInt(3);
                contain.setPaySerialNumber(paySerialNumber);
                contain.setPid(pid);
                contain.setPurchaseNumber(purchaseNumber);
                contains.add(contain);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contains;
    }

    /**
     * 插入 contain 数据
     *
     * @param contains
     * @return
     */
    @Override
    public int insertContains(List<Contain> contains) {
        int lines = 0;
        String sql = "insert into contain(paySerialNumber,PID,purchaseNumber) values(?,?,?)";
        connection = ConnOracle.getConnection();
        if (contains != null && contains.size() > 0) {
            int insertSuccess = 0;
            for (Contain contain : contains) {
                try {
                    preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, contain.getPaySerialNumber());
                    preparedStatement.setInt(2, contain.getPid());
                    preparedStatement.setInt(3, contain.getPurchaseNumber());
                    insertSuccess = preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                if (insertSuccess == 1) {
                    lines++;
                } else {
                    break;
                }
            }
        }
        return lines;
    }

    /**
     * 删除指定 paySerialNumber订单的 商品
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public int deleteContainsByPaySerialNumber(String paySerialNumber) {
        return 0;
    }

    /**
     * 修改指定的contain
     *
     * @param contain
     * @return
     */
    @Override
    public int updateContain(Contain contain) {
        return 0;
    }

    /**
     * 根据paySerialNumber查询用户
     *
     * @param paySerialNumber
     * @return
     */
    @Override
    public Users queryUserByPaySerialNumber(String paySerialNumber) {
        Users user = new Users();
        String sql = "select PHONENUMBER from miMallOrder where paySerialNumber = ?";
        connection = ConnOracle.getConnection();
        String phoneNumber = null;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, paySerialNumber);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                phoneNumber = resultSet.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (phoneNumber != null && !phoneNumber.isEmpty()) {
            // find it
            sql = "select * from USERS where UPHONE = ?";
            try {
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, phoneNumber);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    user.setUUID(resultSet.getString("UUID"));
                    user.setUPHONE(resultSet.getString("UPHONE"));
                    user.setACCOUNT(resultSet.getString("ACCOUNT"));
                    user.setCOUNTRY(resultSet.getString("COUNTRY"));
                    user.setUAGE(resultSet.getInt("UAGE"));
                    if(resultSet.getString("UEMAIL") != null){
                        user.setUEMAIL(resultSet.getString("UEMAIL").toLowerCase());
                    }
                    user.setULOCK(resultSet.getInt("ULOCK"));
                    user.setUNAME(resultSet.getString("UNAME"));
                    user.setUPASSWORD(resultSet.getString("UPASSWORD"));
                    user.setUSEX(resultSet.getInt("USEX"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return user;
    }


}
