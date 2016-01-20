package org.kkamnyang.persistence;

import org.kkamnyang.domain.MemberVO;
import org.springframework.security.core.userdetails.User;

public interface MemberMapper extends CRUDMapper<MemberVO,Integer>{

	public MemberVO findByEmail(String email);

	
}
