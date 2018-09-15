package com.mimall.vo;

public class shoppingcart {

	private String UUID ; //灏忕背ID
	private String UPHONE; //鎵嬫満
	private String UPASSWORD; //瀵嗙爜
	private String UEMAIL; //閭
	private int  UAGE; //骞撮緞
	private String UNAME; // 鐢ㄦ埛鍚�
	private int  USEX ;//鎬у埆  DEFAULT 0,
	private String COUNTRY;//鍥界睄  DEFAULT '涓浗',
	private Integer ULOCK; //鐢ㄦ埛閿�
	private String ACCOUNT;
	
	
	
	
	private Integer PID; /*浜у搧id*/
	private String FACTORYID; /*浜у搧宸ュ巶鍙�*/
	private String PNAME; /*浜у搧鍚�*/
	private String PDESC; /*浜у搧鎻忚堪*/
	private String IMAGE1; /*浜у搧鍥剧墖1*/
	private String IMAGE2;
	private String IMAGE3;
	private String IMAGE4;
	private int INVENTORY;/*浜у搧搴撳瓨*/
	private double ORIGINALPRICE;/*浜у搧鍘熶环*/
	private double NEWPRICE; /*浜у搧鐜颁环*/
	private String PCOLOR; /*浜у搧棰滆壊*/
	private String VERSION; /*浜у搧鐗堟湰*/
	private Integer ONSALE; /*鏄惁涓婃灦*/
	private int KID; /*浜岀骇鑿滃崟鍙�*/
	
	
	private int cartcount;
	
	public int getCartcount() {
		return cartcount;
	}

	public void setCartcount(int cartcount) {
		this.cartcount = cartcount;
	}
	
	
	

	@Override
	public String toString() {
		return "shoppingcart [UUID=" + UUID + ", UNAME=" + UNAME + ", PID=" + PID + ", PNAME=" + PNAME + ", PDESC="
				+ PDESC + ", NEWPRICE=" + NEWPRICE + ", cartcount=" + cartcount + "]";
	}
	
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
	public Integer getULOCK() {
		return ULOCK;
	}
	public void setULOCK(Integer uLOCK) {
		ULOCK = uLOCK;
	}
	public String getACCOUNT() {
		return ACCOUNT;
	}
	public void setACCOUNT(String aCCOUNT) {
		ACCOUNT = aCCOUNT;
	}
	public Integer getPID() {
		return PID;
	}
	public void setPID(Integer pID) {
		PID = pID;
	}
	public String getFACTORYID() {
		return FACTORYID;
	}
	public void setFACTORYID(String fACTORYID) {
		FACTORYID = fACTORYID;
	}
	public String getPNAME() {
		return PNAME;
	}
	public void setPNAME(String pNAME) {
		PNAME = pNAME;
	}
	public String getPDESC() {
		return PDESC;
	}
	public void setPDESC(String pDESC) {
		PDESC = pDESC;
	}
	public String getIMAGE1() {
		return IMAGE1;
	}
	public void setIMAGE1(String iMAGE1) {
		IMAGE1 = iMAGE1;
	}
	public String getIMAGE2() {
		return IMAGE2;
	}
	public void setIMAGE2(String iMAGE2) {
		IMAGE2 = iMAGE2;
	}
	public String getIMAGE3() {
		return IMAGE3;
	}
	public void setIMAGE3(String iMAGE3) {
		IMAGE3 = iMAGE3;
	}
	public String getIMAGE4() {
		return IMAGE4;
	}
	public void setIMAGE4(String iMAGE4) {
		IMAGE4 = iMAGE4;
	}
	public int getINVENTORY() {
		return INVENTORY;
	}
	public void setINVENTORY(int iNVENTORY) {
		INVENTORY = iNVENTORY;
	}
	public double getORIGINALPRICE() {
		return ORIGINALPRICE;
	}
	public void setORIGINALPRICE(double oRIGINALPRICE) {
		ORIGINALPRICE = oRIGINALPRICE;
	}
	public double getNEWPRICE() {
		return NEWPRICE;
	}
	public void setNEWPRICE(double nEWPRICE) {
		NEWPRICE = nEWPRICE;
	}
	public String getPCOLOR() {
		return PCOLOR;
	}
	public void setPCOLOR(String pCOLOR) {
		PCOLOR = pCOLOR;
	}
	public String getVERSION() {
		return VERSION;
	}
	public void setVERSION(String vERSION) {
		VERSION = vERSION;
	}
	public Integer getONSALE() {
		return ONSALE;
	}
	public void setONSALE(Integer oNSALE) {
		ONSALE = oNSALE;
	}
	public int getKID() {
		return KID;
	}
	public void setKID(int kID) {
		KID = kID;
	}
	
}
