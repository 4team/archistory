package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.EventVO;

public interface EventMapper extends CRUDMapper<EventVO,Integer> {

	public List<EventVO> elist(Integer routeno);

	public void attachCreate(EventVO vo) throws Exception;
	
	public List<String> getAttach(Integer eventno) throws Exception;
	
	public void attachModify(EventVO vo) throws Exception;

	public EventVO getByOrder(EventVO vo);
	
	public void modifyOrder(EventVO vo);
	
}
