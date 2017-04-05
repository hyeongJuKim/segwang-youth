package kr.co.segwang_youth.model.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * Created by hj on 2017. 4. 1..
 */
@Entity
@EntityListeners(AuditingEntityListener.class)
public class Member {

    @Id
    @GeneratedValue
    int memberSeq;  // 회원 일련번호

    String memberName; // 회원명

    LocalDateTime memberBirthday;    // 회원 생년월일

    @CreatedDate
    @Column(name = "created_at", updatable = false)
    LocalDateTime registDate;   // 등록일자

    @LastModifiedDate
    @Column(name = "last_modified_at", updatable = true)
    LocalDateTime updateDate;    // 수정일자


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

    public LocalDateTime getMemberBirthday() {
        return memberBirthday;
    }

    public void setMemberBirthday(LocalDateTime memberBirthday) {
        this.memberBirthday = memberBirthday;
    }

    public LocalDateTime getRegistDate() {
        return registDate;
    }

    public void setRegistDate(LocalDateTime registDate) {
        this.registDate = registDate;
    }

    public LocalDateTime getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(LocalDateTime updateDate) {
        this.updateDate = updateDate;
    }
}
