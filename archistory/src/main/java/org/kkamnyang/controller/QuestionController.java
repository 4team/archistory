package org.kkamnyang.controller;


import javax.servlet.http.HttpServletRequest;

import org.kkamnyang.domain.QuestionVO;
import org.kkamnyang.service.QuestionService;
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
@RequestMapping(value="/question/*")
public class QuestionController {

	@Autowired
	QuestionService service;

	@RequestMapping(value="/register" ,method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody QuestionVO vo)throws Exception{
		
		System.out.println("==============문제 등록 POST=================");
		ResponseEntity<String> entity = null;
		System.out.println(vo);
		
		try{
			service.register(vo);
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
			System.out.println("========문제 등록 완료!!======");
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public @ResponseBody QuestionVO view(@RequestParam("eventno") Integer eventno, HttpServletRequest request )throws Exception{
		System.out.println("====문제 VIEW GET 호출됨.");
		QuestionVO result = service.view(eventno);
		System.out.println(result);
		return result;
	}
	
	public void modify(QuestionVO vo) throws Exception{
		service.modify(vo);
	}
	
	public void remove(Integer questionno) throws Exception{
		service.remove(questionno);
	}
	
	
}
