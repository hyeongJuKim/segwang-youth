package kr.co.segwang_youth.attendance.controller;

import com.google.gson.Gson;
import kr.co.segwang_youth.attendance.service.AttendanceService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        Map attendance = service.attendance(request.getParameter("attendanceDate"));
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
        service.attendanceMember(attendanceMember);

        Gson gson = new Gson();
        String json = gson.toJson("성공");

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
