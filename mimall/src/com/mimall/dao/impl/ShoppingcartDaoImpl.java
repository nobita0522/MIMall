package com.mimall.dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mimall.dao.inter.ShoppingcartDao;
import com.mimall.util.ConnOracle;
import com.mimall.vo.Category;
import com.mimall.vo.shoppingcart;

public class ShoppingcartDaoImpl implements ShoppingcartDao{
	
	private Connection conn;

	public ShoppingcartDaoImpl() {
		//conn = ConnOracleTomcatDataSource.getConnection();
		conn = ConnOracle.getConnection();
	}
	 
	 
	 
	 public List<shoppingcart> getshoppingcartinfo(String uuid) throws Exception{
		 List<shoppingcart> shoppingcart1=new ArrayList<shoppingcart>();
			

			// 3.建立通道
			String sql = "select   users.uuid,users.uname,PRODUCT.pid,PRODUCT.PNAME,product.image1,product.pdesc,product.newprice,shoppingcart.cartcount from users,PRODUCT,SHOPPINGCART where users.uuid=SHOPPINGCART.UUID and SHOPPINGCART.pid=PRODUCT.PID and shoppingcart.uuid='" + uuid + "'";

			Statement pstmt = null;
			ResultSet rs = null;
			try {
				pstmt = conn.createStatement();

				
				// 4.执行并返回结果集
				rs = pstmt.executeQuery(sql);

				while (rs.next()) {
					shoppingcart sp = new shoppingcart();
					sp.setUUID(rs.getString("UUID"));
					sp.setUNAME(rs.getString("UNAME"));
					sp.setPID(rs.getInt("PID"));
					sp.setPNAME(rs.getString("PNAME"));
					sp.setIMAGE1(rs.getString("IMAGE1"));
					sp.setPDESC(rs.getString("PDESC"));
					sp.setNEWPRICE(rs.getDouble("NEWPRICE"));
					sp.setCartcount(rs.getInt("CARTCOUNT"));
					shoppingcart1.add(sp);
				   
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			
			} finally {
				// 5.关闭
				    
				ConnOracle.closeConnection(rs, pstmt, conn);
				
			}
          
			return shoppingcart1;
		}
	 
	 
	 
	 
	 
	 
	 public void addintoshoppingcartinfo(String uuid,int pid,int cartcount) throws Exception{
			int count = 0;
			// 3.建立通道
			String sql = "insert into shoppingcart values(?,?,?)";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
			PreparedStatement pstmt = null;
	// 默认事务是关闭的 调用addCategory增加一条记录的时候 会自动提交
			// 开启事务

			try {

				// conn.setAutoCommit(false);
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1,uuid);
				pstmt.setInt(2, pid);
				pstmt.setInt(3, cartcount);
				// 4.执行并返回结果集
				count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
												// DCL或DDL语句 返回值是0
			
				if (count >= 1) {
					System.out.println("添加商品到购物车成功!!");
				} else {
					System.out.println("没有添加任何商品到购物车!");
				}
			} catch (SQLException e) {
				
				System.out.println("建立通道或添加商品种类失败");
				e.printStackTrace();
				
				throw new Exception("商品添加到购物车失败?");
			} finally {
				// 5.关闭
				ConnOracle.closeConnection(null, pstmt, conn);
			}

		
		}
	 
	 
	 
	 
	 
	  public void deleteshoppingcartByuuIdandpid(String uuid,int pid) throws Exception{
		  int count = 0;
			// 3.建立通道
			
			String sql = "delete from shoppingcart where uuid='" + uuid + "' and pid="+pid;
			//  获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
			PreparedStatement pstmt = null;
			try {
				pstmt = conn.prepareStatement(sql);
				
			

				System.out.print(count);
				// 4.执行并返回结果集?
				count = pstmt.executeUpdate();//可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
												// DCL或DDL语句 返回值是0
				System.out.print(count);
				if (count >= 1) {
					System.out.println("删除购物车单条记录成功!");
				} else {
					System.out.println("没有删除任何购物车记录!");
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			
			} finally {
				// 5.关闭
				ConnOracle.closeConnection(null, pstmt, conn);
			}
	     
			
	  }
	 
	 
	  
	  
	  public int getcartcountbyuuidandpid(String uuid,int pid) throws Exception{
		 
				int totalRecordCount = 0;
				String sql="select count(*) from shoppingcart where uuid='" + uuid + "' and pid="+pid;
				ResultSet rs = null;
				Statement stmt = null;
				// 3.建立通道
				try {
					stmt = conn.createStatement();
					// 4.执行并返回结果集
					rs = stmt.executeQuery(sql);
				
					while (rs.next()) {
						
						totalRecordCount = rs.getInt(1);
					}
				} catch (SQLException e) {
					System.out.println("创建通道或查询结果集失败");
					e.printStackTrace();
					
					throw new Exception("查询总共有多少条记录失败!");
					
				} finally {
					// 5.关闭
					ConnOracle.closeConnection(rs, stmt, conn);
				}

				return totalRecordCount;
			
			
	  }
	  
	  
	  
	  
		 public void updatecartcountbypidanduuid(String uuid,int pid,int cartcount1) throws Exception{
			
				int count=0;
					// 3.建立通道
					String sql = "update shoppingcart set cartcount =cartcount+?where uuid='" + uuid + "' and pid="+pid;
					// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
					PreparedStatement pstmt = null;
					try {
						pstmt = conn.prepareStatement(sql);
                        System.out.println(cartcount1+"增加的数量");
						pstmt.setInt(1, cartcount1);
						
						// 4.执行并返回结果集
						count=pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
														// DCL或DDL语句 返回值是0

						if (count >= 1) {
							System.out.println("修改商品种类成功!");
						} else {
							System.out.println("没有修改任何商品种类!");
						}
					} catch (SQLException e) {
						System.out.println("建立通道或修改商品种类失败");
						e.printStackTrace();
						throw new Exception("修改一级商品种类失败!");
					} finally {
						// 5.关闭
						ConnOracle.closeConnection(null, pstmt, conn);
					}

					

		 }
	  
	  
	 
}
