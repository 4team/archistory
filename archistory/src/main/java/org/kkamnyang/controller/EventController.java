package org.kkamnyang.controller;

import org.kkamnyang.domain.EventVO;
import org.kkamnyang.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/event/*")
public class EventController {
	
	@Autowired
	EventService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model) throws Exception{
		System.out.println("이벤트 리스트GET 호출됨.");
		model.addAttribute("list",service.list());
	}
	
	@RequestMapping(value="/create", method=RequestMethod.POST)
	public void createEvent(@RequestBody EventVO vo) throws Exception{
		System.out.println("event create POST controller 호출됨~~");
		System.out.println(vo);
		service.regist(vo);
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
