package org.kkamnyang.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.social.security.SocialUserDetails;
import org.springframework.social.security.SocialUserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class SocialLoginService implements SocialUserDetailsService {
	
	@Autowired
	private UserDetailsService userDetailsService;
	 
    public SocialLoginService(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }
	
	
	@Override
	public SocialUserDetails loadUserByUserId(String email) throws UsernameNotFoundException, DataAccessException {

		System.out.println("[소셜 로그인 시도]");
		UserDetails userDetails = userDetailsService.loadUserByUsername(email);
        return (SocialUserDetails) userDetails;
	}

}
