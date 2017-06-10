package kr.co.segwang_youth.attendance.controller;

import com.google.gson.Gson;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import kr.co.segwang_youth.attendance.service.AttendanceService;
import kr.co.segwang_youth.common.utils.DateUtil;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hj on 2017. 3. 31..
 */
@Controller
@RequestMapping(value="/attendance")
public class AttendanceController {

    @Autowired
    private AttendanceService service;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value="")
    public String attendance(Model model,HttpServletRequest request){
        String attendanceDate = request.getParameter("attendanceDate");
        if (attendanceDate == null) {
            Date date = DateUtil.calcLastDateInWant(Calendar.SUNDAY);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            attendanceDate = dateFormat.format(date);
        }

        Map attendance = service.attendance(attendanceDate);
        model.addAttribute("attendance",attendance);

        return "attendance/attendance";
    }



    @RequestMapping(value = "check", method= RequestMethod.POST, produces="text/plain; charset=UTF-8")
    @ResponseBody
    public String check(HttpServletRequest request){
        Map attendanceMember = new HashMap();
        attendanceMember.put("memberSeq",request.getParameter("memberSeq"));
        attendanceMember.put("attendanceYn",request.getParameter("attendanceYn"));
        attendanceMember.put("attendanceDate",request.getParameter("attendanceDate"));
        attendanceMember.put("villageSeq",request.getParameter("villageSeq"));

        Map resultCheckMember = service.attendanceMember(attendanceMember);
        resultCheckMember.put("villageSeq",request.getParameter("villageSeq"));
        resultCheckMember.put("memberSeq",request.getParameter("memberSeq"));

        Gson gson = new Gson();
        String json = gson.toJson(resultCheckMember);
        System.out.println("json" + json);

        return json;
    }

    @RequestMapping(value="{attendanceDate}",  method = {RequestMethod.GET})
    public String attendanceDate(Model model,@PathVariable("attendanceDate") String attendanceDate){
        Map attendance = service.attendance(attendanceDate);
        model.addAttribute("attendance",attendance);
        model.addAttribute("attendanceDate",attendanceDate);

        return "attendance/attendance";
    }

}
