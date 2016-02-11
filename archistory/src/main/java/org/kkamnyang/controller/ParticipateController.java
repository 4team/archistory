package org.kkamnyang.controller;

import java.util.List;

import org.kkamnyang.domain.FinishRouteVO;
import org.kkamnyang.domain.PageVO;
import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.domain.RankingVO;
import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.persistence.ParticipateMapper;
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
	
	@RequestMapping(value="/finishList")
	public @ResponseBody List<RouteVO> finishList(@RequestParam("memberno")Integer memberno) throws Exception{
		System.out.println("[ 유저가 완주한 루트의 리스트 출력 ]");
		return mapper.finishList(memberno);
	}
	
	@RequestMapping(value="/finishRoute")
	public @ResponseBody FinishRouteVO finishList(@RequestParam("memberno")Integer memberno,@RequestParam("routeno")Integer routeno,@RequestParam("page")Integer page, Model model) throws Exception{
		
		System.out.println("[ 유저가 완주한 루트의 상세페이지 ] Page : "+page);
		PageVO vo = new PageVO();
		vo.setMemberno(memberno);
		vo.setRouteno(routeno);
		vo.setPage(page);
		
		FinishRouteVO result = mapper.finishRoute(vo);
		System.out.println(result.getLastdate()+" LAST DATE");
		model.addAttribute("date", result.getLastdate().toString());
		return result;
	}
	
	@RequestMapping(value="/ranking")
	public @ResponseBody List<RankingVO> ranking(@RequestParam("routeno") Integer routeno) throws Exception{
		return mapper.ranking(routeno);
	}
	
	@RequestMapping(value="/finishRouteCount", method=RequestMethod.POST)
	public int finishRouteCount(@RequestBody PageVO vo) throws Exception{
		return mapper.finishRouteCoute(vo);
	}
	
}
