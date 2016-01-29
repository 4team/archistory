package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.QuestionVO;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionMapperImpl extends AbstractCRUDMapper<QuestionVO,Integer> implements QuestionMapper {

	@Override
	public int create(QuestionVO vo) throws Exception {
		return session.insert(namespace+".create",vo);
	}

	@Override
	public QuestionVO read(Integer eventno) throws Exception {
		return session.selectOne(namespace+".read",eventno);
	}


	@Override
	public void delete(Integer eventno) throws Exception {
		session.delete(namespace+".delete",eventno);

	}

	@Override
	public void update(QuestionVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

	@Override
	public void attachCreate(QuestionVO vo) throws Exception {
		try{
			
			String qfiles = vo.getQfiles();

				if (qfiles.equals("")) {
					
				}else{
					System.out.println(qfiles);
					session.insert(namespace + ".addAttach",vo);
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}

	@Override
	public List<String> getAttach(Integer questionno) throws Exception {
		return session.selectList(namespace + ".getAttach", questionno);
		
	}

}
