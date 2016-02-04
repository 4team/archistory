package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.PageVO;
import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.domain.RouteVO;


public interface ParticipateMapper extends CRUDMapper<ParticipateVO, Integer> {

	void finish(ParticipateVO vo);

	List<RouteVO> finishList(Integer memberno);

	RouteVO finishRoute(PageVO vo);

}
