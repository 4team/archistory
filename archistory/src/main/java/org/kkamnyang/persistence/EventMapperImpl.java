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
		
		int eventno=0;
		
		try{
		eventno = session.insert(namespace + ".create", vo);
		
		vo.setEventno(eventno);
		System.out.println(eventno);
		String efiles = vo.getEfiles();
		
			if (efiles.equals("")) {
				//return eventno;
			}else{
				System.out.println(efiles);
				session.insert(namespace + ".addAttach",vo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		System.out.println("이벤트넘버:"+eventno);
		return eventno;
		
		
		
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
