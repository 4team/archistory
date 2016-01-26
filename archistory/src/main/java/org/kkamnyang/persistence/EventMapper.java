package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.EventVO;

public interface EventMapper extends CRUDMapper<EventVO,Integer> {

	public List<EventVO> elist(Integer routeno);

	public int attachCreate(EventVO vo) throws Exception;
	
	public List<String> getAttach(Integer eventno) throws Exception;
	
	public void attachModify(EventVO vo) throws Exception;
	
}
