

package com.mimall.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mimall.dao.inter.ProductDao;
import com.mimall.util.ConnOracle;
import com.mimall.vo.Product;

public class ProductDaoImpl implements ProductDao {

	// 组合Connection对象
	private Connection conn;

	public ProductDaoImpl() {
		conn = ConnOracle.getConnection();
	}

	@Override
	public int addProduct(Product product) throws Exception {
		// 刚刚插入的商品处于"下架"状态 所以onsale 的值为0 1 表示上架 0 表示下架
		String sql = "INSERT  INTO  PRODUCT(PID, FACTORYID, PNAME, PDESC, IMAGE1, "+
				"IMAGE2, IMAGE3, IMAGE4, INVENTORY, ORIGINALPRICE, NEWPRICE, PCOLOR, "+
				"VERSION, ONSALE,KID) VALUES (AUTO_INCREMENT_PRODUCT.nextval,?,?,?,?,?,?,?,?,?,?,?,?,0,?)";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getFACTORYID());
			pstmt.setString(2, product.getPNAME());
			pstmt.setString(3, product.getPDESC());
			pstmt.setString(4, product.getIMAGE1());
			pstmt.setString(5, product.getIMAGE2());
			pstmt.setString(6, product.getIMAGE3());
			pstmt.setString(7, product.getIMAGE4());
			pstmt.setInt(8, product.getINVENTORY());
			pstmt.setDouble(9, product.getORIGINALPRICE());
			pstmt.setDouble(10, product.getNEWPRICE());
			pstmt.setString(11, product.getPCOLOR());
			pstmt.setString(12, product.getVERSION());
			pstmt.setInt(13, product.getKID());		
			// 四.执行并返回结果集
			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("添加商品失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;

	}

	@Override
	public int deleteProduct(Product product) throws Exception {
		String sql = "delete from product where pid=?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		int count;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product.getPID());

			// 四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("删除商品成功!");
			} else {
				System.out.println("没有删除任何商品!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("删除商品失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(null, pstmt, conn);

		}

		return count;

	}

	public int updateProduct(Product product) throws Exception{
		
		String sql = "UPDATE PRODUCT SET FACTORYID=?, PNAME=?, PDESC=?, IMAGE1=?, "+
				"IMAGE2=?, IMAGE3=?, IMAGE4=?, INVENTORY=?, ORIGINALPRICE=?, NEWPRICE=?, PCOLOR=?, "+
				"VERSION=?, ONSALE=?,KID=? WHERE PID = ?";
		
		PreparedStatement pstmt = null;
		//三.建立通道
		int count = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getFACTORYID());
			pstmt.setString(2, product.getPNAME());
			pstmt.setString(3, product.getPDESC());
			pstmt.setString(4, product.getIMAGE1());
			pstmt.setString(5, product.getIMAGE2());
			pstmt.setString(6, product.getIMAGE3());
			pstmt.setString(7, product.getIMAGE4());
			pstmt.setInt(8, product.getINVENTORY());
			pstmt.setDouble(9, product.getORIGINALPRICE());
			pstmt.setDouble(10, product.getNEWPRICE());
			pstmt.setString(11, product.getPCOLOR());
			pstmt.setString(12, product.getVERSION());
			pstmt.setInt(13, product.getONSALE());
			pstmt.setInt(14, product.getKID());		
			pstmt.setInt(15, product.getPID());		
			count = pstmt.executeUpdate();

			//四.执行并返回结果集
			count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			if (count >= 1) {
				System.out.println("修改商品成功!");
			} else {
				System.out.println("没有修改任何商品!");
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改商品失败");
		} finally {
			//五.关闭
			ConnOracle.closeConnection(null, pstmt, conn);

		}
		
		return count;

	}

	public Product getProductById(Integer pid) throws Exception {
		Product product = new Product();

		String sql = "select * from product where pid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pid);

			// 四.执行并返回结果集
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product.setPID(rs.getInt("PID"));
				product.setFACTORYID(rs.getString("FACTORYID"));
				product.setPNAME(rs.getString("PNAME"));
				product.setPDESC(rs.getString("PDESC"));
				product.setIMAGE1(rs.getString("IMAGE1"));
				product.setIMAGE2(rs.getString("IMAGE2"));
				product.setIMAGE3(rs.getString("IMAGE3"));
				product.setIMAGE4(rs.getString("IMAGE4"));
				product.setINVENTORY(rs.getInt("INVENTORY"));
				product.setORIGINALPRICE(rs.getDouble("ORIGINALPRICE"));
				product.setNEWPRICE(rs.getDouble("NEWPRICE"));
				product.setPCOLOR(rs.getString("PCOLOR"));
				product.setVERSION(rs.getString("VERSION"));
				product.setONSALE(rs.getInt("ONSALE"));
				product.setKID(rs.getInt("KID"));
			}
			

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单一商品失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, pstmt, conn);
		}
		return product;
	}

	// 五.按SQL语句查
	public List<Product> getPageByQuery(String sql) throws Exception {
		Statement pstmt = null;
		ResultSet rs = null;

		List<Product> list = new ArrayList<Product>();

		Product product = null;

		// 三.建立通道
		try {
			pstmt = conn.createStatement();
			// 四.执行并返回结果集
			rs = pstmt.executeQuery(sql);

			while (rs.next()) {
				product = new Product();
				product.setPID(rs.getInt("PID"));
				product.setFACTORYID(rs.getString("FACTORYID"));
				product.setPNAME(rs.getString("PNAME"));
				product.setPDESC(rs.getString("PDESC"));
				product.setIMAGE1(rs.getString("IMAGE1"));
				product.setIMAGE2(rs.getString("IMAGE2"));
				product.setIMAGE3(rs.getString("IMAGE3"));
				product.setIMAGE4(rs.getString("IMAGE4"));
				product.setINVENTORY(rs.getInt("INVENTORY"));
				product.setORIGINALPRICE(rs.getDouble("ORIGINALPRICE"));
				product.setNEWPRICE(rs.getDouble("NEWPRICE"));
				product.setPCOLOR(rs.getString("PCOLOR"));
				product.setVERSION(rs.getString("VERSION"));
				product.setONSALE(rs.getInt("ONSALE"));
				product.setKID(rs.getInt("KID"));
				list.add(product);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败!");
			e.printStackTrace();
			throw new Exception("查询商品失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(rs, pstmt, conn);
		}

		return list;
	}

	public int getTotalRecordSum(String sql) throws Exception {
		int totalRecordSum = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				totalRecordSum = rs.getInt(1);
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询商品数量失败!");
		} finally {

			ConnOracle.closeConnection(rs, pstmt, conn);
		}

		return totalRecordSum;
	}
	
	public void updateProductImageNames(Product product) throws Exception{
		String sql = "UPDATE PRODUCT SET IMAGE1 =?, IMAGE2=?, IMAGE3 = ?, IMAGE4=? WHERE PID = ?";
		PreparedStatement pstmt = null;
		// 三.建立通道
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product.getIMAGE1());
			pstmt.setString(2, product.getIMAGE2());
			pstmt.setString(3, product.getIMAGE3());
			pstmt.setString(4, product.getIMAGE4());	
			pstmt.setInt(5, product.getPID());
			
			System.out.println(">>imag1:"+product.getIMAGE1());
			System.out.println(">>imag2:"+product.getIMAGE2());
			System.out.println(">>imag3:"+product.getIMAGE3());
			System.out.println(">>imag4:"+product.getIMAGE4());
			// 四.执行并返回结果集
			int count = pstmt.executeUpdate();// 执行dml 或 ddl语句的 返回受影响的行数
			
		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("修改商品图片失败");
		} finally {
			// 五.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

	}

}
