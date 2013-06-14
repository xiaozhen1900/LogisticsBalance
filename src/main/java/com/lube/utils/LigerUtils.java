package com.lube.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-4-11
 * Time: 上午12:21
 * To change this template use File | Settings | File Templates.
 */
public class LigerUtils {
    public static Map<String, Object> resultList(List rows, String total){
        Map<String, Object> resBody = new HashMap<String, Object>(0);
        resBody.put("Total", total);
        resBody.put("Rows", rows);

        return resBody;
    }

    private static Map<String, Object> resultMeaage(boolean resultFlag, String message, String returnCode, Map map){
        Map<String, Object> resBody = new HashMap<String, Object>(0);
        resBody.put("success", resultFlag);
        resBody.put("message", message);
        resBody.put("resultValue", map);
        resBody.put("returnCode", returnCode);
        return resBody;
    }

    public static Map<String, Object> resultSuccess(String message){
        return resultMeaage(true, message, "00", new HashMap(0));
    }

    public static Map<String, Object> resultFail(String message){
        return resultMeaage(false, message, "00", new HashMap(0));
    }

    public static Map<String, Object> resultValueSucess(String message, Map map){
        return resultMeaage(true, message, "00", map);
    }

    public static Map<String, Object> resultValueSFail(String message, Map map){
        return resultMeaage(true, message, "00", map);
    }

}