package com.dessert.ringring.controller1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {

	 @GetMapping("/")
	 public String main() {

	 	return "redirect:mainForm";
	 }
	 
	   @GetMapping("/mainForm")
			public String MainForm( HttpServletRequest req ) {
							
				System.out.println( "msg:" + req.getParameter("msg"));
				req.getSession().setAttribute("msg", req.getParameter("msg"));

		        return "mainForm"; //mainForm.jsp 호출
		    }
}
