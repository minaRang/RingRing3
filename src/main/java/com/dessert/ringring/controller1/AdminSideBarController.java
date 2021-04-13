package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOGoods;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.service.ServiceGoods;
import com.dessert.ringring.service.ServiceMember;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
public class AdminSideBarController {
    @Autowired
    DTOMember dtoMember;
    @Autowired
    ServiceMember serviceMember;
    @Autowired
    DTOGoods dtoGoods;
    @Autowired
    ServiceGoods serviceGoods;


    @GetMapping("/adminProduct")
    public String openAdminProduct(HttpSession session, HttpServletRequest req, RedirectAttributes redirect){
        dtoMember= (DTOMember) session.getAttribute("member");
        if(dtoMember.getAuthority().equals("admin")){
            log.debug("관리자 권한있음");
            List<DTOGoods> goodsList=serviceGoods.listGoods(null,null);
            req.getSession().setAttribute("goodsList",goodsList);
            redirect.addAttribute("contentPage","admin/adminProduct.jsp");
            return "redirect:mainForm";
        }else{
            //관리자 권한이 없는경우 메인으로 돌아가게 함
            log.debug("관리자 권한없음");
            return "redirect:mainForm";
        }
    }
    @GetMapping("/adminUserInfo")
    public String openAdminUserInfo(HttpSession session,RedirectAttributes redirect,HttpServletRequest req){
        dtoMember= (DTOMember) session.getAttribute("member");
        if(dtoMember.getAuthority().equals("admin")){
            List<DTOMember> memberList=serviceMember.allUserInfo();
            req.getSession().setAttribute("memberList",memberList);
            redirect.addAttribute("contentPage","admin/adminUserInfo.jsp");
            return "redirect:mainForm";
        }else{
            //관리자 권한이 없는경우 메인으로 돌아가게 함
            return "redirect:mainForm";
        }

    }
//    @PostMapping("/modifyAction")
//    public int modifyAction(){
//
//        return
//    }
}
