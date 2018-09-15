package com.mimall.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.eclipse.jdt.internal.compiler.batch.Main;

import com.mimall.dao.inter.CategoryDao;
import com.mimall.util.ConnOracle;
import com.mimall.vo.Category;

public class CategoryDaoImpl implements CategoryDao {

	//  1.组合Connection
	private Connection conn;

	public CategoryDaoImpl() {
		//conn = ConnOracleTomcatDataSource.getConnection();
		conn = ConnOracle.getConnection();
	}

	@Override
	public int addCategory(Category category) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "insert into category values(AUTO_INCREMENT_CATEGROY.nextval,?,?)";
	// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
// 默认事务是关闭的 调用addCategory增加一条记录的时候 会自动提交
		// 开启事务

		try {

			// conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0
		
			if (count >= 1) {
				System.out.println("添加商品种类成功!!");
			} else {
				System.out.println("没有添加任何商品种类!");
			}
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加商品种类失败");
			e.printStackTrace();
			
			throw new Exception("商品种类添加失败?");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}

	@Override
	public int deleteCategory(Category category) throws Exception{
		int count = 0;
		// 3.建立通道
		
		String sql = "delete from category where cid=?";
		//  获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, category.getCid());

			System.out.print(count);
			// 4.执行并返回结果集?
			count = pstmt.executeUpdate();//可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
											// DCL或DDL语句 返回值是0
			System.out.print(count);
			if (count >= 1) {
				System.out.println("删除商品种类成功!");
			} else {
				System.out.println("没有删除任何商品种类!");
			}
		} catch (SQLException e) {
			System.out.println("建立通道或删除商品种类失败");
			e.printStackTrace();
			throw new Exception("删除一级商品种类失败!");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}
      System.out.print(count+"nnnnnnnnnnnnn");
		return count;
	}

	@Override
	public int updateCategory(Category category) throws Exception{
		int count = 0;
		// 3.建立通道
		String sql = "update category set cname=?,cdesc=? where cid=?";
		// 获得了一个预编译的通道 相当于IO通道 可以用它来发送sql语句
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getCid());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();// 可以执行除了DQL以外所有的语句 DML 返回的是受影响的行数
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

		return count;
	}

	@Override
	public Category getCategoryById(int id) throws Exception{
		Category category = new Category();

		// 3.建立通道
		String sql = "select * from category where cid="+id;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);

			
			// 4.执行并返回结果集
			rs = pstmt.executeQuery();

			while (rs.next()) {
				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
				category.setCdesc(rs.getString("cdesc"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		
		} finally {
			// 5.关闭
			    
			ConnOracle.closeConnection(rs, pstmt, conn);
			
		}

		return category;
	}

	@Override
	public List<Category> getPageByQuery(String sql) throws Exception {

		List<Category> list = new ArrayList<Category>();
		Category category = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category = new Category();

				category.setCid(rs.getInt("cid"));
				category.setCname(rs.getString("cname"));
				category.setCdesc(rs.getString("cdesc"));

				list.add(category);

			}
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询一级商品种类失败!");
			
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return list;
	}

	@Override
	public int getTotalRecordCount(String sql) throws Exception{
		int totalRecordCount = -1;
		
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
	
	
	
	
	public Category getcategoryidbyname(String sql){
		
 
		
		Category category = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category = new Category();

				category.setCid(rs.getInt(1));
				category.setCname(rs.getString(2));
				category.setCdesc(rs.getString(3));
            
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			
			
			
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(rs, stmt, conn);
		}

		return category;
	}
	
	
	
	
	
}
