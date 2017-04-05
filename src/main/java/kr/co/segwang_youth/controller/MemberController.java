package kr.co.segwang_youth.controller;

import kr.co.segwang_youth.dao.MemberDao;
import kr.co.segwang_youth.model.entity.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Created by hj on 2017. 3. 31..
 */
@Controller
@RequestMapping(value="/member")
public class MemberController {

    @Autowired
    private MemberDao memberDao;

    @RequestMapping(value="")
    public String search(Model model){
        List<Member> memberList = memberDao.findAll();
        model.addAttribute("memberList",memberList);
        return "member/member";
    }

    @RequestMapping(value="/putMember")
    public String putMember(Member member){
        return "redirect:/member/detail/"+ memberDao.save(member).getMemberSeq();
    }

    @RequestMapping("/detail/{memberSeq}")
    public String view(Model model, @PathVariable int memberSeq) {
        Member member = memberDao.findOne(memberSeq);
        model.addAttribute("member", member);
        return "/member/detail";
    }


}
