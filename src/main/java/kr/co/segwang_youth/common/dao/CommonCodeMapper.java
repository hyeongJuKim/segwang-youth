package kr.co.segwang_youth.common.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

/**
 * Created by hj on 2017. 5. 17..
 */
@Mapper
//@Repository
public interface CommonCodeMapper {

    List<Map> selectCodeList(String classCode);

    List<Map> selectVillageAllList();
}
