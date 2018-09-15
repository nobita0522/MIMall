package com.mimall.service.inter;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mimall.vo.Product;
import com.page.PageInfo;

public interface ProductService {

	// 添加商品
	public int addProduct(Product product) throws Exception;

	// 删除商品
	public int deleteProductById(String pid) throws Exception;

	// 修改
	public int updateProduct(Product product) throws Exception;

	public int getTotalRecordSum() throws Exception;
	
	//按名字查询
	public List<Product> getAllByName(String name) throws Exception;

	// 查所有按分页
	public List<Product> getAllByPage(PageInfo pageInfo) throws Exception;

	// 按查询条件查询 查询后总共有多少条记录
	public int getTotalRecordSumBySearchCondition(Product product)
			throws Exception;

	// 按查询条件查询后 分页
	public List<Product> getPageByQuery(Product product, PageInfo pageInfo)
			throws Exception;

	// 查1
	public Product getProductById(String pid) throws Exception;

	// 产品上架
	public void productUp(Integer pid) throws Exception;

	// 产品下架
	public void productDown(Integer pid) throws Exception;

	// 上传图片
	public void upload(HttpServletRequest request, String productListUploadPath) throws Exception;

	//保存图片的路径到商品表
	public void saveImagePathInTable(String pid, List<String> fileNameList) throws Exception;
}
