package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.domain.DTOOrderSheet;
import com.dessert.ringring.domain.DTOProductSheet;
import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.service.ServiceMember;
import com.dessert.ringring.service.ServiceOrderSheet;
import com.dessert.ringring.service.ServiceProductSheet;
import com.dessert.ringring.service.ServiceReview;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
@Slf4j
@Controller
public class MypageController {
    @Autowired
    ServiceMember serviceMember;
    @Autowired
    ServiceOrderSheet serviceOrderSheet;
    @Autowired
    DTOOrderSheet orderSheet;
    @Autowired
    DTOProductSheet productSheet;
    @Autowired
    ServiceProductSheet serviceProductSheet;
    @Autowired
    ServiceReview serviceReview;
    @Autowired
    DTOReview review;

    @GetMapping("/orderContents")
    public String Openmypage(RedirectAttributes redirect,HttpSession session,HttpServletRequest req){
        String id= (String) session.getAttribute("userId");
        List<DTOOrderSheet> orderList=serviceOrderSheet.orderList(id);
        req.getSession().setAttribute("list",orderList);
        redirect.addAttribute("contentPage","myPage/orderContents.jsp");

        return "redirect:mainForm";
    }
    @GetMapping("/orderDetail")
    public String OpenOrderDetail(HttpServletRequest req,RedirectAttributes redirect){
        int idx=Integer.parseInt(req.getParameter("idx"));
        orderSheet=serviceOrderSheet.getInfoOrderIdx(idx);
        String orderNum=orderSheet.getOrderNum();
        List<DTOProductSheet> productSheetList=serviceProductSheet.listProductsheetDetail(orderNum);

        req.getSession().setAttribute("orderDetail",orderSheet);
        req.getSession().setAttribute("productList",productSheetList);

        redirect.addAttribute("contentPage","myPage/orderDetail.jsp");
        return "redirect:mainForm";
    }

    @GetMapping("/myInfoModify")
    public String OpenMyInfo(RedirectAttributes redirect){
        redirect.addAttribute("contentPage","myPage/myInfoModify.jsp");

        return "redirect:mainForm";
    }

    @PostMapping("/myInfoModify")
    public String ModifyMyInfo(HttpSession session, Model model, HttpServletRequest req){
        String id= (String) session.getAttribute("userId");
        serviceMember.updateMember(id,req);
        model.addAttribute("msg","수정되었습니다");
        model.addAttribute("url","/orderContents");
        return "redirect";
    }

    //리뷰
    @GetMapping("/productReview")
    public String productReview(HttpSession session,RedirectAttributes redirect){
        String id= (String) session.getAttribute("userId");
        List<DTOReview> reviews=serviceReview.getMyReviewList(id);
        session.setAttribute("myReviews",reviews);

        redirect.addAttribute("contentPage","myPage/productReview.jsp");
        return "redirect:mainForm";
    }

    //리뷰상세
    @GetMapping("/productReviewDetail")
    public String productReviewDetail(@RequestParam(value = "idx",required = false) long idx,HttpServletRequest req, RedirectAttributes redirect){
        DTOReview review=serviceReview.getReviewDetail(idx);
        HttpSession session = req.getSession(); //세션 생성
        session.setAttribute("myReview",review);

        redirect.addAttribute("contentPage","myPage/productReviewDetail.jsp");
        return "redirect:mainForm";
    }
    //적립금페이지
    @GetMapping("/point")
    public String openPoint(RedirectAttributes redirect){
        redirect.addAttribute("contentPage","myPage/myPoint.jsp");
        return "redirect:mainForm";
    }
}
