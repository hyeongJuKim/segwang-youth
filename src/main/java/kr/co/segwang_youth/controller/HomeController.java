package kr.co.segwang_youth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 메인 페이지, DashBoard
 */

@Controller
@RequestMapping(value="/")
public class HomeController{

    @RequestMapping(method = RequestMethod.GET)
    public String home(){
        return "home";
    }

}
