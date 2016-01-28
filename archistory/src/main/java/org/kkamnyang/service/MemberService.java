package org.kkamnyang.service;

import java.util.List;

import org.kkamnyang.domain.InviteVO;
import org.kkamnyang.domain.MemberVO;
import org.kkamnyang.domain.ParticipateVO;
import org.kkamnyang.persistence.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberMapper mapper;
	
	public int register(MemberVO vo) throws Exception{
		return mapper.create(vo);
	}
	
	public MemberVO view(Integer MemberNo) throws Exception{
		return mapper.read(MemberNo);
	}
	
	public List<MemberVO> list() throws Exception{
		List<MemberVO> list = mapper.list();
		return list;
	}
	
	public void modify(MemberVO vo) throws Exception{
		mapper.update(vo);
	}
	
	public void remove(Integer MemberNo) throws Exception{
		mapper.delete(MemberNo);
	}

	public void participateF(ParticipateVO vo) {
		mapper.participateF(vo);
	}

	public void participateU(ParticipateVO vo) {
		mapper.participateU(vo);
	}

	public void finish(Integer memberNo) {
		mapper.finishParticipate(memberNo);
		
	}
	

	public void inviteRegister(InviteVO vo) {
		mapper.inviteCreate(vo);
		
	}

	public InviteVO inviteView(Integer routeNo) {
	
		InviteVO vo = mapper.inviteRead(routeNo);
		return vo;
	}

	public void inviteModify(InviteVO vo) {
		mapper.inviteUpdate(vo);		
	}
	
	public void inviteRemove(Integer inviteNo) {
		mapper.inviteDelete(inviteNo);
		
	}
	
}
