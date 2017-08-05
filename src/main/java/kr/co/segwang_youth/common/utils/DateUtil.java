package kr.co.segwang_youth.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

    protected int fields[];

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



    /**
     * 날짜 타입을 문자열 타입으로 변환.
     * (메서드를 사용하지 않아도 코드가 많이 짧을 것 같아서 보류.)
     * @param date
     */
    public static String convertDateToString(Date date){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }


    /**
     * 입력한 요일과 현재 날짜의 요일이 같은지 검사.
     */
    public static boolean isDayOfWeek(int calendarDay, String date) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        try {
            Date parseDate = format.parse(date);
            Calendar cal = Calendar.getInstance();
            cal.setTime(parseDate);

            if (cal.get(Calendar.SATURDAY) != calendarDay)
                return false;

        } catch (ParseException e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }



}

