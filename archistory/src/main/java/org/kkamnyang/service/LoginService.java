package org.kkamnyang.service;

import java.util.ArrayList;
import java.util.Collection;

import org.kkamnyang.domain.AdminDTO;
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
			int adminno = mapper.getNo(useremail);
			String name = mapper.getName(useremail);
			String password = mapper.getPass(useremail);
			
			System.out.println("E-mail based Password in query : " + password);
			
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
			user = new CustomUserDetails(adminno,useremail,name,encoder.encode(password));
		} catch (Exception e) {
			System.out.println("계정이 없는 ADMIN의 로그인 시도... LoginService(loadUserByUserName");
			return null;
		}
		
		
		boolean enable;
		try {
			enable = mapper.isEnable(useremail);
			
			if(enable == false){
				System.out.println("이용이 막힌 사용자가 로그인하였다.");
				return null;
			}
			
			
		} catch (Exception e) {
			System.out.println("enable가져오는데 실패 ");
			e.printStackTrace();
		}
		
		
		
		System.out.println("LoginService..."+user);
		return user;
	}

}
