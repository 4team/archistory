package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.FinishRouteVO;
import org.kkamnyang.domain.PageVO;
import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.domain.RankingVO;
import org.kkamnyang.domain.RouteVO;
import org.springframework.stereotype.Repository;

@Repository
public class ParticipateMapperImpl extends AbstractCRUDMapper<ParticipateVO, Integer> implements ParticipateMapper {

	@Override
	public void finish(ParticipateVO vo) {
		session.update(namespace+".finish",vo);
	}

	@Override
	public List<RouteVO> finishList(Integer memberno) {
		return session.selectList(namespace+".finishList",memberno);
	}

	@Override
	public FinishRouteVO finishRoute(PageVO vo) {
		return session.selectOne(namespace+".finishRoute",vo);
	}

	@Override
	public List<RankingVO> ranking(Integer routeno) {
		return session.selectList(namespace+".ranking",routeno);
	}

	@Override
	public Integer finishRouteCoute(PageVO vo) {
		return session.selectOne(namespace+".finishRouteCount",vo);
	}

}
