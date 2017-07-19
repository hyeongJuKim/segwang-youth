package kr.co.segwang_youth.common.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@ControllerAdvice
public class ExceptionHandlingController {

    @ExceptionHandler(Exception.class)
//    @RequestMapping(value = "/error")
    public String exceptions(Model model, Exception e) throws Exception{
        model.addAttribute("error", e.toString());
        return "/error/error";
    }

}
