package org.kkamnyang.persistence;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * @author Rob Winch
 */
public class CustomUserDetails implements UserDetails {
	private final String email;
	private final String username;
	private final Collection<? extends GrantedAuthority> authorities;

	public CustomUserDetails(String email, String username) {
		this.email = email;
		this.username = username;
		this.authorities = AuthorityUtils.createAuthorityList("ROLE_USER");
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public String getPassword() {
		return null;
	}

	public String getUsername() {
		return username;
	}

	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		return true;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		return true;
	}

	@Override
	public String toString() {
		return "CustomUserDetails{" + "username='" + username + '\'' + '}';
	}
}