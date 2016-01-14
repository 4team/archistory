package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.EventVO;

public interface EventMapper extends CRUDMapper<EventVO,Integer> {

	public List<EventVO> elist(Integer routeno);


	
}
