package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOPerAsk;
import com.dessert.ringring.service.ServicePerAsk;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
@Slf4j
@Controller
public class PerAskController {
    @Autowired
    ServicePerAsk servicePerAsk;
    @Autowired
    DTOPerAsk perAsk;

    @GetMapping("/perAsk")
    public String openPerAsk(RedirectAttributes redirect) {
        redirect.addAttribute("contentPage","userService/perAsk.jsp");
        return "redirect:mainForm";
    }

    @PostMapping("/perAsk")
    public String sendPerAsk(Model model, HttpServletRequest req, HttpSession session, MultipartFile file) throws IOException {
        String id= (String) session.getAttribute("userId");
        servicePerAsk.writePerAsk(req,file,id);
        model.addAttribute("msg","문의가 등록되었습니다");
        model.addAttribute("url","/");
        return "redirect";
    }

    @GetMapping("/ListReplyPerAsk")
    public String openReplyPekAskList(RedirectAttributes redirect,HttpServletRequest req){
        List<DTOPerAsk> list=servicePerAsk.listAllPerAsk();
        System.out.println(list);
        req.getSession().setAttribute("list",list);
        redirect.addAttribute("contentPage","userService/listPerAsk.jsp");
        return "redirect:mainForm";
    }

    @GetMapping("/replyPerAsk")
    public String openReplyPekAsk(RedirectAttributes redirect,HttpServletRequest req){
        String idx=req.getParameter("idx");
        System.out.println(idx);
        perAsk=servicePerAsk.getInfoOnePerAsk(req);
        req.getSession().setAttribute("getPerAsk",perAsk);
        redirect.addAttribute("contentPage","userService/replyPerAsk.jsp");
        return "redirect:mainForm";
    }
    @PostMapping("/replyPerAsk")
    public String replyPerAsk(HttpServletRequest req,Model model){
        servicePerAsk.answerPerAsk(req);
        model.addAttribute("contentsPage","/ListReplyPerAsk");
        return "redirect:mainForm";
    }
}
