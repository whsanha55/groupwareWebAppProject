package com.bit.groupware.persistent.authority;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

public interface SecuredObjectDao {

	LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndURL() throws Exception;

	LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndResources(String resourceType) throws Exception;
	
	
}
