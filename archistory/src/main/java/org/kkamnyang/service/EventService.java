package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.EventVO;
import org.kkamnyang.persistence.EventMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class EventService {

	@Autowired
	EventMapper mapper;
	
	public List<EventVO> list() throws Exception{
		return mapper.list();
	}
	
	public List<EventVO> elist(Integer routeno) throws Exception{
		return mapper.elist(routeno);
	}

	public int regist(EventVO vo) throws Exception{
		return mapper.create(vo);
	}
	
	public EventVO view(Integer eventno) throws Exception{
		return mapper.read(eventno);
	}
	
	public void modify(EventVO vo) throws Exception{
		mapper.update(vo);
	}
	
	public void remove(Integer eventno) throws Exception{
		mapper.delete(eventno);
	}
	
	public void attachCreate(EventVO vo)throws Exception{
		System.out.println("이벤서비스호출..");
		mapper.attachCreate(vo);

	}
	
	public List<String> getAttach(Integer eventno)throws Exception{
		return mapper.getAttach(eventno);
	}
	
	public void attachModify(EventVO vo)throws Exception{
		System.out.println("첨부파일업뎃 서비스 호출.....");
		mapper.update(vo);
		mapper.attachModify(vo);
	}
}
