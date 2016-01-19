package org.kkamnyang.persistence;

import java.util.List;
import java.util.Map;

import org.kkamnyang.domain.RouteVO;
import org.springframework.web.bind.annotation.SessionAttributes;

public interface RouteMapper extends CRUDMapper<RouteVO,Integer> {

	public List<RouteVO> list(int adminno) throws Exception;
	
}
