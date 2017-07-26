package kr.co.segwang_youth.common.controller;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ExceptionHandlingController {

    @ExceptionHandler(Exception.class)
    public String exceptions(Model model, Exception e) throws Exception{
        model.addAttribute("error", e.getClass());
        return "/error/error";
    }

    //TODO HTTP STATS에 관한 error페이지 만들기.
//    @ExceptionHandler(NoHandlerFoundException.class)
//    @ResponseStatus(HttpStatus.NOT_FOUND)
//    public void NoHandlerFoundException(HttpServletRequest req, Exception ex) {
//        System.out.println(req.getMethod());
//        System.out.println("404");
//    }
}
