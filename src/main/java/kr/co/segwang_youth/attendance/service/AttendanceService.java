package kr.co.segwang_youth.attendance.service;

import kr.co.segwang_youth.attendance.dao.AttendanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AttendanceService{

    @Autowired
    public AttendanceMapper mapper;

    public Map attendance(String attendanceDate){
        Map attendance = new HashMap(); // controller return Map

        List<Map> villageSeqList = mapper.villageSeqList();

        List villageList = new ArrayList();
        int totalMemberCount = 0;

        for(Map vil:villageSeqList){
            Map village = new HashMap();
            Map attendanceMap = new HashMap();

            int attendanceCount = 0;

            attendanceMap.put("villageSeq", vil.get("VILLAGE_SEQ"));
            attendanceMap.put("attendanceDate",attendanceDate);

            List<Map> villageMember = mapper.attendance(attendanceMap);

            attendanceCount = 0;
            for (Map members:villageMember){
                if ("Y".equals(members.get("ATTENDANCE_YN")))
                    attendanceCount++;
            }

            village.put("villageSeq",vil.get("VILLAGE_SEQ"));
            village.put("villageName",vil.get("VILLAGE_NAME"));
            village.put("villageMember", villageMember);
            village.put("attendanceCount", attendanceCount);

            villageList.add(village);
            totalMemberCount += villageMember.size();

        }
        attendance.put("villageList",villageList);
        attendance.put("totalMemberCount",totalMemberCount);

        return attendance;
    }

    /**
     * 선택한 회원을 출석/비출석 한다/
     *
     * @param attendanceMember
     */
    public int attendanceMember(Map attendanceMember) {
        if ("true".equals(attendanceMember.get("attendanceYn")))
            mapper.insertAttendanceMember(attendanceMember);
        else
            mapper.deleteAttendanceMember(attendanceMember);


        //마을 출석
        mapper.villageMemberCount(attendanceMember);
        //전체 출석


        // village Seq
        //해당 마을 출석 전체 출석 변경해야함
    return 0;
    }


}
