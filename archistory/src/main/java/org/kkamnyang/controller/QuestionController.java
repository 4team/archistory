package org.kkamnyang.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kkamnyang.domain.EventVO;
import org.kkamnyang.domain.QuestionVO;
import org.kkamnyang.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<String> modify(@RequestBody QuestionVO vo) throws Exception{
		System.out.println("=======문제 수정 POST 호출됨.==========");
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		
		try{
			service.modify(vo);
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
		    System.out.println("==============문제 수정 완료 !!===============");
		}catch(Exception e){
			//e.printStackTrace();
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody EventVO vo) throws Exception{
		System.out.println("=======문제 삭제 POST 호출됨=======");
		ResponseEntity<String> entity = null;
		try{
			service.remove(vo.getEventno());
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
			System.out.println("===========문제 삭제 완료 =============");
		}catch(Exception e){
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/attachCreate", method=RequestMethod.POST)
	public void attachCreate(@RequestBody QuestionVO vo, HttpServletResponse response) throws Exception{
		System.out.println("::문제:: 첨부파일생성 호출됨.=====");
		System.out.println(vo);
		
		service.register(vo);

		Integer nowSequence = vo.getQuestionno();
		response.getWriter().print(nowSequence);
		vo.setQuestionno(nowSequence);
		service.attachCreate(vo);
		System.out.println("문제 넘버:"+nowSequence);
		
	}
	
	 @RequestMapping(value="/getAttach/{questionno}")
	  @ResponseBody
	  public List<String> getEattach(@PathVariable("questionno")Integer questionno)throws Exception{
		System.out.println("::문제::첨부파일이 로드됨...");
		System.out.println(service.getAttach(questionno));
		return service.getAttach(questionno);  
	  }
	
	
}
