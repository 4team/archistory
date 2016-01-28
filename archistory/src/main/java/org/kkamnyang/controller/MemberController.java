package org.kkamnyang.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.kkamnyang.domain.InviteVO;
import org.kkamnyang.domain.MemberVO;
import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.service.MemberService;
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
@RequestMapping(value="/member/*")
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public void register(@RequestBody MemberVO vo, HttpServletResponse response) throws Exception{
		
		System.out.println("========멤버 등록 POST======");
		System.out.println(vo);
		
		service.register(vo);
		Integer memberno=vo.getMemberno();
		response.getWriter().print(memberno);		
		System.out.println("memberno:"+ memberno);
		System.out.println("========멤버 등록 완료!!======");
		
	}
	
	@RequestMapping(value="/memlist", method=RequestMethod.GET)
	public @ResponseBody List<MemberVO> list(HttpServletRequest request)throws Exception{
		System.out.println("==========멤버 LIST GET 호출=========");
		List<MemberVO> list =service.list();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public MemberVO view(@RequestParam("memberno") Integer memberNo, HttpServletRequest request )throws Exception{
		System.out.println("===========멤버 VIEW GET 호출==============");
		MemberVO vo = service.view(memberNo);
		System.out.println(vo);
		return vo;
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public ResponseEntity<String> modify(MemberVO vo) throws Exception{
		System.out.println("===============멤버 MODIFY POST 호출================");
		ResponseEntity<String> entity = null;
		try{
			service.modify(vo);
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public ResponseEntity<String> remove(@RequestBody MemberVO vo) throws Exception{
		System.out.println("============멤버 REMOVE POST 호출 ===========");
		ResponseEntity<String> entity = null;
		try{
			service.remove(vo.getMemberno());
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
			
		}catch(Exception e){
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	
	public void participate(ParticipateVO vo) throws Exception{
		System.out.println("==="+vo.getMemberno() + "번 유저가 "+ vo.getRouteno() + "번 루트를 처음으로 참여한다.===");
		service.participateF(vo);
		
	}
	
	public void updateParticipate(ParticipateVO vo) throws Exception{
		System.out.println("===Participate의 업데이트가 호출되었다. "+vo.getMemberno()+"번 유저의 이벤트완료.===");
		service.participateU(vo);
	}
	
	public void finish(Integer memberNo)throws Exception{
		service.finish(memberNo);
	}
	
	
	@RequestMapping(value="/inviregister",method=RequestMethod.POST)
	public ResponseEntity<String> inviteRegister(@RequestBody InviteVO vo)throws Exception {
		System.out.println("==============invite 등록 POST 호출==========");
		ResponseEntity<String> entity=null;
		System.out.println(vo);
		
		try{
			service.inviteRegister(vo);
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
			System.out.println("=============invite 등록 성공===============");
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}


	@RequestMapping(value="/list", method=RequestMethod.GET)
	public @ResponseBody List<MemberVO> inviteView(@RequestParam("routeno") Integer routeno, HttpServletRequest request) throws Exception {
	
		List<MemberVO> memList = new ArrayList<MemberVO>();
		List<InviteVO> list = service.inviteView(routeno);
		
		for(int i=0; i<list.size();i++){
			
			InviteVO vo = list.get(i);
			Integer memberno = vo.getMemberno();
			
			MemberVO member = service.view(memberno);
			memList.add(member); 
			System.out.println(member);
		}
		System.out.println(memList);
		return memList;
	}

	
	public void inviteModify(InviteVO vo) throws Exception{
		service.inviteModify(vo);
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public void inviteRemove(Integer inviteno) throws Exception {
		service.inviteRemove(inviteno);
		
	}
	
}
