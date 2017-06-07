package kr.co.segwang_youth.common.utils;

import java.util.Calendar;
import java.util.Date;

/**
 * Created by hj on 2017. 6. 6..
 */
public class DateUtil {

//    public final static int DAY_OF_WEEK_IN_SUNDAY = 0;

    public final static int SUNDAY = 1;

    public final static int MONDAY = 2;

    public final static int TUESDAY = 3;

    public final static int WEDNESDAY = 4;

    public final static int THURSDAY = 5;

    public final static int FRIDAY = 6;

    public final static int SATURDAY = 7;

    /**
     * 요일을 인자로 받아서 현재 일자 부터 가장 요일 날짜를 반환한다.
     *
     * 0: Sunday, 1:Monday, 2: Tuesday, 3: Wednesday,
     * 4: Thursday, 5: Friday, 6: Saturday
     *
     * Date Return, String Return Option 추가
     *
     * @param day (day)
     * @return lastDateInWant
     */
    public static Date calcLastDateInWant(int day) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        while (cal.get(Calendar.DAY_OF_WEEK) != day)
            cal.add(Calendar.DATE,-1);
        
        return cal.getTime();
    }
}

