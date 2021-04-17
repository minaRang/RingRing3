package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOCart;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.service.ServiceCart;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@Controller
public class CartController {
    @Autowired
    DTOMember member;
    @Autowired
    DTOCart cart;
    @Autowired
    ServiceCart cartMapper;

    @GetMapping("/cart")
    public String OpenCart(@RequestParam(value = "member",required = false) DTOMember member,RedirectAttributes redirect, HttpServletRequest req){
        if(member !=null) {

            String id = member.getId();
            List<DTOCart> listCart = cartMapper.listCart(id);

            req.getSession().setAttribute("list", listCart);
            redirect.addAttribute("contentPage", "goods/cart.jsp");

            return "redirect:mainForm";
        }else{
            return "redirect:mainForm";
        }
        }


    @ResponseBody
    @PostMapping("/deleteCart")
    public int deleteCart(HttpSession session, @RequestParam(value = "chbox[]") List<String> chArr) throws Exception {
        member = (DTOMember) session.getAttribute("member");

        String userId = member.getId();

        int result = 0;
        int cartNum = 0;

        // 로그인 여부 구분
        if(member != null) {
            cart.setId(userId);

            for(String i : chArr) {  // 에이젝스에서 받은 chArr의 갯수만큼 반복
                cartNum = Integer.parseInt(i);  // i번째 데이터를 cartNum에 저장
                cart.setCartIdx(cartNum);
                cartMapper.deleteCart(cart);
            }
            result = 1;
        }
        return result;
    }
}
