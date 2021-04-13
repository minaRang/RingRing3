package com.dessert.ringring.controller2;

import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.service.ServiceReview;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping("/reviewWrite")
    public String ReviewWrite(@RequestParam(value = "idx",required = false) int idx, HttpServletRequest req, RedirectAttributes redirect){
        req.getSession().setAttribute("productIdx",idx);
        redirect.addAttribute("contentPage","review/reviewWrite.jsp");
        return "redirect:mainForm";
    }

    @PostMapping("/reviewWrite")
    public String ReviewInsert (HttpServletRequest req, Model model, MultipartFile file) throws IOException {
        int result = serviceReview.insertReview(req, file);
        int productIdx=(int)req.getSession().getAttribute("productIdx");
        if (result > 0) {
            model.addAttribute("msg", "후기가 등록되었습니다.");
            model.addAttribute("url", "/goodsDetail?idx="+productIdx);
        } else {
            model.addAttribute("msg", "후기 등록에 실패하였습니다.");
            model.addAttribute("url", "/goodsDetail?idx="+productIdx);
        }

        return "redirect";
    }

    @GetMapping("ReviewUpdate")
    public String ReviewGet(@RequestParam(value = "reviewIdx",required = false) int idx,HttpServletRequest req,RedirectAttributes redirect){
        DTOReview review=serviceReview.getReviewDetail(idx);
        System.out.println(review);
        req.getSession().setAttribute("review",review);
        redirect.addAttribute("contentPage","review/reviewModify.jsp");
        return "redirect:mainForm";
    }
    @PostMapping("/ReviewUpdate")
    public String ReviewUpdate (HttpServletRequest req, Model model, MultipartFile file) throws IOException {
        int result = serviceReview.updateReview(req, file);
        int productIdx=(int)req.getSession().getAttribute("productIdx");
        if (result > 0) {
            model.addAttribute("msg", "후기가 수정되었습니다.");
            model.addAttribute("url", "/goodsDetail?idx="+productIdx);
        } else {
            model.addAttribute("msg", "후기 수정에 실패하였습니다.");
            model.addAttribute("url", "/goodsDetail?idx="+productIdx);
        }

        return "redirect";
    }


    @GetMapping("/ReviewDelete")
    String ReviewDelete(@RequestParam(value = "reviewIdx",required = false) int idx,HttpServletRequest req,Model model){
        int productIdx=(int)req.getSession().getAttribute("productIdx");
        System.out.println("여기까지실행");
        boolean result=serviceReview.deleteReview(idx);
        if (result==true){
            model.addAttribute("msg","후기가 삭제되었습니다");
            model.addAttribute("url","/goodsDetail?idx="+productIdx);}
        else{
            model.addAttribute("msg","오류발생");
            model.addAttribute("url","/goodsDetail?idx="+productIdx);
        }
        return "redirect";
    }

}