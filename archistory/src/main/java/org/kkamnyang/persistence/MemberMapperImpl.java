package org.kkamnyang.persistence;

import java.util.List;

import org.kkamnyang.domain.InviteVO;
import org.kkamnyang.domain.MemberVO;
import org.kkamnyang.domain.ParticipateVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberMapperImpl extends AbstractCRUDMapper<MemberVO, Integer> implements MemberMapper {

/*	@Override
	public int create(MemberVO vo) throws Exception {
		return session.insert(namespace+".create",vo);
	}*/

	@Override
	public MemberVO read(Integer memberno) throws Exception {
		return session.selectOne(namespace+".read",memberno);
	}

	@Override
	public List<MemberVO> list() throws Exception {
	
		return session.selectList(namespace+".list");
	}

	@Override
	public void delete(Integer memberno) throws Exception {
		session.delete(namespace+".delete",memberno);

	}

	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace+".update",vo);

	}

	@Override
	public MemberVO findByEmail(String email) {
		return session.selectOne(namespace+".getUser",email);
	}

	@Override
	public void participateF(ParticipateVO vo) {
		session.insert(namespace+".firstParticipate", vo);
	}

	@Override
	public void participateU(ParticipateVO vo) {
		session.update(namespace+".updateParticipate", vo);
	}
	
	@Override
	public void finishParticipate(Integer participateNo){
		session.update(namespace+".finishRoute", participateNo);
	}

	@Override
	public void inviteCreate(InviteVO vo) {
		session.insert(namespace+".inviteCreate",vo);
		
	}

	@Override
	public List<InviteVO> inviteRead(Integer routeno) {
	
		return session.selectList(namespace+".inviteRead",routeno);
	}

	@Override
	public void inviteUpdate(InviteVO vo) {
		 session.update(namespace+".inviteUpdate",vo);
		
	}
	@Override
	public void inviteDelete(InviteVO vo) {
		session.delete(namespace+".inviteDelete",vo);
		
	}

	@Override
	public void updateImg(MemberVO vo) {
		session.update(namespace+".updateImg",vo);
	}

}
