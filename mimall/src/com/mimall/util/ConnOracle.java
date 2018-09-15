package com.mimall.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * 锟斤拷司:锟斤拷锟斤拷锟斤拷锟窖г?
 * 锟斤拷锟斤拷:zhangzy
 * 时锟斤拷:2017锟斤拷8锟斤拷30锟斤拷 锟斤拷锟斤拷9:26:05
 * 锟斤拷锟斤拷:锟斤拷锟斤拷锟斤拷锟捷匡拷墓锟斤拷锟斤拷锟?
 */
public class ConnOracle {

	public static Connection getConnection(){
		Connection conn = null;
		
		String className = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "mimall";
		String password = "123456";
		//1.锟斤拷锟斤拷锟斤拷锟斤拷
		try {
			Class.forName(className);
			
		
		} catch (ClassNotFoundException e) {
			System.out.println("锟斤拷锟斤拷锟斤拷没锟斤拷锟揭碉拷");
			e.printStackTrace();
		}
		
		//2.锟斤拷锟斤拷锟斤拷锟斤拷
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			System.out.println("锟斤拷锟斤拷锟斤拷锟捷匡拷失锟斤拷");
			e.printStackTrace();
		}
		

		
		
		return conn;
	}
	
	public static void closeConnection(ResultSet rs,Statement stmt,Connection conn){
		
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		if(stmt!=null){
			try {
				stmt.close();
			} catch (SQLException e) {
				System.out.println("锟截憋拷通锟斤拷失锟斤拷");
				e.printStackTrace();
			}
		}
		
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("锟截憋拷锟斤拷锟捷匡拷锟斤拷锟斤拷失锟斤拷");
				e.printStackTrace();
			}
		}
		
	}
	
	public static void main(String[] args) {
		System.out.println(ConnOracle.getConnection());
	}
}
