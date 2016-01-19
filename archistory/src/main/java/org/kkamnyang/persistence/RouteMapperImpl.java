package org.kkamnyang.persistence;

import java.util.List;
import java.util.Map;

import org.kkamnyang.domain.RouteVO;
import org.springframework.stereotype.Repository;

@Repository
public class RouteMapperImpl extends AbstractCRUDMapper<RouteVO,Integer> implements RouteMapper {

	@Override
	public List<RouteVO> list(int adminno) throws Exception {
		return session.selectList(namespace+".list",adminno);
	
	}

}
