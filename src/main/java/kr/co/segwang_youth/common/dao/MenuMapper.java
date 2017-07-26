package kr.co.segwang_youth.common.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MenuMapper {

    List<Map> selectMenu();

}
