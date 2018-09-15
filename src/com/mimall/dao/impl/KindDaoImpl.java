package com.mimall.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mimall.dao.inter.KindDao;
import com.mimall.util.ConnOracle;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;

public class KindDaoImpl implements KindDao {


	private Connection conn;

	public KindDaoImpl() {

		conn = ConnOracle.getConnection();
	}

	@Override
	public int addCategory2(Kind category) throws Exception{
		int count = 0;
		// 3.关闭
		System.out.print(category.getCname());
		System.out.print(category.getCdesc());
		System.out.print(category.getFid());
		String sql = "insert into kind values(AUTO_INCREMENT_KIND.nextval,?,?,?)";
		
		PreparedStatement pstmt = null;

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category.getCname());
			pstmt.setString(2, category.getCdesc());
			pstmt.setInt(3, category.getFid());
			// 4.执行并返回结果集
			count = pstmt.executeUpdate();
											
		} catch (SQLException e) {
			
			System.out.println("建立通道或添加商品种类失败");
			e.printStackTrace();
			
			throw new Exception("二级商品种类添加失败");
		} finally {
			// 5.关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
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
	
	@Override
	public List<Kind> getPageByQuery(String sql) throws Exception {

		List<Kind> list = new ArrayList<Kind>();
		Kind category2 = null;
		ResultSet rs = null;
		Statement stmt = null;
		// 3.建立通道
		try {
			stmt = conn.createStatement();
			// 4.执行并返回结果集
			rs = stmt.executeQuery(sql);
		
			while (rs.next()) {
				category2 = new Kind();
				category2.setCid(rs.getInt("kid"));
				category2.setCname(rs.getString("kname"));
				category2.setCdesc(rs.getString("kdesc"));
				category2.setFid(rs.getInt("cid"));
				list.add(category2);

			}
			System.out.println("KindDaoImpl >> getPageByQuery>>list: "+list.size());
		} catch (SQLException e) {
			System.out.println("创建通道或查询结果集失败");
			e.printStackTrace();
			
			throw new Exception("查询二级商品种类失败!");
			
		} finally {
			// 5.关闭
			if(conn!=null){
			ConnOracle.closeConnection(rs, stmt, conn);
			}
		}

		return list;
	}
	
	
	
	
	public Kind getCategoryById(Integer cid) throws Exception{
		Kind category2 = new Kind();

		String sql = "select * from kind where kid=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.print(cid+"hellobaby");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cid);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				category2.setCid(rs.getInt(1));
				category2.setCname(rs.getString(2));
				category2.setCdesc(rs.getString(3));
				category2.setFid(rs.getInt(4));
			}

		} catch (SQLException e) {
			System.out.println("建立通道失败");
			e.printStackTrace();
			throw new Exception("查询单个二级商品种类失败");
		} finally {
			
			ConnOracle.closeConnection(rs, pstmt, conn);
		}
	
		return category2;
	}
	
	
	
	public int updatekind(Kind category2) throws Exception{
		int count = 0;
		
		String sql = "update kind set kname=?,kdesc=? where kid=?";
		
		
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, category2.getCname());
			pstmt.setString(2, category2.getCdesc());
			pstmt.setInt(3, category2.getCid());
			
			
			count = pstmt.executeUpdate();

			if (count >= 1) {
				System.out.println("更新二级商品种类成功!");
			} else {
				System.out.println("更新失败!");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			
		} finally {
			// 5.关闭连接
			ConnOracle.closeConnection(null, pstmt, conn);
		}

		return count;
	}
	
	
	public int deletekind(Kind category2) throws Exception{
		int count = 0;
		
		
		String sql = "delete from kind where kid=?";
	
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, category2.getCid());

			System.out.print(count);
		
			count = pstmt.executeUpdate();

			System.out.print(count);
			if (count >= 1) {
				System.out.println("删除二级商品种类成功");
			} else {
				System.out.println("删除失败!");
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
			
		} finally {
			// 5.连接关闭
			ConnOracle.closeConnection(null, pstmt, conn);
		}
     
		return count;
	}

	
	
}
