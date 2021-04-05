package com.dessert.ringring.controller2;

import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.service.ServiceReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

@Controller
public class reviewController {
    @Autowired
    DTOReview review;
    @Autowired
    ServiceReview serviceReview;

    @GetMapping("/ReviewList")
    public String ReviewList(HttpServletRequest req,RedirectAttributes redirect){
        int productIdx=Integer.parseInt(req.getParameter("idx"));
        //리뷰불러오기
        List<DTOReview> reviews=serviceReview.getReviewList(productIdx);
        System.out.println(productIdx+"의 리뷰불러옴");
        System.out.println(reviews);
        req.getSession().setAttribute("reviews",reviews);

        redirect.addAttribute("contentPage","goods/goodsDetail.jsp");
        return "redirect:goods/goodsDetail";
    }

    @GetMapping("/ReviewWrite")
    public String ReviewWrite(HttpServletRequest req,RedirectAttributes redirect){
        req.getSession().setAttribute("reviewPage","../review/reviewWrite.jsp");
        int productIdx=(int)req.getSession().getAttribute("productIdx");
        return "redirect:goodsDetail?idx="+productIdx;
        //goodsDetail?idx=${list.idx}
    }

    @PostMapping("/ReviewWrite")
    public String ReviewInsert (HttpServletRequest req, Model model, MultipartFile file) throws IOException {
        int result = serviceReview.insertReview(req, file);
        int productIdx=(int)req.getSession().getAttribute("productIdx");
        if (result > 0) {
            model.addAttribute("msg", "게시글이 등록되었습니다.");
            model.addAttribute("url", "/goodsDetail?idx="+productIdx);
        } else {
            model.addAttribute("msg", "게시글이 등록에 실패하였습니다.");
            model.addAttribute("url", "/goodsDetail?idx="+productIdx);
        }
        req.getSession().setAttribute("reviewPage",null);
        return "redirect";
    }

    @GetMapping("/ReviewDelete")
    String ReviewDelete(HttpServletRequest req,Model model){
        int productIdx=(int)req.getSession().getAttribute("productIdx");
        int idx = Integer.parseInt(req.getParameter("idx"));
        System.out.println("idx:"+idx+"pInx: "+productIdx);
        boolean result=serviceReview.deleteReview(Integer.parseInt(req.getParameter("idx")),productIdx);
        if (result==true){
            model.addAttribute("msg","글이 삭제되었습니다");
            model.addAttribute("url","/goodsDetail?idx="+productIdx);}
        else{
            model.addAttribute("msg","오류발생");
            model.addAttribute("url","/goodsDetail?idx="+productIdx);
        }
        return "redirect";
    }

}