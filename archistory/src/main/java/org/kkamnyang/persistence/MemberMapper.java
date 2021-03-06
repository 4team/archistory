package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.InviteVO;
import org.kkamnyang.domain.MemberVO;
import org.kkamnyang.domain.ParticipateVO;

public interface MemberMapper extends CRUDMapper<MemberVO,Integer>{

	public MemberVO findByEmail(String email);

	public void participateF(ParticipateVO vo);

	public void participateU(ParticipateVO vo);
	
	public void finishParticipate(Integer participateNo);
	
	public void inviteCreate (InviteVO vo);
	
	public List<InviteVO> inviteRead(Integer routeno);
	
	public void inviteUpdate(InviteVO vo);
	
	public void inviteDelete(InviteVO vo);

	public void updateImg(MemberVO vo);
	
}
