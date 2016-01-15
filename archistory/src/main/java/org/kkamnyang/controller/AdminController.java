package org.kkamnyang.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.kkamnyang.domain.AdminDTO;
import org.kkamnyang.domain.AdminVO;
import org.kkamnyang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {

	@Autowired
	AdminService service;
	
	@RequestMapping(value = "/login")
	public String admin(Locale locale, Model model) {
		System.out.println("로그인에 성공하여 admin.jsp를 보낸다.");

		
		return "admin";
	}
	
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public void login(@RequestBody AdminDTO dto, HttpSession session, Model model) throws Exception{
		System.out.println("누군가의 로그인 시도==================");
		AdminVO vo = service.login(dto);

		if(vo != null){
			System.out.println("["+vo.getUsername() + "] Admin이 로그인 하였다.");
			session.setAttribute("LOGIN", vo);
			model.addAttribute("adminVO",vo);
		}else{
			System.out.println("Admin계정에 없는 게스트의 로그인 시도였다.");
		}

	}
	
}
