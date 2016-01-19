package org.kkamnyang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.service.RouteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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
	public @ResponseBody List<RouteVO> list(@Param(value="adminno") int adminno, HttpServletRequest request) throws Exception{
		System.out.println("★모든 루트 리스트의 출력.");
		
		List<RouteVO> result = service.list(adminno);
		return result;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public void createRoute(@RequestBody RouteVO vo,HttpServletResponse response) throws Exception{
		System.out.println("["+vo.getRoutename()+"] 루트 생성 호출됨.=====");
		service.regist(vo);
		Integer nowSequnece = vo.getRouteno();
		response.getWriter().print(nowSequnece);
		
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public @ResponseBody RouteVO view(@RequestParam("routeno") Integer routeno, HttpServletRequest request) throws Exception{
		System.out.println("route view GET 호출됨");
		RouteVO vo = service.view(routeno);
		System.out.println(vo);
		return vo;
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public void modifyRoute(RouteVO vo) throws Exception{
		service.modify(vo);
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public ResponseEntity<String> removeRoute(@RequestBody RouteVO vo) throws Exception{
		System.out.println("route 삭제 Post 호출됨");
		ResponseEntity<String> entity = null;
		try{
			service.remove(vo.getRouteno());
			entity = new ResponseEntity<String>("result",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("result",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
