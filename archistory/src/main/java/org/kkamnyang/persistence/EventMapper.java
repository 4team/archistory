package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.EventVO;

public interface EventMapper extends CRUDMapper<EventVO,Integer> {

	public List<EventVO> elist(Integer routeno);

	public void attachCreate(EventVO vo);
	
	public List<String> getAttach(Integer eventno);
	
	public void attachModify(EventVO vo);
	
}
