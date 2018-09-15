package com.mimall.vo;

public class Product {
	private Integer PID; /*产品id*/
	private String FACTORYID; /*产品工厂号*/
	private String PNAME; /*产品名*/
	private String PDESC; /*产品描述*/
	private String IMAGE1; /*产品图片1*/
	private String IMAGE2;
	private String IMAGE3;
	private String IMAGE4;
	private int INVENTORY;/*产品库存*/
	private double ORIGINALPRICE;/*产品原价*/
	private double NEWPRICE; /*产品现价*/
	private String PCOLOR; /*产品颜色*/
	private String VERSION; /*产品版本*/
	private Integer ONSALE; /*是否上架*/
	private int KID; /*二级菜单号*/
	
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
	public int getKID() {
		return KID;
	}
	public void setKID(int kID) {
		KID = kID;
	}
	
	
	
	public Integer getONSALE() {
		return ONSALE;
	}
	public void setONSALE(Integer oNSALE) {
		ONSALE = oNSALE;
	}
	@Override
	public String toString() {
		return "Product [PID=" + PID + ", FACTORYID=" + FACTORYID + ", PNAME=" + PNAME + ", PDESC=" + PDESC
				+ ", IMAGE1=" + IMAGE1 + ", IMAGE2=" + IMAGE2 + ", IMAGE3=" + IMAGE3 + ", IMAGE4=" + IMAGE4
				+ ", INVENTORY=" + INVENTORY + ", ORIGINALPRICE=" + ORIGINALPRICE + ", NEWPRICE=" + NEWPRICE
				+ ", PCOLOR=" + PCOLOR + ", VERSION=" + VERSION + ", KID=" + KID + "]";
	}
	
	
}
