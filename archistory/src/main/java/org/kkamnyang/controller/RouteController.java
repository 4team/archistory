package org.kkamnyang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.kkamnyang.domain.ParticipateVO;
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
	
	@RequestMapping(value="/listAll",method=RequestMethod.GET)
	public @ResponseBody List<RouteVO> listAll(HttpServletRequest request) throws Exception{
		System.out.println("★모든 루트 리스트의 출력.");
		List<RouteVO> result = service.listAll();
		return result;
	}
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody List<RouteVO> list(@Param(value="adminno") int adminno, HttpServletRequest request) throws Exception{
		System.out.println(adminno + "번 ADMIN의 루트리스트 출력.");
		List<RouteVO> result = service.list(adminno);
		return result;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public void createRoute(@RequestBody RouteVO vo,HttpServletResponse response) throws Exception{
		System.out.println("["+vo.getRoutename()+"] 루트 생성 호출됨.=====");
		service.regist(vo);
		Integer nowSequnece = vo.getRouteno();
		response.getWriter().print(nowSequnece);
		System.out.println("routeno:"+nowSequnece);
		
	}
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public @ResponseBody RouteVO view(@RequestParam("routeno") Integer routeno, HttpServletRequest request) throws Exception{
		System.out.println("route view GET 호출됨");
		RouteVO vo = service.view(routeno);
		System.out.println(vo);
		return vo;
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public ResponseEntity<String> modifyRoute(@RequestBody RouteVO vo) throws Exception{
		System.out.println("===========루트 수정 POST 호출됨.=============");
		ResponseEntity<String> entity = null;
		
		try{
			service.modify(vo);
			entity = new ResponseEntity<String>("result", HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);	
		}
		
		return entity;
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public ResponseEntity<String> removeRoute(@RequestBody RouteVO vo) throws Exception{
		System.out.println("route 삭제 Post 호출됨");
		ResponseEntity<String> entity = null;
		try{
			System.out.println(vo.getRouteno()+"번 루트 삭제... 시도 시작");
			service.remove(vo.getRouteno());
			System.out.println("삭제 완료");
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.getStackTrace();
			e.getMessage();
			entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
}
