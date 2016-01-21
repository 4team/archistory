package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.EventVO;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class EventMapperImpl extends AbstractCRUDMapper<EventVO,Integer> implements EventMapper {

	@Override
	public List<EventVO> elist(Integer routeno) {
		return session.selectList(namespace+".elist",routeno);
	}

	@Transactional
	@Override
	public void attachCreate(EventVO vo) {
		
		session.insert(namespace + ".create", vo);
		String efiles = vo.getEfiles();
		if (efiles.equals("")) {
			return;
		}else{
			System.out.println(efiles);
			session.insert(namespace + ".addAttach",efiles);
		}
	}

	@Override
	public List<String> getAttach(Integer eventno) {		
		return session.selectList(namespace + ".getAttach", eventno);
	}
}
