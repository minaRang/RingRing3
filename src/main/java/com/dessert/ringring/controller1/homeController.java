package com.dessert.ringring.controller1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dessert.ringring.domain.DTOGoods;
import com.dessert.ringring.service.ServiceGoods;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
@Slf4j
@Controller
public class homeController {
	@Autowired
	ServiceGoods serviceGoods;

	 @GetMapping("/")
	 public String main(HttpServletRequest req,RedirectAttributes redirect) {
		 List<DTOGoods> goods = serviceGoods.listGoods(); //상품 리스트 받아옴
		 HttpSession session = req.getSession(); //세션 생성
		 session.setAttribute("list",goods);
		 return "redirect:mainForm";
	 }
	 
	 @GetMapping("/mainForm")
	 public String MainForm( HttpServletRequest req ) {
	 	log.debug("msg"+req.getParameter("msg"));
	 	req.getSession().setAttribute("msg", req.getParameter("msg"));


	 	return "mainForm"; //mainForm.jsp 호출
		    }


}
