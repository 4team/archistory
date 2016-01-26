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

	@Override
	public int attachCreate(EventVO vo) throws Exception{
		
		try{
			int eventno = session.insert(namespace + ".create", vo);
			vo.setEventno(eventno);
			String efiles = vo.getEfiles();
			System.out.println(efiles);
			
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return session.insert(namespace + ".addAttach",vo);
	}

	@Override
	public List<String> getAttach(Integer eventno) {		
		return session.selectList(namespace + ".getAttach", eventno);
	}

	@Override
	public void attachModify(EventVO vo) throws Exception{
		System.out.println("[EventController]업데이트 어테치!!");
		session.update(namespace + ".update", vo);
		session.update(namespace + ".updateAttach",vo);
	}
}
