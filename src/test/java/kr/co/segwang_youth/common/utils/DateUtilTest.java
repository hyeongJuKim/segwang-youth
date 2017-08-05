package kr.co.segwang_youth.common.utils;

import org.junit.Test;

import java.util.Calendar;
import java.util.Date;

import static org.junit.Assert.assertTrue;

public class DateUtilTest {

    @Test
    public void Test(){

    }


    /**
     * isSunday() Test;
     */

    @Test
    public void check_date_type(){
        String converDate = DateUtil.convertDateToString(new Date());
        System.out.println(converDate);
    }

    @Test
    public void input_date_sunday_return_true(){
        boolean dayOfWeek = DateUtil.isDayOfWeek(Calendar.SUNDAY,"2017-08-06");
        assertTrue(dayOfWeek);
    }


}
