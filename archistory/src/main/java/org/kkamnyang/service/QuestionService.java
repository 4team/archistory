package org.kkamnyang.service;


import org.kkamnyang.domain.QuestionVO;
import org.kkamnyang.persistence.QuestionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionService {

	@Autowired
	QuestionMapper mapper;

	public int register(QuestionVO vo) throws Exception{
		return mapper.create(vo);
	}
	
	public QuestionVO view(Integer eventno) throws Exception{
		return mapper.read(eventno);
	}
	
	
	public void modify(QuestionVO vo) throws Exception{
		mapper.update(vo);
	}
	
	public void remove(Integer eventno) throws Exception{
		mapper.delete(eventno);
	}
}
