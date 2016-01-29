package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.QuestionVO;

public interface QuestionMapper extends CRUDMapper<QuestionVO,Integer> {

	
	public void attachCreate(QuestionVO vo) throws Exception;
	
	public List<String> getAttach(Integer questionno) throws Exception;
}
