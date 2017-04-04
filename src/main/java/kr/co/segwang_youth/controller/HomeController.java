package kr.co.segwang_youth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by hj on 2017. 3. 31..
 */
@Controller
@RequestMapping(value="/")
public class HomeController {

    @RequestMapping(method = RequestMethod.GET)
    public String home(){

        return "home";
    }

}
