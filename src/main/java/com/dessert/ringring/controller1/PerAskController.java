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
import java.util.Objects;

@Slf4j
@Controller
public class PerAskController {
    @Autowired
    ServicePerAsk servicePerAsk;
    @Autowired
    DTOPerAsk perAsk;

    //문의글 쓰는 페이지
    @GetMapping("/perAsk")
    public String openPerAsk(RedirectAttributes redirect) {
        redirect.addAttribute("contentPage","userService/perAsk.jsp");
        return "redirect:mainForm";
    }
    //문의글 post
    @PostMapping("/perAsk")
    public String sendPerAsk(Model model, HttpServletRequest req, HttpSession session, MultipartFile file) throws IOException {
        String id= (String) session.getAttribute("userId");
        servicePerAsk.writePerAsk(req,file,id);
        model.addAttribute("msg","문의가 등록되었습니다");
        model.addAttribute("url","/");
        return "redirect";
    }

    //(관리자)모든 문의글 열람
    @GetMapping("/ListReplyPerAsk")
    public String openReplyPekAskList(RedirectAttributes redirect,HttpServletRequest req){
        List<DTOPerAsk> list=servicePerAsk.listAllPerAsk();
        req.getSession().setAttribute("list",list);
        redirect.addAttribute("contentPage","userService/listPerAsk.jsp");
        return "redirect:mainForm";
    }

    //문의글 하나 열람
    @GetMapping("/replyPerAsk")
    public String openReplyPekAsk(RedirectAttributes redirect,HttpServletRequest req){
        String idx=req.getParameter("idx");
        perAsk=servicePerAsk.getInfoOnePerAsk(req);
        req.getSession().setAttribute("getPerAsk",perAsk);
        redirect.addAttribute("contentPage","admin/replyPerAsk.jsp");
        return "redirect:mainForm";
    }
    @PostMapping("/replyPerAsk")
    public String replyPerAsk(HttpServletRequest req,Model model){
        String idx=req.getParameter("idx");
        log.debug(idx);
        servicePerAsk.answerPerAsk(req);
        model.addAttribute("contentsPage","/replyPerAsk?idx="+idx);
        return "redirect:mainForm";
    }

    @GetMapping("/listPerAsk")
    public String openUserPerAskList(RedirectAttributes redirect,HttpServletRequest req,HttpSession session){
        String id= (String) session.getAttribute("userId");
        if(Objects.equals(id,"admin")){
            log.debug("여기로가나?");
            List<DTOPerAsk> list=servicePerAsk.listAllPerAsk();
            req.getSession().setAttribute("userList", list);
            redirect.addAttribute("contentPage", "myPage/myPerQlist.jsp");
        }else {
            log.debug("저기로가나?");
            log.debug("관리자 권한있음");

            List<DTOPerAsk> list = servicePerAsk.getListUserPerAsk(id);
            req.getSession().setAttribute("userList", list);
            redirect.addAttribute("contentPage", "myPage/myPerQlist.jsp");
        }
        return "redirect:mainForm";
    }
}
