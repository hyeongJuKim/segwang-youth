package kr.co.segwang_youth.attendance.dao;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by hj on 2017. 5. 17..
 */
@Mapper
//@Repository
public interface AttendanceMapper {

    List<Map> villageSeqList();

    List<Map> attendance(Map attendanceMap);

//    public int check(Map checkMap);

    void insertAttendanceMember(Map attendanceMember);

    void deleteAttendanceMember(Map attendanceMember);

    Map villageMemberCount(Map attendanceMember);
}
