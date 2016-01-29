package org.kkamnyang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kkamnyang.domain.EventVO;
import org.kkamnyang.service.EventService;
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
@RequestMapping(value="/event/*")
public class EventController {
	
	@Autowired
	EventService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody List<EventVO> list(HttpServletRequest request) throws Exception{
		System.out.println("이벤트 리스트GET 호출됨.");
		List<EventVO> result = service.list();
		System.out.println(service.list());
		return result;
	}
	
	@RequestMapping(value="/elist", method=RequestMethod.GET)
	public @ResponseBody List<EventVO> elist(@RequestParam("routeno")Integer routeno, HttpServletRequest request) throws Exception{
		
		System.out.println("모든 이벤트 리스트 호출됨.=====");
		List<EventVO> result = service.elist(routeno);
		System.out.println(service.elist(routeno));
		return result;
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ResponseEntity<String> createEvent(@RequestBody EventVO vo) throws Exception{
		System.out.println("["+vo.getTitle() + "] 이벤트의 생성 호출됨.=====");
		System.out.println(vo);
		ResponseEntity<String> entity = null;
		try{
			service.regist(vo);
			entity = new ResponseEntity<String>("result",HttpStatus.OK);
			
			
		}catch(Exception e){
			entity = new ResponseEntity<String>("result",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	@RequestMapping(value="/attachCreate", method=RequestMethod.POST)
	public void attachCreate(@RequestBody EventVO vo, HttpServletResponse response) throws Exception{
		System.out.println("["+vo.getTitle() + "] 이벤트 첨부파일생성 호출됨.=====");
		System.out.println(vo);
		
		service.regist(vo);

		Integer nowSequence = vo.getEventno();
		response.getWriter().print(nowSequence);
		vo.setEventno(nowSequence);
		service.attachCreate(vo);
		System.out.println("이벤트 넘버:"+nowSequence);
		
	}
	
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public @ResponseBody EventVO view(@RequestParam("eventno") Integer eventno, HttpServletRequest request ) throws Exception{
		System.out.println("Event View GET 호출됨.");
		EventVO result = service.view(eventno);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public ResponseEntity<String> modifyEvent(@RequestBody EventVO vo) throws Exception{
		System.out.println("Event 수정 POST 호출됨.");
		ResponseEntity<String> entity = null;
		
		try{
			service.modify(vo);
			entity = new ResponseEntity<String>("result",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("result", HttpStatus.BAD_REQUEST);		
		}
		return entity;
	}
	
	@RequestMapping(value="/attachModify", method = RequestMethod.POST)
	public ResponseEntity<String> attachModify(@RequestBody EventVO vo) throws Exception{
		System.out.println("컨트롤러에 첨부파일수정 POST 호출됨.");
		ResponseEntity<String> entity = null;		
		try{
			service.attachModify(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);		
		}
		return entity;
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public ResponseEntity<String> removeEvent(@RequestBody EventVO vo) throws Exception{
		System.out.println("Event 삭제 POST 호출됨.");
		ResponseEntity<String> entity = null;
		
		try{
			service.remove(vo.getEventno());
			entity = new ResponseEntity<String>("result",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("result",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	  
	  @RequestMapping(value="/getAttach/{eventno}")
	  @ResponseBody
	  public List<String> getEattach(@PathVariable("eventno")Integer eventno)throws Exception{
		System.out.println("첨부파일이 로드됨...");
		System.out.println(service.getAttach(eventno));
		return service.getAttach(eventno);  
	  }
	  
	  @RequestMapping(value="/getByOrder")
	  public EventVO getByOrder(@RequestParam("routeno")Integer routeno,@RequestParam("order")Integer eorder){
		  System.out.println("[GET BY ORDER 호출] "+routeno+"번 루트의 "+eorder+"번째 이벤트 ");
		  EventVO vo = new EventVO();
		  vo.setRouteno(routeno);
		  vo.setEorder(eorder);
		  
		  EventVO result = null;
		  
			ResponseEntity<String> entity = null;
			
			try{
				result = service.getByOrder(vo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<String>("FAIL",HttpStatus.BAD_REQUEST);
			}
		  
		  return result;
		  
	  }
	  
	  
}
