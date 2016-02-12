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
		System.out.println("[USER 로그인 시도] - loadUserByUsername"+email+"<메일주소");
		OurUserDetails user = null;
		StandardPasswordEncoder encoder = new StandardPasswordEncoder();
		
		try{
			System.out.println("========1=========");
			MemberVO vo = mapper.findByEmail(email);
			System.out.println("========2=========");
			System.out.println("호출된 MemberVO : "+vo);
			user = new OurUserDetails(vo.getMemberno(),vo.getUserName(),vo.getEmail(),encoder.encode(vo.getPassword()),vo.getImg());
		}catch(Exception e){
			System.out.println("계정이 없는 Member의 로그인 시도였다.");
			user = new OurUserDetails(0,"GUEST","guest@archistory.org",encoder.encode("guest"),"");
			return user;
		}
		System.out.println("로그인 Member : " + user.toString());
		return user;
	}

}
