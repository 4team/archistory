package org.kkamnyang.controller;


import org.kkamnyang.domain.QuestionVO;
import org.kkamnyang.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	public QuestionVO view(Integer questionno)throws Exception{
		return service.view(questionno);
	}
	
	public void modify(QuestionVO vo) throws Exception{
		service.modify(vo);
	}
	
	public void remove(Integer questionno) throws Exception{
		service.remove(questionno);
	}
	
	
}
