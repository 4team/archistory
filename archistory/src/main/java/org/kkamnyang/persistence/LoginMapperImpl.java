package org.kkamnyang.persistence;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class LoginMapperImpl implements AuthenticationProvider {

	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
	
		String useremail = (String)authentication.getPrincipal();
		String userpassword = (String)authentication.getCredentials();
		
		System.out.println("useremail : " + useremail + " password : " + userpassword);
		
		
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(useremail, userpassword,roles);	
		result.setDetails(new CustomUserDetails(useremail,userpassword));
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}


	
	
}
