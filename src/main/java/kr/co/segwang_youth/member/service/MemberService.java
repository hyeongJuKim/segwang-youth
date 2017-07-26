package kr.co.segwang_youth.member.service;

import kr.co.segwang_youth.member.dao.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MemberService {

    @Autowired
    public MemberMapper mapper;

    public List<Map> selectAllMember() {
        return mapper.selectAllMember();
    }
}
