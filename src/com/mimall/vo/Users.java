package com.mimall.vo;

public class Users {
	private String UUID ; //小米ID
	private String UPHONE; //手机
	private String UPASSWORD; //密码
	private String UEMAIL; //邮箱
	private int  UAGE; //年龄
	private String UNAME; // 用户名
	private int  USEX ;//性别  DEFAULT 0,
	private String COUNTRY;//国籍  DEFAULT '中国',
	private Integer ULOCK; //用户锁
	private String ACCOUNT;//账户
	
	
	public String getUUID() {
		return UUID;
	}
	public void setUUID(String uUID) {
		UUID = uUID;
	}
	public String getUPHONE() {
		return UPHONE;
	}
	public void setUPHONE(String uPHONE) {
		UPHONE = uPHONE;
	}
	public String getUPASSWORD() {
		return UPASSWORD;
	}
	public void setUPASSWORD(String uPASSWORD) {
		UPASSWORD = uPASSWORD;
	}
	public String getUEMAIL() {
		return UEMAIL;
	}
	public void setUEMAIL(String uEMAIL) {
		UEMAIL = uEMAIL;
	}
	public int getUAGE() {
		return UAGE;
	}
	public void setUAGE(int uAGE) {
		UAGE = uAGE;
	}
	public String getUNAME() {
		return UNAME;
	}
	public void setUNAME(String uNAME) {
		UNAME = uNAME;
	}
	public int getUSEX() {
		return USEX;
	}
	public void setUSEX(int uSEX) {
		USEX = uSEX;
	}
	public String getCOUNTRY() {
		return COUNTRY;
	}
	public void setCOUNTRY(String cOUNTRY) {
		COUNTRY = cOUNTRY;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public Integer getULOCK() {
		return ULOCK;
	}
	public void setULOCK(Integer uLOCK) {
		ULOCK = uLOCK;
	}
	@Override
	public String toString() {
		return "Users [UUID=" + UUID + ", UPHONE=" + UPHONE + ", UPASSWORD=" + UPASSWORD + ", UEMAIL=" + UEMAIL
				+ ", UAGE=" + UAGE + ", UNAME=" + UNAME + ", USEX=" + USEX + ", COUNTRY=" + COUNTRY + ", ULOCK=" + ULOCK
				+ ", ACCOUNT=" + ACCOUNT + "]";
	}
	
	
	
	 

}
