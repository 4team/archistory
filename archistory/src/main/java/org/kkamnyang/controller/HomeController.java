package org.kkamnyang.controller;

import java.util.Locale;
import java.util.UUID;

import org.kkamnyang.domain.AdminVO;
import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.persistence.OurUserDetails;
import org.kkamnyang.service.AdminService;
import org.kkamnyang.service.RouteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws Exception 
	 */
	
	@Autowired
	RouteService route;
	AdminService service;
	
	public OurUserDetails getUser()
    {
        return (OurUserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	public ResponseEntity<String> regist(@RequestBody AdminVO vo) throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println("[어드민의 회원가입]");
		try{
			UUID uid = UUID.randomUUID();
			String key = vo.getUsername()+uid;
			
			System.out.println("생성된 key는? "+key);
			
			vo.setEnablekey(key);
			
			service.regist(vo);
			entity = new ResponseEntity<String>(key,HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail",HttpStatus.OK);
		}
		
		return entity;
	}
	
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public ModelAndView user(Model model) throws Exception {
		ModelAndView view = new ModelAndView();
		try{
	    view.setViewName("user");
	    view.addObject("memberno", getUser().getMemberno());
	    view.addObject("name", getUser().getUsername());
		}catch(Exception e){
			view.setViewName("user");
			view.addObject("memberno",0);
			view.addObject("name","guest");
			System.out.println("-------[ GUEST입장 ]------");
		}
		return view;
	}
	
	@RequestMapping(value = "/userStep")
	public ModelAndView stepKorea(@RequestParam("routeName") String routeName, @RequestParam("routeno") Integer routeno, @RequestParam("lat") double lat, @RequestParam("lng") double lng,@RequestParam("memberno") Integer memberno, Model model) throws Exception{

		System.out.println("사용자가 스텝 루트선택하여 루트여행하러감. ROUTE NUMBER : " + routeno);
		ModelAndView view = new ModelAndView();
		
		view.addObject("routeno", routeno);
			
		try{
			RouteVO vo = route.view(routeno);
			System.out.println("vovovovovovovo:" + vo.toString());
			String routename = vo.getRoutename();
			System.out.println("이벤트 생성페이지로 넘어갈 루트 네임 : "+routename);
			view.addObject("routename", "\""+routename+"\"");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		view.addObject("memberno", memberno);
		view.addObject("routename",routeName);
		
		view.setViewName("userStep");
		
		return view;
	}
	

	@RequestMapping(value="/userNstep")
	public ModelAndView nonstepKorea(@RequestParam("routeName") String routeName, @RequestParam("routeno") Integer routeno, @RequestParam("lat") double lat, @RequestParam("lng") double lng,@RequestParam("memberno") Integer memberno, Model model) throws Exception{
		
		System.out.println("사용자가 논스텝 루트선택하여 루트여행하러감. ROUTE NUMBER : " + routeno);
		ModelAndView view = new ModelAndView();
		
		view.addObject("routeno", routeno);
		
		try{
			RouteVO vo = route.view(routeno);
			System.out.println(vo.toString());
			String routename = vo.getRoutename();
			System.out.println("이벤트 생성페이지로 넘어갈 루트 네임 : "+routename);
			view.addObject("routename", "\""+routename+"\"");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		view.addObject("lat", lat);
		view.addObject("lng", lng);
		view.addObject("memberno", memberno);
		view.addObject("routename",routeName);
		
		view.setViewName("userNstep");
		
		return view;
	}
}
