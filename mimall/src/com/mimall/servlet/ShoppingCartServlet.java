package com.mimall.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.mimall.service.impl.CategoryServiceImpl;
import com.mimall.service.impl.KindServiceImpl;
import com.mimall.service.impl.ProductServiceImpl;
import com.mimall.service.impl.ShoppingcartServiceImpl;
import com.mimall.service.inter.CategoryService;
import com.mimall.service.inter.KindService;
import com.mimall.service.inter.ProductService;
import com.mimall.service.inter.ShoppingcartService;
import com.mimall.vo.Product;
import com.mimall.vo.Users;
import com.mimall.vo.shoppingcart;

public class ShoppingCartServlet extends HttpServlet{

    List<shoppingcart> zonglist=new ArrayList<shoppingcart>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub

        String action=req.getParameter("action");

        if(action.equals("getshoppingcartinfo")){
            this.getshoppingcartinfo(req,resp);
        }else if(action.equals("addintoshoppingcart")){
            this.addintoshoppingcartinfo(req, resp);
        }else if(action.equals("delete")){
            this.delete(req, resp);
        }else if(action.equals("updatedecrease")){
            this.updatedecrease(req, resp);
        }else if(action.equals("updateadd")){
            this.updateadd(req, resp);
        }

    }


    protected void getshoppingcartinfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // TODO Auto-generated method stub

        HttpSession session=req.getSession(true);
        String uuid=req.getParameter("uuid");
        String pid=req.getParameter("pid");
        shoppingcart c=new shoppingcart();
        if(uuid!=null&&!uuid.trim().equals("")){
            try {
                ShoppingcartService service1=new ShoppingcartServiceImpl();
                List<shoppingcart> list3=service1.getshoppingcartinfo(uuid);
                req.setAttribute("list3",list3);
                req.getSession(true).setAttribute("shoppingcarts",list3);
                req.getRequestDispatcher("html/shoppingcart.jsp").forward(req, resp);

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else{

            req.getRequestDispatcher("shoppingcart.jsp").forward(req,resp);
        }
    }


    protected void addintoshoppingcartinfo(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        HttpSession session=req.getSession(true);

        String pid1=req.getParameter("pid");
        ProductService p1=new ProductServiceImpl();
        Product product1 = null;
        try {
            product1 = p1.getProductById(pid1);
        } catch (Exception e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        String pdesc=product1.getPDESC();
        String pname=product1.getPNAME();
        Double newprice=product1.getNEWPRICE();
        String imag1=product1.getIMAGE1();
        Users user=(Users) session.getAttribute("user");
        String uuid=null;
        if(user!=null){
            uuid=user.getUUID();
        }


        String requestpage=req.getParameter("requestpage");


        int pid=Integer.parseInt(pid1);
        /*String uuid=req.getParameter("uuid");*/
        String cartcount=req.getParameter("cartcount");
        shoppingcart danyishopping=new shoppingcart();

        List<shoppingcart> list3=new ArrayList<shoppingcart>();
        if(uuid!=null&&!uuid.trim().equals("")){
            if(requestpage.equals("1")){




                try {

                    danyishopping.setUUID(uuid);
                    danyishopping.setPNAME(pname);
                    danyishopping.setPID(pid);
                    danyishopping.setPDESC(pdesc);
                    danyishopping.setNEWPRICE(newprice);
                    danyishopping.setIMAGE1(imag1);
                    danyishopping.setCartcount(Integer.parseInt(cartcount));
                    ShoppingcartService service3=new ShoppingcartServiceImpl();
                    int count=service3.getcartcountbypidanduuid(uuid, pid);
                    System.out.println(count+"添加");
                    if(count==0){
                        System.out.println("添加1");
                        ShoppingcartService service4=new ShoppingcartServiceImpl();

                        service4.addintoshoppingcartinfo(uuid,pid,Integer.parseInt(cartcount));
                    }else{
                        ShoppingcartService service5=new ShoppingcartServiceImpl();
                        service5.updatecartcountbypidanduuid(uuid, pid, Integer.parseInt(cartcount));
                    }
                    req.setAttribute("danyishopping",danyishopping);
		    			/*ShoppingcartService service=new ShoppingcartServiceImpl();
		    			List<shoppingcart> list1=service.getshoppingcartinfo(uuid);
		    		   req.setAttribute("list1",list1);*/
                    session.removeAttribute("zonglist");
                    req.getRequestDispatcher("html/Gotopay.jsp").forward(req, resp);

                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }else if(requestpage.equals("3")){





                try {
                    ShoppingcartService service3=new ShoppingcartServiceImpl();
                    int count=service3.getcartcountbypidanduuid(uuid, pid);
                    if(count==0){
                        ShoppingcartService service6=new ShoppingcartServiceImpl();
                        service6.addintoshoppingcartinfo(uuid,pid,1);
                    }else{
                        System.out.println("更新咯");
                        ShoppingcartService service7=new ShoppingcartServiceImpl();
                        service7.updatecartcountbypidanduuid(uuid, pid, 1);
                    }

                    req.setAttribute("danyishopping",danyishopping);
                    ShoppingcartService service=new ShoppingcartServiceImpl();
                    list3=service.getshoppingcartinfo(uuid);
                    req.setAttribute("list3",list3);

                    req.getRequestDispatcher("html/shoppingcart.jsp").forward(req, resp);
                    session.removeAttribute("zonglist");
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }else{

                List<shoppingcart> ca=(List)session.getAttribute("zonglist");
                for(int i=0;i<ca.size();i++){

                    ShoppingcartService service3=new ShoppingcartServiceImpl();



                    try {

                        service3.addintoshoppingcartinfo(uuid,ca.get(i).getPID(),ca.get(i).getCartcount());
                        req.setAttribute("danyishopping",danyishopping);
                        ShoppingcartService service=new ShoppingcartServiceImpl();
                        list3=service.getshoppingcartinfo(uuid);
                        req.setAttribute("list3",list3);

                        req.getRequestDispatcher("html/shoppingcart1.jsp").forward(req, resp);
                        session.removeAttribute("zonglist");
                    } catch (Exception e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                    }
                }
            }


        }else{

            if(requestpage.equals("1")){
                Product p=new Product();
                ProductService product =new ProductServiceImpl();
                try {
                    p=product.getProductById(pid1) ;
                    danyishopping.setPID(p.getPID());
                    danyishopping.setPNAME(p.getPNAME());
                    danyishopping.setPDESC(p.getPDESC());
                    danyishopping.setNEWPRICE(p.getNEWPRICE());
                    danyishopping.setCartcount(Integer.parseInt(cartcount));
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                int zonglistcount=0;
                for(int i=0;i<zonglist.size();i++){

                    shoppingcart product2 = zonglist.get(i);

                    if(pid==zonglist.get(i).getPID()){
                        product2.setCartcount(zonglist.get(i).getCartcount()+Integer.parseInt(cartcount));
                        break;
                    }
                    zonglistcount++;
                }
                if(zonglistcount==zonglist.size()){
                    zonglist.add(danyishopping);
                }
                session.setAttribute("zonglist",zonglist);
                req.setAttribute("danyishopping",danyishopping);
                req.getRequestDispatcher("html/Gotopay.jsp").forward(req,resp);
            }else if(requestpage.equals("3")){
                Product p=new Product();
                ProductService product =new ProductServiceImpl();
                try {
                    p=product.getProductById(pid1) ;
                    danyishopping.setPID(p.getPID());
                    danyishopping.setPNAME(p.getPNAME());
                    danyishopping.setPDESC(p.getPDESC());
                    danyishopping.setNEWPRICE(p.getNEWPRICE());
                    danyishopping.setCartcount(1);
                } catch (Exception e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                int zonglistcount=0;
                for(int i=0;i<zonglist.size();i++){

                    shoppingcart product2 = zonglist.get(i);

                    if(pid==zonglist.get(i).getPID()){
                        product2.setCartcount(zonglist.get(i).getCartcount()+1);
                        break;
                    }
                    zonglistcount++;
                }
                if(zonglistcount==zonglist.size()){
                    zonglist.add(danyishopping);
                }

                session.setAttribute("zonglist",zonglist);
                req.setAttribute("danyishopping",danyishopping);
                req.getRequestDispatcher("html/shoppingcart.jsp").forward(req,resp);
            }
        }

    }



    public void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String target = "";
        HttpSession session=request.getSession(true);
        String uuid = request.getParameter("uuid");
        int pid=Integer.parseInt(request.getParameter("pid"));
        List<shoppingcart> list3=new ArrayList<shoppingcart>();
        if(uuid!=null&&!uuid.trim().equals("")){
            try {
                ShoppingcartService service5 = new ShoppingcartServiceImpl();
                service5.deleteshoppingcartByuuIdandpid(uuid,pid);
                ShoppingcartService service=new ShoppingcartServiceImpl();
                list3=service.getshoppingcartinfo(uuid);
                request.setAttribute("list3",list3);
                target = "html/shoppingcart.jsp";
                request.getRequestDispatcher(target).forward(request, response);

            } catch (Exception e) {

                e.printStackTrace();


            }

        }else{
            for(int i=0;i<zonglist.size();i++){
                if(zonglist.get(i).getPID()==pid){
                    zonglist.remove(i);
                    i--;
                }
            }
            session.setAttribute("zonglist",zonglist);

            request.getRequestDispatcher("html/shoppingcart.jsp").forward(request,response);
        }


    }








    protected void updatedecrease(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // TODO Auto-generated method stub

        HttpSession session=req.getSession(true);
        String uuid=req.getParameter("uuid");
        String pid1=req.getParameter("pid");

        int pid=Integer.parseInt(pid1);
        shoppingcart c=new shoppingcart();
        if(uuid!=null&&!uuid.trim().equals("")){
            try {
                PrintWriter out = resp.getWriter();
                int cartcount=Integer.parseInt(req.getParameter("cartcount"));
                if(cartcount>1){
                    ShoppingcartService service8=new ShoppingcartServiceImpl();

                    service8.updatecartcountbypidanduuid(uuid, pid, -1);
                    Gson gson = new Gson();
                    String cartcount1 = gson.toJson(cartcount-1);
                    out.println(cartcount1);//鎶婅幏鍙栧埌鐨勪俊鎭啓鍥炲幓锛屼粠鏁版嵁搴撹幏鍙栧畬鏁版嵁鍚庡皢鐩稿簲鏁版嵁浼犵粰product.jsp,褰撴湇鍔″櫒绔暟鎹姞杞藉畬姣曚互鍚庯紝product.jsp璋冪敤杩斿洖鍑芥暟
                    out.flush();
                    out.close();
                }else{
                    Gson gson = new Gson();
                    String cartcount1 = gson.toJson(1);
                    out.println(cartcount1);//鎶婅幏鍙栧埌鐨勪俊鎭啓鍥炲幓锛屼粠鏁版嵁搴撹幏鍙栧畬鏁版嵁鍚庡皢鐩稿簲鏁版嵁浼犵粰product.jsp,褰撴湇鍔″櫒绔暟鎹姞杞藉畬姣曚互鍚庯紝product.jsp璋冪敤杩斿洖鍑芥暟
                    out.flush();
                    out.close();
                }


            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else{
            PrintWriter out = resp.getWriter();
            for(int i=0;i<zonglist.size();i++){
                shoppingcart cartdecrease=zonglist.get(i);
                if(zonglist.get(i).getPID()==pid){
                    if(zonglist.get(i).getCartcount()>1){
                        cartdecrease.setCartcount(zonglist.get(i).getCartcount()-1);
                        Gson gson = new Gson();




                        String cartcount2 = gson.toJson(cartdecrease.getCartcount());

                        out.println(cartcount2);//鎶婅幏鍙栧埌鐨勪俊鎭啓鍥炲幓锛屼粠鏁版嵁搴撹幏鍙栧畬鏁版嵁鍚庡皢鐩稿簲鏁版嵁浼犵粰product.jsp,褰撴湇鍔″櫒绔暟鎹姞杞藉畬姣曚互鍚庯紝product.jsp璋冪敤杩斿洖鍑芥暟
                        out.flush();
                        out.close();
                    }
                }
            }

        }
    }






    protected void updateadd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // TODO Auto-generated method stub

        HttpSession session=req.getSession(true);
        String uuid=req.getParameter("uuid");
        String pid1=req.getParameter("pid");
        int pid=Integer.parseInt(pid1);




        shoppingcart c=new shoppingcart();
        if(uuid!=null&&!uuid.trim().equals("")){
            try {
                PrintWriter out = resp.getWriter();
                int cartcount=Integer.parseInt(req.getParameter("cartcount"));
                ShoppingcartService service8=new ShoppingcartServiceImpl();

                service8.updatecartcountbypidanduuid(uuid, pid, 1);

                Gson gson = new Gson();
                String cartcount1 = gson.toJson(cartcount+1);
                out.println(cartcount1);//鎶婅幏鍙栧埌鐨勪俊鎭啓鍥炲幓锛屼粠鏁版嵁搴撹幏鍙栧畬鏁版嵁鍚庡皢鐩稿簲鏁版嵁浼犵粰product.jsp,褰撴湇鍔″櫒绔暟鎹姞杞藉畬姣曚互鍚庯紝product.jsp璋冪敤杩斿洖鍑芥暟
                out.flush();
                out.close();

            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else{
            PrintWriter out = resp.getWriter();
            for(int i=0;i<zonglist.size();i++){
                shoppingcart cartdecrease=zonglist.get(i);
                if(zonglist.get(i).getPID()==pid){
                    if(zonglist.get(i).getCartcount()>=1){
                        cartdecrease.setCartcount(zonglist.get(i).getCartcount()+1);
                        Gson gson = new Gson();
                        String cartcount2 = gson.toJson(cartdecrease.getCartcount());

                        out.println(cartcount2);//鎶婅幏鍙栧埌鐨勪俊鎭啓鍥炲幓锛屼粠鏁版嵁搴撹幏鍙栧畬鏁版嵁鍚庡皢鐩稿簲鏁版嵁浼犵粰product.jsp,褰撴湇鍔″櫒绔暟鎹姞杞藉畬姣曚互鍚庯紝product.jsp璋冪敤杩斿洖鍑芥暟
                        out.flush();
                        out.close();
                    }
                }
            }
        }
    }
}
