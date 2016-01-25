package org.kkamnyang.persistence;

import org.kkamnyang.domain.QuestionVO;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionMapperImpl extends AbstractCRUDMapper<QuestionVO,Integer> implements QuestionMapper {

	@Override
	public int create(QuestionVO vo) throws Exception {
		return session.insert(namespace+".create",vo);
	}

	@Override
	public QuestionVO read(Integer questionno) throws Exception {
		return session.selectOne(namespace+".read",questionno);
	}


	@Override
	public void delete(Integer questionno) throws Exception {
		session.delete(namespace+".delete",questionno);

	}

	@Override
	public void update(QuestionVO vo) throws Exception {
		session.update(namespace+".update",vo);
	}

}
