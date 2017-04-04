package kr.co.segwang_youth.model.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

/**
 * Created by hj on 2017. 4. 1..
 */
@Entity
public class Member {

    @Id
    @GeneratedValue
    int memberSeq;  // 회원 일련번호
    String memberName; // 회원명
    Date registDate;    // 등록일자

    public int getMemberSeq() {
        return memberSeq;
    }

    public void setMemberSeq(int memberSeq) {
        this.memberSeq = memberSeq;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    public Date getRegistDate() {
        return registDate;
    }

    public void setRegistDate(Date registDate) {
        this.registDate = registDate;
    }

}
