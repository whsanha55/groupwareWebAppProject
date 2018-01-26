package com.bit.groupware.security;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.RequestMatcher;

import com.bit.groupware.service.authority.SecuredObjectService;


public class UrlResourcesMapFactoryBean implements 
		FactoryBean<LinkedHashMap<RequestMatcher, List<ConfigAttribute>>> {
	
	@Autowired
	private SecuredObjectService securedObjectService;
	private LinkedHashMap<RequestMatcher, List<ConfigAttribute>> requestMap;

	public LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getObject() throws Exception {
		if (requestMap == null) {
			requestMap = securedObjectService.getRolesAndURL();
		}
		return requestMap;
	}

	public Class<?> getObjectType() {
		return LinkedHashMap.class;
	}

	public boolean isSingleton() {
		return true;
	}
	
	public void init() throws Exception {
		requestMap = securedObjectService.getRolesAndURL();
	}

}
