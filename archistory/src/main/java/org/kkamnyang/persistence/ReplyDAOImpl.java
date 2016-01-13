package org.kkamnyang.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.kkamnyang.domain.Criteria;
import org.kkamnyang.domain.ReplyVO;
import org.springframework.stereotype.Repository;


@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace="org.kkamnyang.mapper.Replymapper";
	
	@Override
	public List<ReplyVO> list(Integer boardNo) throws Exception {	
		return session.selectList(namespace+".list", boardNo);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		session.insert(namespace+".create", vo);

	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		session.update(namespace+".update", vo);

	}

	@Override
	public void delete(Integer replyNo) throws Exception {
		session.delete(namespace+".delete", replyNo);

	}

	@Override
	public List<ReplyVO> listPage(Integer boardNo, Criteria cri) throws Exception {
		Map<String,Object> paramMap = new HashMap();
		
		paramMap.put("boardNo", boardNo);
		paramMap.put("cri", cri);
		
		return session.selectList(namespace+".listPage",paramMap);
	}

	@Override
	public int count(Integer boardNo) throws Exception {
		
		return session.selectOne(namespace+".count",boardNo);
	}

	@Override
	public int getBoardNo(Integer replyNo) throws Exception {
		
		return session.selectOne(namespace+".getBoardNo", replyNo);
	}

}
