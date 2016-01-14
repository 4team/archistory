package org.kkamnyang.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kkamnyang.domain.EventVO;
import org.kkamnyang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public ResponseEntity<String> createEvent(@RequestBody EventVO vo) throws Exception{
		System.out.println("event create POST controller 호출됨~~");
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
	
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void view(@RequestParam("eventno") Integer eventno,Model model) throws Exception{
		System.out.println("Event View GET 호출됨.");
		EventVO vo = service.view(eventno);
		model.addAttribute("event", vo);
	}
	
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public void modifyEvent(EventVO vo) throws Exception{
		System.out.println("Event 수정 POST 호출됨.");
		service.modify(vo);
	}
	
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public void removeEvent(@RequestParam("eventno") Integer eventno, Model model) throws Exception{
		System.out.println("Event 삭제 POST 호출됨.");
		service.remove(eventno);
	}
}
