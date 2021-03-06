package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.FinishRouteVO;
import org.kkamnyang.domain.PageVO;
import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.domain.RankingVO;
import org.kkamnyang.domain.RouteVO;


public interface ParticipateMapper extends CRUDMapper<ParticipateVO, Integer> {

	void finish(ParticipateVO vo);

	List<RouteVO> finishList(Integer memberno);

	FinishRouteVO finishRoute(PageVO vo);

	List<RankingVO> ranking(Integer routeno);
	
	Integer finishRouteCoute(PageVO vo);

}
