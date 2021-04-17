package com.dessert.ringring.controller1;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.service.ServiceMember;


@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	ServiceMember serviceMember;
	@Autowired
	DTOMember member;
	
	@RequestMapping("/logout")
	public String logout(HttpSession session,RedirectAttributes redirect) {
		
		log.debug("로그아웃");
		session.invalidate();
	
		return "redirect:mainForm";	
		}
	
	@GetMapping("/login")
	public String loginView(RedirectAttributes redirect,HttpSession session) {
		
		String id=(String) session.getAttribute("userId");
		//로그인한 상태이면 로그인페이지에 접근 못함
		if(id == null) {
			redirect.addAttribute("contentPage","login/login.jsp");
			return "redirect:mainForm";	
		}else {
			return "redirect:mainForm";

		}
		
		
	}
	
	
	@PostMapping("/loginAction")
	public String loginAction(HttpServletRequest req,Model model) {
		
		String id=req.getParameter("id");
		member=serviceMember.getUserInfo(id);
		int result = serviceMember.login(req);
		
		
		if(result<=0 ||member.equals(null)) {
			log.debug("로그인 실패");
			model.addAttribute("msg","로그인 실패-아이디나 암호를 확인해주세요");
			model.addAttribute("url","/login");
			
		}
		else if(member.getIsEnable().equals("N")){
			log.debug("아직 이메일 인증받지않은 상태");
			model.addAttribute("msg","로그인 실패-이메일 인증해주세요");
			model.addAttribute("url","/");
			
		}
		else {
			HttpSession session=req.getSession();
			session.setAttribute("member",member);
			session.setAttribute("userId",member.getId());
			session.setAttribute("userName",member.getName());
			session.setAttribute("authority",member.getAuthority());
			
			model.addAttribute("msg",member.getId()+"님 로그인 되셨습니다");
			model.addAttribute("url","/");
		}
		
		return "redirect";
	}
	
}
