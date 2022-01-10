package com.jandiFactoring.redJandi.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity // 설정 파일이면서 시큐리티 연결
public class SpringSecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	    /* 1. 암호화 처리를 위한 PasswordEncoder bean 등록 */
	    @Bean
	    public PasswordEncoder passwordEncoder() {
	    	return new BCryptPasswordEncoder();
	    }
	    
	    @Override
	    protected void configure(HttpSecurity http) throws Exception {
	       http.cors().disable()
	          .csrf().disable()
	          .formLogin().disable()
	          .headers().frameOptions().disable();
	    }

}
