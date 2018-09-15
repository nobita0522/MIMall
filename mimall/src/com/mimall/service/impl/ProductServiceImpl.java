package com.mimall.service.impl;

import java.io.File;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mimall.dao.impl.ProductDaoImpl;
import com.mimall.dao.inter.ProductDao;
import com.mimall.util.SQLUtil;
import com.mimall.vo.Product;
import com.page.PageInfo;
import com.mimall.service.inter.ProductService;

public class ProductServiceImpl implements ProductService{

	private ProductDao dao;
	
	public ProductServiceImpl(){
		
		dao = new ProductDaoImpl();	
	}
	
	public int addProduct(Product product) throws Exception{
		
		int count = dao.addProduct(product);
		return count;
	}
	
	@Override
	public int deleteProductById(String pid) throws Exception {
		Product product = new Product();
		product.setPID(new Integer(pid));
		int count = dao.deleteProduct(product);
		return count;
	}
	
	@Override
	public int getTotalRecordSum() throws Exception {
		String sql = "select count(*) as totalRecordSum from product";

		int totalRecordSum = 0;

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
	}
	
	@Override
	public int updateProduct(Product product) throws Exception{

		int count = dao.updateProduct(product);
		return count;
	}
	
	@Override
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "select * from (select c.*,rownum r from product c order by pid asc) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql);
		List<Product> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	@Override
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo) throws Exception{
		List<Product> list = null;

		// String sql =
				// "select * from (select c.*,rownum r from category c where 1=1 and cname='商品种类名称' or cdesc like '%商品种类描述%') where r>=1 and r<=5";

		StringBuilder sb = new StringBuilder(
				"select * from (select c.*,rownum r from product c where 1=1");

		String factoryId = product.getFACTORYID();
		String pName = product.getPNAME();
		String PDESC = product.getPDESC();
		Integer onSale = product.getONSALE();
		Integer kid = product.getKID();
		
		if (factoryId != null && !factoryId.trim().equals("")) {
			sb.append(" and FACTORYID='");
			sb.append(factoryId);
			sb.append("'");
		}
		
		if (pName != null && !pName.trim().equals("")) {
				
			sb.append(" and (pname='");
			sb.append(pName);
			sb.append("' or pdesc = '%");
			sb.append(PDESC);
			sb.append("%')");
		}
		
		if (onSale != null) {
			sb.append(" or ONSALE = ");
			sb.append(onSale);
		}
		
		if (kid != 0) {
			sb.append(" and kid=");
			sb.append(kid);				
		}
		
			
		

		sb.append(" order by pid asc) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());

		
		String sql = sb.toString();
		System.out.println(sql);
		list = dao.getPageByQuery(sql);
		return list;
	}
	
	@Override
	public int getTotalRecordSumBySearchCondition(Product product) throws Exception {
		int totalRecordSum = 0;
		StringBuilder sb = new StringBuilder(
				"select count(*) as totalRecordSum from product where 1=1");

/*SELECT COUNT(*) AS totalRecordSum FROM PRODUCT WHERE (PNAME ='红米note3' OR PDESC='%红米%') AND (ONSALE = 0 OR KID = 0);*/

		
		// select count(*) as totalRecordSum from category where 1=1 and
				// cname='商品种类描述' or cdesc like '%商品种类描述%'
		String pname = product.getPNAME();
		String pdesc = product.getPDESC();
		Integer onsale = product.getONSALE();		
		Integer kid = product.getKID();

		if (pname != null && !pname.trim().equals("")) {
			sb.append(" and (pname='");
			sb.append(pname);
			sb.append("' or pdesc = '%");
			sb.append(pdesc);
			sb.append("%')");
		}
		
		if (onsale != null) {
			sb.append(" or onsale=");
			sb.append(onsale);
			
		}
		
		if (kid != 0) {
			sb.append(" and kid=");
			sb.append(kid);			
		}

		String sql = sb.toString();
		System.out.println(sql);

		totalRecordSum = dao.getTotalRecordSum(sql);

		return totalRecordSum;
	}
	
	//产品上架
	public void productUp(Integer pid) throws Exception{
		String sql = "update product set onsale=1 where pid=" + pid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		try {
			sqlUtil.executeExceptDQL(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("上架失败");
		}
			
	}
	
	//??????
	public void productDown(Integer pid) throws Exception{
		String sql = "update product set onsale=0 where pid=" + pid;
		System.out.println(sql);
		SQLUtil sqlUtil = new SQLUtil();
		try {
			sqlUtil.executeExceptDQL(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("下架失败");
		}
				
	}
	
	@Override
	public Product getProductById(String pid) throws Exception{
		Product product = null;
		product = dao.getProductById(new Integer(pid));
		return product;
	}
	
	@Override
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception{
		String pid = "";

		DiskFileItemFactory itemFactory = new DiskFileItemFactory();
		// 设置内存缓冲区的阀值为512K
		itemFactory.setSizeThreshold(0x80000);
		
		request.getServletPath();

		File tempDir = new File("/tmpimg");
		if (!tempDir.exists()) {
			tempDir.mkdirs();
			tempDir.getPath();
		}
		System.out.println(">>path:"+tempDir.getAbsolutePath());
		// 设置临时存储文件的目录为D:\\temp
		itemFactory.setRepository(tempDir);

		ServletFileUpload fileUpload = new ServletFileUpload(itemFactory);
		//设置上传文件的最大数据量为10M
		fileUpload.setSizeMax(0xA00000);

		//解析上传文件流，得到FileItem对象的列表
		List<String> fileNameList = new ArrayList<String>();// 存文件名

		try {
			List<FileItem> fileItems = fileUpload.parseRequest(request);
			System.out.println("size=" + fileItems.size());
			Iterator<FileItem> it = fileItems.iterator();

			boolean flag = true;//一个产品的图片  放到一个文件夹 为了保证86行只执行一次
			
			while (it.hasNext()) {
					

				FileItem item = it.next();
				// 判断是否是文件域
				if (!item.isFormField()) {
					System.out.println("是文件");


					String name = item.getName();

					long size = item.getSize();

					if ((name == null || name.equals("")) && size == 0) {
						fileNameList.add("");
						continue;
					}

					System.out.println("name=" + item.getName());
					System.out.println("size=" + item.getSize());

					// 保存上传的文件到指定的目录
					if(flag){
						
					/*	productListUploadPath = productListUploadPath + "\\product" + pid; //只执行一次
					productListUploadPath = request.getServletContext().getRealPath("/") + "\\product" + pid; //只执行一次
					*/	
						
					productListUploadPath = "C:\\Users\\Michael Trojane\\eclipse-workspace\\mimall1.4.zip_expanded\\mimall\\WebRoot"+productListUploadPath + "\\product" + pid; //只执行一次
						
					//productListUploadPath = request.getServletContext().getRealPath("/") + "product" + pid; //只执行一次
						flag = false;
					}
					
					File uploadFileDir = new File(productListUploadPath);
					System.out.println("uploadFileDir=" + uploadFileDir);
					if (!uploadFileDir.exists()) {
						uploadFileDir.mkdirs();
					}
					System.out.println(">>path:"+uploadFileDir.getAbsolutePath());

					// 如果浏览器传送的文件名是全路径名，则取出文件名
					// 图片本身的名字_当前时间距离1970年毫秒数_随机数1_随机数2
					// d:\\......\\1.jpg
					int index = name.lastIndexOf(File.separator);
					if (index > 0) {
						name = name.substring(index + 1, name.length());
					}

					// 解决同名文件覆盖问题:随机生成一个 唯一 的名字 用来替换上传文件的名字即可
					System.out.println("*********look here*********");

					long currentTime = System.currentTimeMillis();

					Random random = new Random();

					int num1 = random.nextInt(10000);
					int num2 = random.nextInt(10000);

					int dotPosition = name.lastIndexOf(".");

					String fileBeginName = name.substring(0, dotPosition);
					String fileEndName = name.substring(dotPosition);
					name = fileBeginName + "_" + currentTime + "_" + num1 + "_"
							+ num2 + fileEndName;

					System.out.println("afterName=" + name);
					fileNameList.add(name);

					File file = new File(uploadFileDir, name);
					item.write(file);// 上传文件 就这一句

				} else {
					System.out.println("不是文件 是普通的表单域");
					// 得到所有非文件域 的表单域,例如文本框等,这里得到pid 和 pname 这两个文本框的值
					String fieldName = item.getFieldName();
					String value = item.getString("utf-8");
					System.out.println("fieldName=" + fieldName);
					System.out.println("value=" + value);
					if ("pid".equals(fieldName)) {
						pid = value;
					}
				}
			}
		} catch (FileUploadException e) {

			e.printStackTrace();
		} catch (Exception e) {

			e.printStackTrace();
		}

		System.out.println("**********look here***************");
		System.out.println("pid=" + pid);
		for (String str : fileNameList) {
			System.out.println(str);
		}
		
	
		//---------------------------2.把上传的文件名 保存到数据库对应的字段中------------------------------
		
		List<String> fileNameWithDirectoryList = new ArrayList<String>();//带文件夹的文件名 例如 product2\\图片名
		for(String fileName:fileNameList){
			
			String fileNameWithDirectory = "";
			
			if(!fileName.trim().equals("")){
				 fileNameWithDirectory = "product" + pid + "\\" + fileName;
			}
			
			fileNameWithDirectoryList.add(fileNameWithDirectory);
			
		}
		
		ProductServiceImpl service2 = new ProductServiceImpl();
		service2.saveImagePathInTable(pid, fileNameWithDirectoryList);
	}
	
	@Override
	public void saveImagePathInTable(String pid,
			List<String> fileNameList) throws Exception{

		System.out.println("fileNameList size=" + fileNameList.size());
		
		//先把以前的查出来
		Product product;
		try {
			product = dao.getProductById(Integer.parseInt(pid));
		} catch (Exception e1) {
			e1.printStackTrace();
			throw new Exception("保存商品图片路径时 查询单一商品失败!");
		
		}

		ProductDaoImpl dao2 = new ProductDaoImpl();

		String[] imgNameArr = {"IMAGE1","IMAGE2","IMAGE3","IMAGE4"};
		
		//使用反射调用方法
		Class<?> clazz = product.getClass();
		
		for(int i=0;i<imgNameArr.length;i++){
			String imgName = fileNameList.get(i);
			
			if (imgName != null
					&& !imgName.trim().equals("")) {
				
				String methodName = "set" + imgNameArr[i];
				
				try{
					Method method = clazz.getMethod(methodName,String.class);
					method.invoke(product, imgName);
					System.out.println("调用反射方法成功");
				}catch(Exception e){
					e.printStackTrace();
				}
				
				//product.setProductListLargeImage(imgName);
			}
			
		}
		
		dao2.updateProductImageNames(product);

		/*String IMAGE1 = fileNameList.get(1);

		if (IMAGE1 != null
				&& !IMAGE1.trim().equals("")) {
			product.setIMAGE1(IMAGE1);
		}

		String IMAGE2 = fileNameList.get(2);

		if (IMAGE2 != null
				&& !IMAGE2.trim().equals("")) {
			product.setIMAGE2(IMAGE2);
		}

		String IMAGE3 = fileNameList.get(3);

		if (IMAGE3 != null
				&& !IMAGE3.trim().equals("")) {
			product.setIMAGE3(IMAGE3);
		}*/
		
		//保存详细页图片名称到指定字段


	}

	@Override
	public List<Product> getAllByName(String name) throws Exception {
		
		String sql = "SELECT * FROM PRODUCT WHERE PNAME = '" + name + "'";
		ProductDao productDaoImpl = new ProductDaoImpl();
		List<Product> pageByQuery = productDaoImpl.getPageByQuery(sql);		
		return pageByQuery;
	}
}
