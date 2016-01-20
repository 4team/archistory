package org.kkamnyang.persistence;

import java.util.ArrayList;
import java.util.List;

import org.kkamnyang.domain.AdminDTO;
import org.kkamnyang.domain.AdminVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class LoginMapperImpl implements AuthenticationProvider {
	
	@Autowired
	AdminMapper mapper;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		
		int adminno = 99;
		String useremail = (String)authentication.getPrincipal();
		String name = authentication.getName();
		String userpassword = (String)authentication.getCredentials();
		AdminDTO dto = new AdminDTO();
		dto.setEmail(useremail);
		dto.setPassword(userpassword);
		
		try {
			AdminVO vo = mapper.login(dto);
			System.out.println(vo.toString());
			if(vo.isEnable() == false){
				System.out.println("이용이 막힌 사용자가 로그인하였다.");
				return null;
			}
		} catch (Exception e) {
			System.out.println("AdminVO가져오는 데 실패.");
			return null;
		}
		System.out.println("============================================");
		System.out.println(authentication.toString());
		System.out.println("email : " + useremail + " name : "+ name +" password : " + userpassword);
		System.out.println("============================================");
		
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(useremail, userpassword,roles);	
		result.setDetails(new AdminDetails(adminno,useremail,name,userpassword));
		return result;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}


	
	
}
