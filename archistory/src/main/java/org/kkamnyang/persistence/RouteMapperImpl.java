package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.LocationVO;
import org.kkamnyang.domain.RouteVO;
import org.springframework.stereotype.Repository;

@Repository
public class RouteMapperImpl extends AbstractCRUDMapper<RouteVO,Integer> implements RouteMapper {

	@Override
	public List<RouteVO> list(int adminno) throws Exception {
		return session.selectList(namespace+".listadmin",adminno);	
	}

	@Override
	public List<RouteVO> closelist(LocationVO vo) throws Exception {
		return session.selectList(namespace+".closelist",vo);
	}
}
