package com.dessert.ringring.controller1;

import java.io.UnsupportedEncodingException;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.service.ServiceMember;

@Slf4j
@Controller
public class JoinController {

	@Autowired
	ServiceMember serviceMember;
	@Autowired
	DTOMember vo;
	
	@Inject
	JavaMailSender mailSender;
	
	@GetMapping("/join")
	public String joinView(HttpSession session,RedirectAttributes redirect) {
		
		String id=(String) session.getAttribute("userId");

		//로그인한 상태이면 회원가입페이지에 접근 못함
		if(id == null) {
			redirect.addAttribute("contentPage","join/join.jsp");
			return "redirect:mainForm";	
			
		}else {
			
			return "redirect:mainForm";

		}
	
	}
	
	@PostMapping("/joinAction")
	public String joinAction(@Valid HttpServletRequest req,RedirectAttributes redirect) throws MessagingException, UnsupportedEncodingException {
		
		serviceMember.joinMember(req);
//		MailHandler sendMail=new MailHandler(mailSender);
//		
//		sendMail.setSubject("이메일 인증입니다");
//		sendMail.setText(new StringBuffer().append("<h3>이메일 인증</h3>")
//				.append("<a href='http://localhost:8081/join/verify.do?email=" +vo.getEmail())
//				.append("' target='_blenk'>이메일 인증 확인</a>").toString());
//				
//		sendMail.setFrom("RingRingDessert@RingRing.com", "admin");
//		sendMail.setTo(vo.getEmail());
//		sendMail.send();

		redirect.addAttribute("contentPage","/mainForm");

		return "redirect:mainForm";
	}

	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(@RequestBody String memberId){
		int count =0;
		count=serviceMember.overLapId(memberId);
		return count;
	}

	@GetMapping("/join/verify")
	public String joinSuccess(@ModelAttribute("member")DTOMember member,Model model) {
		log.debug("이메일 인증 처리");
		String id = member.getId();
		serviceMember.verifyMember(id);
		
		model.addAttribute("msg","인증이 완료되었습니다");
		model.addAttribute("url","/");
		
		return "redirect";
				
	}
}
