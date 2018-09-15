package com.mimall.util;

import com.google.gson.Gson;

import java.io.IOException;
import java.io.PrintWriter;

public class AjaxUtil {

    private static final Gson gson = new Gson();

    public static void updatePageWithAjaxJson(javax.servlet.http.HttpServletResponse resp, Object src) {
        String jsonSrc = gson.toJson(src);
        PrintWriter printWriter = null;
        try {
            printWriter = resp.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("ajaxUtil 异常");
        }
        printWriter.println(jsonSrc);
        printWriter.flush();
        printWriter.close();
    }

}
