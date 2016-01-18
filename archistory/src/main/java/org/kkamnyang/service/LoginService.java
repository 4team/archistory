package org.kkamnyang.service;

import java.util.ArrayList;
import java.util.Collection;

import org.kkamnyang.persistence.AdminMapper;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class LoginService implements UserDetailsService{

	private AdminMapper mapper;
	
	public void setAdminMapper(AdminMapper map){
		this.mapper = map;
	}
	
	@Override
	public UserDetails loadUserByUsername(String useremail) throws UsernameNotFoundException {
	
		UserDetails user = null;
		try {
			String password = mapper.getPass(useremail);
			Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
			roles.add(new SimpleGrantedAuthority("ROLE_USER"));
			user = new User(useremail,password,roles);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}

}
