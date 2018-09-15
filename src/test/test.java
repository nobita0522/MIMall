package test;

import com.mimall.dao.impl.ProductDaoImpl;
import com.mimall.dao.impl.UserDaoimpl;
import com.mimall.dao.inter.ProductDao;
import com.mimall.vo.Product;
import com.mimall.vo.Users;

public class test {
	public static void main(String[] args) {
		UserDaoimpl dao = new UserDaoimpl();
		Users user = new Users();
		
		user.setUPHONE("15699338997");
		user.setUNAME("小米用户15699338997");
		try {
			int count = dao.addUser(user);
			System.out.println(count);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("失败");
			e.printStackTrace();
		}
	}
}
