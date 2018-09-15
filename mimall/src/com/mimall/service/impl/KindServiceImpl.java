package com.mimall.service.impl;

import java.util.List;

import com.mimall.dao.impl.KindDaoImpl;
import com.mimall.dao.inter.KindDao;
import com.mimall.vo.Category;
import com.mimall.vo.Kind;
import com.page.PageInfo;
import com.mimall.service.inter.KindService;

public class KindServiceImpl implements KindService {

	private KindDao dao;

	public KindServiceImpl() {
		dao = new KindDaoImpl();
	}

	@Override
	public int addCategory2(Kind category) throws Exception {

		int count = dao.addCategory2(category);
		return count;
	}
	
	
	public int getTotalRecordCount() throws Exception {
		int totalRecordCount = -1;

		String sql = "select count(*) from kind";
		totalRecordCount = dao.getTotalRecordCount(sql);
		return totalRecordCount;
	}

	//查询一级商品种类下的二级商品种类数量
	public int getCategory2SumByCategory1(int fid) throws Exception {

		int count = 0;
		String sql = "select count(*) from kind where cid=" + fid;
		count = dao.getTotalRecordCount(sql);
		return count;
	}

	// 查询一级商品种类下对应的二级商品种类
	public List<Kind> getAllCategory2ByCategory1(int cid) throws Exception {
		List<Kind> list = null;
        
		String sql = "select * from kind where cid=" + cid +" order by kid asc";
		list = dao.getPageByQuery(sql);
		return list;
	}

	@Override
	public Kind getCategoryById(int cid) throws Exception {
		Kind category2 = null;
		category2 = dao.getCategoryById(cid);
		return category2;
	}

	// 根据商品种类名字得到Category2
	public Kind getCategoryByName(String cname) throws Exception {
		Kind category2 = null;
		String sql = "select * from kind where kname='" + cname + "'";
		List<Kind> list = dao.getPageByQuery(sql);
		if (list.size() > 0) {
			category2 = list.get(0);
		}
		if(category2 == null){
			System.out.println("KindServiceImpl>>getCategoryByName>>category2 is null");
		}else{
			
			System.out.println("KindServiceImpl>>getCategoryByName>>category2 is null");
		}
		return category2;
	}
// 查询指定二级种类的父亲一级种类的cid
	// 形参: cid 二级种类的cid
	// 返回值: 所属一级种类的cid
	public int getParentCategoryById(int cid) throws Exception{
		int parentCid = 0;
		String sql = "select Cid from kind where Kid=" + cid;
		try {
			parentCid = dao.getTotalRecordCount(sql);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("查询二级种类对应的一级商品种类失败");
			
		}
		return parentCid;
	}
	
	
	public List<Kind> getAllByPage(PageInfo pageInfo) throws Exception {

		String sql = "select * from (select c.*,rownum r from kind c  order by kid asc) where r>="
				+ pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
		System.out.println(sql+"helloworld");

		List<Kind> list = null;

		list = dao.getPageByQuery(sql);
		return list;
	}
	
	
	public List<Kind> getPageByQuery(Kind category2, PageInfo pageInfo)
			throws Exception {

		List<Kind> list = null;

		// String sql =
		// "select * from (select c.*,rownum r from category c where 1=1 and cname='wubo' or cdesc like '%111%') where r>=11 and r<=15"

		StringBuffer sb = new StringBuffer(
				"select * from (select c.*,rownum r from kind c where 1=1");

		String kname = category2.getCname();
		String kdesc = category2.getCdesc();
		Integer cid=category2.getCid();

		if (kname != null && !kname.trim().equals("")) {

			sb.append(" and kname='");
			sb.append(kname);
			sb.append("'");
		}

		if (kdesc != null && !kdesc.trim().equals("")) {
			sb.append(" or kdesc like '%");
			sb.append(kdesc);
			sb.append("%'");
		}
		
		if (cid!=null) {
			
			sb.append(" or cid=");
			sb.append(cid);
		}
		
		sb.append(" order by kid asc) where r>=");
		sb.append(pageInfo.getBegin());
		sb.append(" and r<=");
		sb.append(pageInfo.getEnd());
		
		String sql = sb.toString();
		
		list = dao.getPageByQuery(sql);
		return list;
	}

	
	
	public int updatekind(Kind category2) throws Exception {
		int count = dao.updatekind(category2);
	
		return count;
	}
	
	
	
	public int deletekindById(String kid) throws Exception {
        
		Kind category2 = new Kind();
		category2.setCid(Integer.parseInt(kid));
		
		int count = dao.deletekind(category2);
		
		return count;
	}
	
}
