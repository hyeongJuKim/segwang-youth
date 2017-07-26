package kr.co.segwang_youth.member.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemberMapper {

    List<Map> selectAllMember();

}
