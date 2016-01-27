package org.kkamnyang.controller;

import java.util.List;

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

@Controller
@RequestMapping(value="/member/*")
public class MemberController {

	@Autowired
	MemberService service;
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody MemberVO vo) throws Exception{
		ResponseEntity<String> entity = null;
		System.out.println("========멤버 등록 POST======");
		System.out.println("========멤버 등록 시도======");
		System.out.println(vo);

		try{
			service.register(vo);
			entity = new ResponseEntity<String>("result_OK",HttpStatus.OK);
			System.out.println("========멤버 등록 완료!!======");
		}catch(Exception e){
			entity = new ResponseEntity<String>("result_BAD",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	public List<MemberVO> list()throws Exception{
		List<MemberVO> list =service.list();
		return list;
	}
	
	public MemberVO view(Integer MemberNo)throws Exception{
		return service.view(MemberNo);
	}
	
	public void modify(MemberVO vo) throws Exception{
		service.modify(vo);
	}
	
	public void remove(Integer MemberNo) throws Exception{
		service.remove(MemberNo);
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
	
}
