package com.bit.groupware.service.authority;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.RequestMatcher;

public interface SecuredObjectService {
	
	//Role�� ���� URL�� ���� ������ ���Ѵ�.
	LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getRolesAndURL() throws Exception;

}
