package com.bit.groupware.persistent.authority;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.authority.RoleVO;


@Repository("securedObjectDao")
public class SecuredObjectDaoImpl implements SecuredObjectDao {
	private final String NAMESPACE ="com.bit.groupware.persistent.mapper.authority.AuthorityMapper";
	
	@Autowired
	private   SqlSessionTemplate sqlSession;


	public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndURL() throws Exception {
		return getRolesAndResources("url");
	}

	public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndResources(String resourceType)
			throws Exception {
		LinkedHashMap<Object, List<ConfigAttribute>> requestMap = new LinkedHashMap<Object, List<ConfigAttribute>>();
		try {
			 String roleName = "";
			 String authority = "";
			 AntPathRequestMatcher requestMatcher = null;
		     List<ConfigAttribute> configList = null;

			AuthorityVO auth = null;
			
			List<RoleVO> list = sqlSession.selectList(NAMESPACE + ".selectAuthority");	
			System.out.println("list : " + list);
			for(RoleVO temp :list) {
				
				List<AuthorityVO> a = temp.getAuthorities();
	            if (roleName != temp.getrName()) {
	               requestMatcher = new AntPathRequestMatcher(temp.getrName()); //URL 
	               configList = new LinkedList<ConfigAttribute>();              //권한목록
	               requestMap.put(requestMatcher, configList);
	               roleName = temp.getrName();
	            }
	          
	            for(AuthorityVO temp1 :a) {
	            if (authority != temp1.getaName()) {
	               configList.add(new SecurityConfig(temp1.getaName()));
	               authority = temp1.getaName();
	            }
	            }
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("requestMap : " + requestMap);
		return requestMap;

	}
}
















