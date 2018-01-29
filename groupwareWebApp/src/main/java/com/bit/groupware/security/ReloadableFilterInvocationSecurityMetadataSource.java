package com.bit.groupware.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.RequestMatcher;

import com.bit.groupware.service.authority.SecuredObjectService;

//�ڿ��� �̸� ������ �� �ִ� ������ ���ε� ����
public class ReloadableFilterInvocationSecurityMetadataSource 
		implements FilterInvocationSecurityMetadataSource {
	@Autowired
	private SecuredObjectService securedObjectService;
	private LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> requestMap;
	
	
	public ReloadableFilterInvocationSecurityMetadataSource(
		LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> requestMap) {
		super();
		this.requestMap = requestMap;
	}

	
	//HttpServletRequest ��ü�� Ant �������� �´� ���� ã�Ƽ� �׿� ���� ���� ����� ��ȯ�Ѵ�.
	public Collection<ConfigAttribute> getAttributes(Object paramObject) throws IllegalArgumentException {
		HttpServletRequest request = ((FilterInvocation) paramObject).getRequest();
		Collection<ConfigAttribute> result = null;
		//LinkedHashMap �� ����� key, value�� Set�� �����Ѵ�.
		Set<Entry<RequestMatcher, Collection<ConfigAttribute>>> entries = requestMap.entrySet();
		for (Entry<RequestMatcher, Collection<ConfigAttribute>> entry : entries) {
			if (entry.getKey().matches(request)) {
				result = entry.getValue();
				break;   //�߿�
			}
		}
		return result;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		Set<ConfigAttribute> allAttributes = new HashSet<ConfigAttribute>();
		Set<Entry<RequestMatcher, Collection<ConfigAttribute>>> entries = requestMap.entrySet();
		for (Entry<RequestMatcher, Collection<ConfigAttribute>> entry : entries) {
			allAttributes.addAll(entry.getValue());
		}
		return allAttributes;
	}

	
	public boolean supports(Class<?> paramClass) {
		return FilterInvocation.class.isAssignableFrom(paramClass);
	}

	
	
	//DB���� �ٽ� requestMap�� ���� �����Ѵ�.
	public void reload() throws Exception {
		LinkedHashMap<RequestMatcher, List<ConfigAttribute>> requestMap = securedObjectService.getRolesAndURL();
		Iterator<Entry<RequestMatcher, List<ConfigAttribute>>> iterator = requestMap.entrySet().iterator();

		requestMap.clear();
		
		while (iterator.hasNext()) {
			Entry<RequestMatcher, List<ConfigAttribute>> entry = iterator.next();
			requestMap.put(entry.getKey(), entry.getValue());
		}
	}
}