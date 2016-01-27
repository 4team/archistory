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
	public void attachCreate(EventVO vo) throws Exception{
		
		try{
		
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
		
	}

	@Override
	public List<String> getAttach(Integer eventno) {		
		return session.selectList(namespace + ".getAttach", eventno);
	}

	@Override
	public void attachModify(EventVO vo) throws Exception{
		
		System.out.println("[EventController]업데이트 어테치!!");
		System.out.println(vo.toString());
		session.update(namespace + ".update", vo);
		
		if(vo.getEfiles()==null){

		}else{
			String attach = session.selectOne(namespace+".getAttach",vo.getEventno());
	
			
			System.out.println("이벤트 메퍼 임플에서 가져온 파일 이름: "+attach);
			
			if(attach==null){
				session.insert(namespace+".addAttach",vo);
			}else{
				session.update(namespace + ".updateAttach",vo);
			}
		}
	}
}
