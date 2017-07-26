package kr.co.segwang_youth.member.controller;

import kr.co.segwang_youth.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value="/member")
public class MemberController {

    @Autowired
    private MemberService service;

    @RequestMapping(value="")
    public String search(Model model){
        List<Map> memberList = service.selectAllMember();
//        List<Member> memberList = memberDao.findAll();
        model.addAttribute("memberList",memberList);
        return "member/member";
    }

//    @RequestMapping(value="/putMember")
//    public String putMember(Member member){
//        return "redirect:/member/detail/"+ memberDao.save(member).getMemberSeq();
//    }
//
//    @RequestMapping("/detail/{memberSeq}")
//    public String view(Model model, @PathVariable int memberSeq) {
//        Member member = memberDao.findOne(memberSeq);
//        model.addAttribute("member", member);
//        return "/member/detail";
//    }


}
