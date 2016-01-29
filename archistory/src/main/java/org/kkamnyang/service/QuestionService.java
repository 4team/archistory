package org.kkamnyang.service;


import java.util.List;

import org.kkamnyang.domain.EventVO;
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
	
	public void attachCreate(QuestionVO vo)throws Exception{
		System.out.println("이벤서비스호출..");
		mapper.attachCreate(vo);

	}
	
	public List<String> getAttach(Integer questionno)throws Exception{
		return mapper.getAttach(questionno);
	}
	
}
