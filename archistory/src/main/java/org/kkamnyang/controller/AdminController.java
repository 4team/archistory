package org.kkamnyang.controller;

import javax.servlet.http.HttpSession;

import org.kkamnyang.domain.AdminDTO;
import org.kkamnyang.domain.AdminVO;
import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.persistence.AdminDetails;
import org.kkamnyang.service.AdminService;
import org.kkamnyang.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin/*")
public class AdminController {

	@Autowired
	AdminService service;
	
	public AdminDetails getUser()
    {
        return (AdminDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
	
	@RequestMapping(value = "/login",method=RequestMethod.GET)
	public void adminLogin() {
	        System.out.println("로그인화면이 호출되어 /admin/login.jsp를 보낸다.");
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
	    view.setViewName("admin/admin");
	    view.addObject("adminno", getUser().getAdminno());
	    view.addObject("name", getUser().getUsername());

		return view;
	}
	
	@RequestMapping(value = "/close")
	public ModelAndView close(@RequestParam("adminno") Integer adminno, @RequestParam("lat") double lat, @RequestParam("lng") double lng,@RequestParam("height") double height, Model model) throws Exception{

		System.out.println("루트를 생성하는 CLOSE페이지를 호출해서 보내준다.");
		ModelAndView view = new ModelAndView();
		
		view.addObject("adminno", adminno);
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		view.addObject("height", height);
		
		view.setViewName("admin/close");
		
		return view;
	}
	
	@RequestMapping(value = "/korea")
	public ModelAndView korea(@RequestParam("adminno") Integer adminno, @RequestParam("lat") double lat, @RequestParam("lng") double lng,@RequestParam("height") double height, Model model) throws Exception{

		System.out.println("루트를 생성하는 Korea페이지를 호출해서 보내준다.");
		ModelAndView view = new ModelAndView();
		
		view.addObject("adminno", adminno);
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		view.addObject("height", height);
		
		view.setViewName("admin/korea");
		
		return view;
	}
	
	@RequestMapping(value = "/other")
	public ModelAndView otherNation(@RequestParam("adminno") Integer adminno, @RequestParam("lat") double lat, @RequestParam("lng") double lng,@RequestParam("height") double height, Model model) throws Exception{
		
		System.out.println("루트를 생성하는 Korea페이지를 호출해서 보내준다.");
		ModelAndView view = new ModelAndView();
		
		view.addObject("adminno", adminno);
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		view.addObject("height", height);
		
		view.setViewName("admin/other");
		
		return view;
	}
	
	@RequestMapping(value = "/step_kor")
	public ModelAndView stepKorea(@RequestParam("routeno") Integer routeno, @RequestParam("lat") double lat, @RequestParam("lng") double lng, Model model) throws Exception{

		System.out.println("[한국]에 STEP [루트를 생성]하였다. 이벤트 생성페이지를 보내준다.");
		ModelAndView view = new ModelAndView();
		
		view.addObject("routeno", routeno);
		try{
		RouteService service = new RouteService();
		RouteVO vo = service.view(routeno);
		System.out.println(vo.toString());
		String routename = vo.getRoutename();
		System.out.println("이벤트 생성페이지로 넘어갈 루트 네임 : "+routename);
		view.addObject("routename", routename);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		
		view.setViewName("admin/step_kor");
		
		return view;
	}
	

	@RequestMapping(value="/nonstep_kor", method=RequestMethod.GET)
	public ModelAndView nonstepKorea(@RequestParam("routeno") Integer routeno, @RequestParam("lat") double lat, @RequestParam("lng") double lng, Model model) throws Exception{
		
		System.out.println("[한국]에 NONSTEP [루트를 생성]하였다. 이벤트 생성페이지를 보내준다.");
		ModelAndView view = new ModelAndView();
		
		view.addObject("routeno", routeno);
		
		RouteVO vo = new RouteService().view(routeno);
		String routename = vo.getRoutename();
		
		view.addObject("routename", routename);
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		
		view.setViewName("admin/nonstep_kor");
		
		return view;
	}
	
}
