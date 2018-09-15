package com.mimall.util;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;

public class JdbcUtil {


    static final String className = "oracle.jdbc.OracleDriver";
    static final String url = "jdbc:oracle:thin:@localhost:1521:orcl";
    static final String user = "mimall";
    static final String password = "123456";

    private static Context context;
    private static DataSource dataSource;

    /**
     * 建立数据库连接
     *
     * @return
     */
    public static Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName(className);
            connection = DriverManager.getConnection(url, user, password);

        } catch (ClassNotFoundException e) {
            System.out.println("can't find oracle driver class");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("connect the database fail");
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 关闭数据库资源
     *
     * @param rs
     * @param stmt
     * @param conn
     */
    public static void closeConnection(ResultSet rs, Statement stmt, Connection conn) {

        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {

                e.printStackTrace();
            }
        }

        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static Connection getConnection2() throws NamingException, SQLException {
        Connection connection;
        context = new InitialContext();
        dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/jdmall");
        connection = dataSource.getConnection();
        return connection;
    }

    public static void main(String[] args) {
        System.out.println(getConnection());
    }

}
