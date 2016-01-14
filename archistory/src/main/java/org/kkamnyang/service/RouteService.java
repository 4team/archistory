package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.persistence.RouteMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RouteService {

	@Autowired
	RouteMapper mapper;
	
	public List<RouteVO> list() throws Exception{
		return mapper.list();
	}

	public int regist(RouteVO vo) throws Exception{
		return mapper.create(vo);
	}
	
	public RouteVO view(Integer routeno) throws Exception{
		return mapper.read(routeno);
	}
	
	public void modify(RouteVO vo) throws Exception{
		mapper.update(vo);
	}
	
	public void remove(Integer routeno) throws Exception{
		mapper.delete(routeno);
	}
	
}
