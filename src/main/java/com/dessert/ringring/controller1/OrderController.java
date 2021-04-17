package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOCart;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.domain.DTOOrderSheet;
import com.dessert.ringring.domain.DTOProductSheet;
import com.dessert.ringring.service.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

    @Slf4j
    @Controller
    public class OrderController {
        @Autowired
        DTOCart dtocart;
        @Autowired
        ServiceCart serviceCart;
        @Autowired
        DTOMember member;
        @Autowired
        ServiceMember serviceMember;
        @Autowired
        ServiceOrderSheet serviceOrderSheet;
        @Autowired
        ServiceProductSheet serviceProductSheet;
        @Autowired
        DTOProductSheet productSheet;
        @Autowired
        DTOOrderSheet orderSheet;

        @GetMapping("/orderForm")
        public String OpenOrderForm(RedirectAttributes redirect, HttpSession session, HttpServletRequest req){
            String id=(String) session.getAttribute("userId");
            //로그인이 안되있을 경우 login페이지로 redirect한다.
            if (id==null || id == ""){
                redirect.addAttribute("contentPage","login/login.jsp");
                return "redirect:mainForm";
            }
            else {
                member=serviceMember.getUserInfo(id);
                int sum=serviceCart.sumMoney(id);
                req.getSession().setAttribute("member",member);
                req.getSession().setAttribute("sum",sum);
                redirect.addAttribute("contentPage", "goods/order.jsp");
                return "redirect:mainForm";
            }
    }

        @PostMapping("/insertOrder")
        public String insertOrder(HttpServletRequest req, Model model,HttpSession session){
            String id= (String) session.getAttribute("userId");

            serviceOrderSheet.insertOrder(req);
          //상품구매후 카트 삭제
            serviceCart.deleteAll(id);
            model.addAttribute("msg","상품 구매가 완료되었습니다.");
            model.addAttribute("url","/");
            return "redirect";
    }

}
