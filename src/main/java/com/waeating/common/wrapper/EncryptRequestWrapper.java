package com.waeating.common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class EncryptRequestWrapper extends HttpServletRequestWrapper{

	public EncryptRequestWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		
		String value = "";
		if("pw".equals(key)) {
			
			value = super.getParameter(key);
			
			if(!value.equals("") && !value.equals(null)) {
				BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
				value = passwordEncoder.encode(super.getParameter(key));
			}	
		} else {
			value = super.getParameter(key);
		}
		
		return value;
		
	}

}
