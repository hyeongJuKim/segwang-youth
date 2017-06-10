package kr.co.segwang_youth.attendance.service;

import kr.co.segwang_youth.attendance.dao.AttendanceMapper;
import kr.co.segwang_youth.common.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class AttendanceService{

    @Autowired
    public AttendanceMapper mapper;

    /**
     * 해당 일의 출석 현황 조회
     * @param attendanceDate
     * @return
     */
    public Map attendance(String attendanceDate){
        Map attendance = new HashMap(); // controller return Map
        List<Map> villageSeqList = mapper.villageSeqList();

        List villageList = new ArrayList();
        int totalMemberCount = 0;       // 전체 회원
        int totalAttendanceCount = 0;   // 전체 중 출석한 인원

        for(Map vil:villageSeqList){
            Map village = new HashMap();
            Map attendanceMap = new HashMap();

            int attendanceCount = 0;

            attendanceMap.put("villageSeq", vil.get("VILLAGE_SEQ"));
            attendanceMap.put("attendanceDate",attendanceDate);

            List<Map> villageMember = mapper.attendance(attendanceMap);

            attendanceCount = 0;
            for (Map members:villageMember){
                if ("Y".equals(members.get("ATTENDANCE_YN"))) {
                    attendanceCount++;  // 해당 마을 출석
                    totalAttendanceCount++; // 모든 마을 출석 인원
                }
                totalMemberCount++;
            }


            village.put("villageSeq",vil.get("VILLAGE_SEQ"));
            village.put("villageName",vil.get("VILLAGE_NAME"));
            village.put("villageMember", villageMember);
            village.put("attendanceCount", attendanceCount);
            villageList.add(village);
        }

        attendance.put("villageList",villageList);
        attendance.put("totalMemberCount",totalMemberCount);
        attendance.put("totalAttendanceCount",totalAttendanceCount);

        return attendance;
    }

    /**
     * 선택한 회원을 출석/비출석 한다
     * @param attendanceMember
     */
    public Map attendanceMember(Map attendanceMember) {
        if ("true".equals(attendanceMember.get("attendanceYn")))
            mapper.insertAttendanceMember(attendanceMember);
        else
            mapper.deleteAttendanceMember(attendanceMember);

    return mapper.villageMemberCount(attendanceMember);
    }


}
