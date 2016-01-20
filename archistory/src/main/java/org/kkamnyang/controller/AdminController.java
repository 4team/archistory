package org.kkamnyang.controller;

import javax.servlet.http.HttpSession;

import org.kkamnyang.domain.AdminDTO;
import org.kkamnyang.domain.AdminVO;
import org.kkamnyang.persistence.CustomUserDetails;
import org.kkamnyang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {

	@Autowired
	AdminService service;
	
	public CustomUserDetails getUser()
    {
        return (CustomUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
	
	@RequestMapping(value = "/login",method=RequestMethod.GET)
	public ModelAndView adminLogin() {
			ModelAndView model = new ModelAndView();
	        System.out.println("로그인화면이 호출되어 /admin/login.jsp를 보낸다.");
	        model.setViewName("admin");

			return model;
	}
	
	@RequestMapping(value = "/logout",method=RequestMethod.GET)
	public void adminLogout() {
		
		System.out.println("로그아웃하여 /admin/logout.jsp를 보낸다.");
		
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
	
	@RequestMapping(value = "/login_success",method=RequestMethod.GET)
	public ModelAndView adminSuccess(Model model) {
		System.out.println("로그인에 성공하여 /login_success.jsp를 보낸다.");
		ModelAndView view = new ModelAndView();
	    view.setViewName("admin");
	    view.addObject("adminno", getUser().getAdminno());
	    view.addObject("name", getUser().getUsername());
	        
		return view;
	}
	
}
