package org.kkamnyang.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/route/*")
public class RouteController{
		
	
	
	@Autowired
	RouteService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody List<RouteVO> list(HttpServletRequest request) throws Exception{
		System.out.println("====================");
		System.out.println("★모든 루트 리스트의 출력.");
		System.out.println("====================");

		List<RouteVO> result = service.list();
		System.out.println(service.list());
		return result;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public void createRoute(@RequestBody RouteVO vo) throws Exception{
		System.out.println("create controller 호출됨~~");
		System.out.println(vo);
		service.regist(vo);
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void view(@RequestParam("routeno") Integer routeno,Model model) throws Exception{
		RouteVO vo = service.view(routeno);
		model.addAttribute("ROUTE", vo);
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public void modifyRoute(RouteVO vo) throws Exception{
		service.modify(vo);
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public void removeRoute(@RequestParam("routeno") Integer routeno, Model model) throws Exception{
		service.remove(routeno);
	}
}
