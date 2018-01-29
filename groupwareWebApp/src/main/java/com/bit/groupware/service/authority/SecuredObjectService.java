package com.bit.groupware.service.authority;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.RequestMatcher;

public interface SecuredObjectService {
	
	//Role에 대한 URL의 매핑 정보를 구한다.
	LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getRolesAndURL() throws Exception;

}
