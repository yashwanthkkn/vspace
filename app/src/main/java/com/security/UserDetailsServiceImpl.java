package com.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.entities.User;
import com.service.UserService;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserService userService;
	
	@Override
	public UserDetails loadUserByUsername(String emailid) throws UsernameNotFoundException {
		System.out.println("Getting user");
		System.out.println("Username "+emailid);
		User user = userService.findUserByEmailid(emailid);
		System.out.println(user);
		if(user == null) {
			throw new UsernameNotFoundException(emailid);
		}
		return new UserDetailsImpl(user);
	}

}
