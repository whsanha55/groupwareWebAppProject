package com.bit.groupware.service.authority;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.persistent.authority.UserDAO;

@Service(value="userDetailsService")
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired	
	private UserDAO userDAO;
	private static final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
	
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO user = findUserInfo(username);
		if(user == null) {
			throw new UsernameNotFoundException(username);
		}
				
		Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
		for(String authority : loadPermission(username)) {
			authorities.add(new SimpleGrantedAuthority(authority));
		}
		
		User temp = new User(username, user.getEmpPwd(), authorities);
		System.out.println("User : " + temp);
		return temp;
	}
	
	
	
	private EmployeeVO findUserInfo(String username) {
		try {
			return userDAO.selectUserById(username);
		} catch(Exception ex) {
			ex.printStackTrace();
			logger.error(ex.toString());
			return null;
		}
	}
	
	private List<String> loadPermission(String username) {
		try {
			return userDAO.selectAutorities(username);
		} catch(Exception ex) {
			logger.error(ex.toString());
			return null;
		}
	}

}























