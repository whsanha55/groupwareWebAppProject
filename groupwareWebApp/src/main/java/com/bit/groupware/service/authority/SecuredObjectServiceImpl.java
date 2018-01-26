package com.bit.groupware.service.authority;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;
import org.springframework.stereotype.Service;

import com.bit.groupware.persistent.authority.SecuredObjectDao;


@Service(value="securedObjectServiceImpl")
public class SecuredObjectServiceImpl implements SecuredObjectService {
	
	@Autowired
	private SecuredObjectDao securedObjectDao;

	public LinkedHashMap<RequestMatcher, List<ConfigAttribute>> getRolesAndURL() throws Exception {

		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> ref = 
				new LinkedHashMap<RequestMatcher, List<ConfigAttribute>>();

		LinkedHashMap<Object, List<ConfigAttribute>> data = securedObjectDao.getRolesAndURL();
		Set<Object> keys = data.keySet();
		for (Object key : keys) {
			ref.put((AntPathRequestMatcher) key, data.get(key));
		}
		return ref;
	}

}
























