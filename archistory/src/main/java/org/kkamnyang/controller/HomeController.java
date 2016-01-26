package org.kkamnyang.controller;

import java.util.Locale;

import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.service.RouteService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "home";
	}
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String user(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		return "user";
	}
	
	@RequestMapping(value = "/userStep")
	public ModelAndView stepKorea(@RequestParam("routeno") Integer routeno, @RequestParam("lat") double lat, @RequestParam("lng") double lng, Model model) throws Exception{

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
		
		view.setViewName("userStep");
		
		return view;
	}
	

	@RequestMapping(value="/userNstep")
	public ModelAndView nonstepKorea(@RequestParam("routeno") Integer routeno, @RequestParam("lat") double lat, @RequestParam("lng") double lng, Model model) throws Exception{
		
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
		
		view.setViewName("userNstep");
		
		return view;
	}
}
