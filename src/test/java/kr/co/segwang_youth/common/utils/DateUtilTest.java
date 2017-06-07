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
    public void should_return_date(){
        Date date = DateUtil.calcLastDateInWant(0);
        assertTrue(date instanceof Date);
    }

    @Test
    public void 가장최근_일요일과_일요일_비교(){
        Date date = DateUtil.calcLastDateInWant(DateUtil.TUESDAY);
        System.out.println(date);
//        assertEquals(DateUtil.SUNDAY,date.get);
    }

    @Test
    public void should_return_date_when_0_was_day(){
        Date date = DateUtil.calcLastDateInWant(DateUtil.SUNDAY);
//        System.out.println(new Date());
//        System.out.println(date);

    }




}
