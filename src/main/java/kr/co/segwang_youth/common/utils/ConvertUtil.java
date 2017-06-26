package kr.co.segwang_youth.common.utils;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hj on 2017. 6. 21..
 */
public class ConvertUtil {


    /**
     * RequestParameters를 Map으로 변환.
     * @param request
     * @return
     */
    public static Map convertRequestGetParamToMap(HttpServletRequest request) {
        Map map = new HashMap();
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String name = parameterNames.nextElement();
            String value = request.getParameter(name);
            map.put(name,value);
        }
        return map;
    }
}
