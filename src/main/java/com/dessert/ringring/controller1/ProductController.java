package com.dessert.ringring.controller1;

import com.dessert.ringring.domain.DTOGoods;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.service.ServiceCart;
import com.dessert.ringring.service.ServiceGoods;
import com.dessert.ringring.service.ServiceReview;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class ProductController {

    @Autowired
    ServiceGoods goods;
    @Autowired
    DTOGoods dtoGoods;
    @Autowired
    DTOMember member;
    @Autowired
    ServiceCart cart;
    @Autowired
    DTOReview review;
    @Autowired
    ServiceReview serviceReview;

    //상품 리스트 불러오기
    @GetMapping("/productList")
    public String productList(@RequestParam(value="category", required = false)String category,@RequestParam(value="sub", required = false)String sub,HttpServletRequest req, RedirectAttributes redirect) {
        log.debug("openBoardList");

        List<DTOGoods> goodsList=goods.listGoods(category,sub);
        req.getSession().setAttribute("list",goodsList);
        if (category!=null){
            List<String> subList=new ArrayList<String>();
            if(category.equals("cookie")) {
                subList.add("Butter");
                subList.add("vegan");
                subList.add("pet");
            }
            else if(category.equals("bread")) {
                subList.add("Bread");
                subList.add("Cake");
            }
            else if(category.equals("drink")) {
                subList.add("Juice");
                subList.add("Alcohol");
            }
            req.getSession().setAttribute("category",category);
            req.getSession().setAttribute("subCategory",subList);
        }


        redirect.addAttribute("contentPage","goods/listGoods.jsp");
        return "redirect:mainForm";
    }

    //상품 디테일 불러오기
    @GetMapping("/goodsDetail")
    public String productDetail(HttpServletRequest req,RedirectAttributes redirect){
        int productIdx=Integer.parseInt(req.getParameter("idx"));

        dtoGoods=goods.getInfoGoods(productIdx);
        System.out.println(dtoGoods);
        req.getSession().setAttribute("goods",dtoGoods);
        req.getSession().setAttribute("productIdx",productIdx);

        //리뷰불러오기
        List<DTOReview> reviews=serviceReview.getReviewList(productIdx);
        req.getSession().setAttribute("reviews",reviews);

        redirect.addAttribute("contentPage","goods/goodsDetail.jsp");
        return "redirect:mainForm";
    }

    //상품 등록하기
    @GetMapping("/insertGoods")
    String openGoodsInsertForm(RedirectAttributes redirect){
        redirect.addAttribute("contentPage","goods/goodsInsert.jsp");
        return "redirect:mainForm";
    }

    @PostMapping("/insertGoods")
    String insertGoods(HttpServletRequest req, Model model, MultipartFile file) throws IOException {
        log.debug(String.valueOf(file));
        int result = goods.insertGoods(req,file);
        if (result>0){
            model.addAttribute("msg","상품이 등록되었습니다");
            model.addAttribute("url","/");
        }else{
            model.addAttribute("msg","상품등록 실패하였습니다");
            model.addAttribute("url","/");
        }
        return "redirect";
    }

    //상품 삭제
    @PostMapping("/goodsDelete")
    String goodsDelete(HttpServletRequest req,Model model){
        int idx=goods.deleteGoods(Integer.parseInt(req.getParameter("idx")));
        goods.deleteGoods(idx);

        model.addAttribute("msg","상품삭제되었습니다");
        model.addAttribute("url","goods/listGoods");
        return "redirect";

    }

    //상품 수정
    @GetMapping("/modifyGoods")
    String goodsModifyOpen(HttpServletRequest req,RedirectAttributes redirect){
        int idx = Integer.parseInt(req.getParameter("idx"));
        dtoGoods=goods.getInfoGoods(idx);
        req.getSession().setAttribute("goods",goods);

        redirect.addAttribute("contentPage","goods/goodsModify");

        return "redirect:mainForm";
    }

    @PostMapping("/modifyGoods")
    String goodsModify(HttpServletRequest req,Model model){
        goods.updateGoods(req);
        model.addAttribute("msg","상품수정되었습니다");
        model.addAttribute("url","goods/listGoods");
        return "redirect";
    }

    @PostMapping("/addCart")
    public String addCart(HttpSession session,HttpServletRequest req,Model model){
        member=(DTOMember)session.getAttribute("member");
        String id=member.getId();
        int productIdx=Integer.parseInt(req.getParameter("productIdx"));
        int check=cart.checkCart(id,productIdx);
        int result=0;
        if(member != null && check==0){
            cart.insertCart(req,member);
            result=1;
        }
        if(result==1) {
            model.addAttribute("msg", "상품이 담겼습니다");
            model.addAttribute("url", "/productList");
        }
        if(result==0) {
            model.addAttribute("msg", "이미 담긴 상품입니다");
            model.addAttribute("url", "/productList");
        }

    return "redirect";
    }

    @PostMapping("/search")
    public String searchGoods(HttpServletRequest req,RedirectAttributes redirect){
        String param=req.getParameter("search");
        List<DTOGoods> list=goods.searchGoods(param);
        req.getSession().setAttribute("list",list);
        redirect.addAttribute("contentPage","goods/searchGoods.jsp");

        return "redirect:mainForm";
    }
}
