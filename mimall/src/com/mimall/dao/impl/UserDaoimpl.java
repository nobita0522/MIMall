package com.mimall.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.User;

import com.mimall.dao.inter.UserDao;
import com.mimall.util.ConnOracle;
import com.mimall.vo.Users;

public class UserDaoimpl implements UserDao{
	
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	
	public UserDaoimpl() {
		conn = ConnOracle.getConnection();
	}

	@Override
	public int addUser(Users user) throws Exception  {
		String sql = "INSERT INTO USERS(UUID,UPHONE, UAGE, UEMAIL,UPASSWORD, UNAME, ACCOUNT) VALUES (AUTO_INCREMENT_USER.nextval,?,?,?,?,?,?)";
		int count = 0;
		try {
			stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, user.getUPHONE());
			stmt.setInt(2, user.getUAGE());
			stmt.setString(3, user.getUEMAIL());
			
			if(user.getUPASSWORD() == null){
				StringBuffer password = new StringBuffer();
				int i = 0;
				while(i++<16){
					char c = (char)((int)(Math.random()*(126-48)+48));
					password.append(c);
				}
				System.out.println(password.toString()+"<<passwprd");
				stmt.setString(4, password.toString());
			}else{
				System.out.println(user.getUPASSWORD()+"<<");
				stmt.setString(4, user.getUPASSWORD());
			}
			stmt.setString(5, user.getUNAME());
			stmt.setString(6, user.getACCOUNT());	
			
			count = stmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("创建用户建立通道失败");
			e.printStackTrace();
			throw new Exception("添加用户失败");
		}finally {
			ConnOracle.closeConnection(rs, stmt, conn);
		}
		return count;
	}

	
	/**
	 * 修改用户数据
	 */
	@Override
	public int updateUser(Users user) throws Exception  {
		
		int count = 0;
		try {
			stmt = conn.prepareStatement("UPDATE TABLE USERS SET ULOCK = ? , ADMIN = ? WHERE UUID = ?");
			stmt.setInt(1, user.getULOCK());
			stmt.setInt(2, user.getADMIN());
			stmt.setString(3, user.getUUID());
			count = stmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			ConnOracle.closeConnection(rs, stmt, conn);
		}
		return count;
	}

	
	/**
	 * 根据用户ID查数据
	 */
	@Override
	public Users queryUserById(int id) throws Exception  {
		
		String sql = "SELECT * FROM USERS WHERE UUID = ?";
		Users user = null;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs.next()){
				user = new Users();
				user.setUUID(rs.getString("UUID"));
				user.setUPHONE(rs.getString("UPHONE"));
				user.setACCOUNT(rs.getString("ACCOUNT"));
				user.setCOUNTRY(rs.getString("COUNTRY"));
				user.setUAGE(rs.getInt("UAGE"));
				if(rs.getString("UEMAIL") != null){
				user.setUEMAIL(rs.getString("UEMAIL").toLowerCase());
				}
				user.setULOCK(rs.getInt("ULOCK"));
				user.setUNAME(rs.getString("UNAME"));
				user.setUPASSWORD(rs.getString("UPASSWORD"));
				user.setUSEX(rs.getInt("USEX"));	
				user.setADMIN(rs.getInt("ADMIN"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnOracle.closeConnection(rs, stmt, conn);
		}
		
		return user;
	}

	
	/**
	 * 根据用户名查数据
	 */
	@Override
	public Users queryUserByName(Users user) throws Exception {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM USERS WHERE(");
		
		if(user.getUPHONE() != null){
			sql.append("UPHONE= '" + user.getUPHONE() +"'");
		}
		if(user.getUNAME() != null){
			sql.append("OR UNAME = '"+user.getUNAME()+"'");
		}
		if(user.getUUID() != null){
			sql.append("OR UUID = '" + user.getUUID() +"'" );
		}
		if(user.getUEMAIL() != null){
			sql.append("OR UEMAIL = '" + user.getUEMAIL().toLowerCase() +"'" );
		}
		
		sql.append(")");
		
		if(user.getUPASSWORD() != null){
			sql.append("AND UPASSWORD = '"+ user.getUPASSWORD() +"'");
		}
		
		System.out.println(sql);
		
		int count = 0;
		Users newUser = new Users();
		try {
			Statement stm = conn.createStatement();
			rs = stm.executeQuery(sql.toString());			
			if(rs.next()){
				newUser.setUUID(rs.getString("UUID"));
				newUser.setUPHONE(rs.getString("UPHONE"));
				newUser.setACCOUNT(rs.getString("ACCOUNT"));
				newUser.setCOUNTRY(rs.getString("COUNTRY"));
				newUser.setUAGE(rs.getInt("UAGE"));
				if(rs.getString("UEMAIL") != null){
				newUser.setUEMAIL(rs.getString("UEMAIL").toLowerCase());
				}
				newUser.setULOCK(rs.getInt("ULOCK"));
				newUser.setUNAME(rs.getString("UNAME"));
				newUser.setUPASSWORD(rs.getString("UPASSWORD"));
				newUser.setUSEX(rs.getInt("USEX"));	
				newUser.setADMIN(rs.getInt("ADMIN"));
			}
			
		} catch (SQLException e) {
			System.out.println("建立通道或查询用户是否存在失败");
			e.printStackTrace();			
			throw new Exception("查询用户是否存在失败?");

		}finally{
			ConnOracle.closeConnection(rs, stmt, conn);
		}
		return newUser;
	}


	@Override
	public List<Users> getPageByQuery(String sql) throws Exception {
		List<Users> list = new ArrayList<>();
		Statement stm = null;
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			while(rs.next()) {
				Users user = new Users();
				user.setACCOUNT(rs.getString("ACCOUNT"));
				user.setADMIN(rs.getInt("ADMIN"));
				user.setCOUNTRY(rs.getString("COUNTRY"));
				user.setUAGE(rs.getInt("UAGE"));
				user.setUEMAIL(rs.getString("UEMAIL"));
				user.setULOCK(rs.getInt("ULOCK"));
				user.setUNAME(rs.getString("UNAME"));
				user.setUPASSWORD(rs.getString("UPASSWORD"));
				user.setUPHONE(rs.getString("UPHONE"));
				user.setUSEX(rs.getInt("USEX"));
				user.setUUID(rs.getString("UUID"));
				
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnOracle.closeConnection(rs, stm, conn);
		}
		return list;
	}

	@Override
	public int getTotalRecordCount(String sql) throws Exception {
		int count = 0;
		Statement stm  = null;
		try {
			stm = conn.createStatement();
			rs = stm.executeQuery(sql);
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			ConnOracle.closeConnection(rs, stm, conn);
		}
		return count;
	}


}
