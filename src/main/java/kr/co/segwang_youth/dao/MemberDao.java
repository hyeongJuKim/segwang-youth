package kr.co.segwang_youth.dao;

import kr.co.segwang_youth.model.entity.Member;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * Created by hj on 2017. 4. 1..
 */

public interface MemberDao extends JpaRepository <Member,Integer>{
}



