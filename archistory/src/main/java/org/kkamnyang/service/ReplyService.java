package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.Criteria;
import org.kkamnyang.domain.ReplyVO;

public interface ReplyService {
	
    public List<ReplyVO> listReply(Integer boardNo) throws Exception;
	
	public void addReply (ReplyVO vo) throws Exception;
	
	public void modifyReply(ReplyVO vo) throws Exception;
	
	public void removeReply(Integer replyNo) throws Exception;
	
	public List<ReplyVO> listReplyPage(Integer boardNo, Criteria cri) throws Exception;
	
	public int count(Integer boardNo) throws Exception;

}
