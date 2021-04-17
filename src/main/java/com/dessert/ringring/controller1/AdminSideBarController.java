package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOBoard;
import com.dessert.ringring.domain.DTOGoods;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.service.ServiceGoods;
import com.dessert.ringring.service.ServiceMember;
import com.dessert.ringring.util.PagingUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Autowired
    private PagingUtils pagingUtils;


    @GetMapping("/adminProduct")
    public String openAdminProduct(HttpSession session, HttpServletRequest req, RedirectAttributes redirect){
        dtoMember= (DTOMember) session.getAttribute("member");
        if(dtoMember.getAuthority().equals("admin")){
            log.debug("관리자 권한있음");
            List<DTOGoods> goodsList=serviceGoods.listGoods(null,null,null,null);
            req.getSession().setAttribute("goodsList",goodsList);
            redirect.addAttribute("contentPage","admin/adminProduct.jsp");
            return "redirect:mainForm";
        }else{
            //관리자 권한이 없는경우 메인으로 돌아가게 함
            log.debug("관리자 권한없음");
            return "redirect:mainForm";
        }
    }

    //회원관리
    @GetMapping("/adminUserInfo")
    public String openAdminUserInfo(HttpSession session,RedirectAttributes redirect,HttpServletRequest req){
        dtoMember= (DTOMember) session.getAttribute("member");
        if(dtoMember.getAuthority().equals("admin")){
            pagingUtils.setPaging(10,serviceMember.allUserInfo());
            req.getSession().setAttribute("memberList",(List<DTOMember>)pagingUtils.getPaging(1));
            session.setAttribute("now",1);
            session.setAttribute("pageNum",(int)Math.ceil(pagingUtils.countPaging()/10.0));
            redirect.addAttribute("contentPage","admin/adminUserInfo.jsp");
            return "redirect:mainForm";
        }else{
            //관리자 권한이 없는경우 메인으로 돌아가게 함
            return "redirect:mainForm";
        }

    }
    @GetMapping("/adminUserInfoPage")
    public String pagingNotice(@RequestParam(value = "button",required = false) int button, HttpServletRequest req, RedirectAttributes redirect){
        System.out.println("버튼 항목은"+button);
        HttpSession session = req.getSession(); //세션 생성
        session.setAttribute("memberList",(List<DTOMember>)pagingUtils.getPaging(button));//게시글리스트 받아옴
        session.setAttribute("now",button);
        redirect.addAttribute("contentPage","admin/adminUserInfo.jsp");
        return "redirect:mainForm";
    }
//    @PostMapping("/modifyAction")
//    public int modifyAction(){
//
//        return
//    }
}
