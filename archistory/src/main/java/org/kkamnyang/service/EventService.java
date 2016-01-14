package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.EventVO;
import org.kkamnyang.domain.RouteVO;
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

	public void regist(EventVO vo) throws Exception{
		mapper.create(vo);
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
	
}
