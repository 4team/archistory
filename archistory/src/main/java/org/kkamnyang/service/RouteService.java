package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.RouteVO;
import org.kkamnyang.persistence.RouteMapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RouteService {

	@Autowired
	RouteMapperImpl mapper;
	
	public List<RouteVO> list() throws Exception{
		return mapper.list();
	}

	public void regist(RouteVO vo) throws Exception{
		mapper.create(vo);
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
