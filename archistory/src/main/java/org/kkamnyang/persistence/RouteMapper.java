package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.LocationVO;
import org.kkamnyang.domain.RouteVO;

public interface RouteMapper extends CRUDMapper<RouteVO,Integer> {

	public List<RouteVO> list(int adminno) throws Exception;
	
	public List<RouteVO> closelist(LocationVO vo) throws Exception;
	
}
