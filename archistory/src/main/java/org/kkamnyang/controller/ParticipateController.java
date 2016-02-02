package org.kkamnyang.controller;

import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.persistence.ParticipateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/participate/*")
public class ParticipateController {
	
	@Autowired
	private ParticipateMapper mapper;
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ResponseEntity<String> participate(@RequestBody ParticipateVO vo) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try{
			System.out.println("[ 유저의 참여시작 ]");
			mapper.create(vo);
			Integer thisNo = vo.getParticipateno();
			System.out.println(thisNo);
			
			entity = new ResponseEntity<String>(thisNo.toString(),HttpStatus.OK);
		}catch(Exception e){
			entity = new ResponseEntity<String>("Sorry...",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/next",method=RequestMethod.POST)
	public ResponseEntity<String> nextStage(@RequestBody ParticipateVO vo)throws Exception{
		ResponseEntity<String> entity = null;
		
		try{
			System.out.println("[ 유저의 다음스테이지 ]");
			mapper.update(vo);
			entity = new ResponseEntity<String>("Next!",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("Fail...",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping(value="/finish", method=RequestMethod.POST)
	public ResponseEntity<String> finishRoute(@RequestBody ParticipateVO vo) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		try{
			System.out.println("[ 유저의 루트클리어 ]");
			mapper.finish(vo);
			entity = new ResponseEntity<String>("Well Done!",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>("ERROR!",HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
}
