package kr.co.segwang_youth;

import kr.co.segwang_youth.common.dao.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;


@ControllerAdvice
public class MenuAdvice {

    @Autowired
    public MenuMapper mapper;

    @ModelAttribute
    public void addAttribute(Model model){
        model.addAttribute("menu", mapper.selectMenu());
    }
}
