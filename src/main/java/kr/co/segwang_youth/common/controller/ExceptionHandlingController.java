package kr.co.segwang_youth.common.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * Created by hj on 2017. 7. 19..
 */
@ControllerAdvice
public class ExceptionHandlingController {

    @ExceptionHandler(Exception.class)
    @RequestMapping(value = "/error")
    public String exceptions(Model model, Exception e) throws Exception{
        model.addAttribute("error", e.toString());
        return "/error/error";
    }

}
