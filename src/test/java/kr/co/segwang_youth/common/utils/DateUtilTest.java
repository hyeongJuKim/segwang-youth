package kr.co.segwang_youth.common.utils;


import org.junit.Test;

import java.util.Date;

import static org.junit.Assert.assertTrue;


/**
 * 현재 일자 기준으로 가장 최근의 특정요일을 반한받는다.
 * @return Last Day of the week
 */
public class DateUtilTest {

    /**
     * 날짜 Type으로 return하는지 체크.
     */
    @Test
    public void input_dateType_reurn_stringType(){
        String date = DateUtil.convertDateToString(new Date());
        assertTrue(date instanceof String);
    }

}
