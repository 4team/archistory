package org.kkamnyang.service;

import java.util.ArrayList;
import java.util.Collection;

import org.kkamnyang.persistence.AdminMapper;
import org.kkamnyang.persistence.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.StandardPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginService implements UserDetailsService{

	@Autowired
	private AdminMapper mapper;
	
	public void setAdminMapper(AdminMapper map){
		this.mapper = map;
	}
	
	@Override
	public UserDetails loadUserByUsername(String useremail) throws UsernameNotFoundException {
	
		CustomUserDetails user = null;
		
		StandardPasswordEncoder encoder = new StandardPasswordEncoder();
        
        
		System.out.println("LoginService... loadUserByUsername 호출됨	");
		
		try {
			String password = mapper.getPass(useremail);
			
			String name = mapper.getName(useremail);
			int adminno = mapper.getNo(useremail);
			System.out.println("E-mail based Password in query : " + password);
			
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
			user = new CustomUserDetails(adminno,useremail,name,encoder.encode(password));
		} catch (Exception e) {
			System.out.println("계정이 없는 ADMIN의 로그인 시도... LoginService(loadUserByUserName");
			return null;
		}
		System.out.println("LoginService..."+user);
		return user;
	}

}
