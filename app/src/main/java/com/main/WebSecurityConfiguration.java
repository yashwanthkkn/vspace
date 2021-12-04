package com.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter{

//	@Autowired
//	private UserDetailsService userDetailsService;
//	
//	@Bean
//	public AuthenticationProvider autheticationProvider() {
//		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
//		provider.setUserDetailsService(userDetailsService);
//		provider.setPasswordEncoder(new BCryptPasswordEncoder());
//		return provider;
//	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		System.out.println("Fliters are called");
//		http.authorizeRequests()
//			.anyRequest().authenticated()
//			.and()
//			.formLogin()
//			.loginPage("/login")
//			.permitAll();
		http.authorizeRequests()
			.antMatchers("/")
			.permitAll()
			.antMatchers("/user/*")
			.authenticated()
			.antMatchers("/admin/*")
			.authenticated()
			.and()
			.formLogin()
			.loginPage("/login")
			.permitAll();
			
	}
}
