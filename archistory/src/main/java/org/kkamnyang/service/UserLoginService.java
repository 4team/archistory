package org.kkamnyang.service;

import org.kkamnyang.domain.MemberVO;
import org.kkamnyang.persistence.MemberMapper;
import org.kkamnyang.persistence.OurUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserLoginService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	public void setMemberMapper(MemberMapper map){
		this.mapper = map;
	}
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("[USER 로그인 시도] - loadUserByUsername");
		OurUserDetails user = null;
		StandardPasswordEncoder encoder = new StandardPasswordEncoder();
		
		try{
			MemberVO vo = mapper.findByEmail(email);
			System.out.println("호출된 MemberVO : "+vo);
			user = new OurUserDetails(vo.getMemberNo(),vo.getUserName(),vo.getEmail(),encoder.encode(vo.getmPassword()),vo.getImg(),vo.getUserNo());
		}catch(Exception e){
			System.out.println("계정이 없는 Member의 로그인 시도였다.");
			return null;
		}
		System.out.println("로그인 Member : " + user.toString());
		return user;
	}

}
