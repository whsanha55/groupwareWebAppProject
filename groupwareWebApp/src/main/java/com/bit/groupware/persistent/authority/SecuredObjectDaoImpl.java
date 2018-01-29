package com.bit.groupware.persistent.authority;


import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import javax.swing.plaf.synth.SynthSeparatorUI;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.AuthorityVO;
import com.bit.groupware.domain.authority.RoleVO;

@Repository("securedObjectDao")
public class SecuredObjectDaoImpl implements SecuredObjectDao {
	private final String NAMESPACE="com.bit.groupware.persistent.mapper.authority.AuthorityMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

   // URL 형식인 보호자원 - Role 매핑 정보를 조회하는 SQL
	public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndURL() throws Exception {
	      return getRolesAndResources("URL");
	   }
	
   public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndResources(String resourceType)
         throws Exception {
      LinkedHashMap<Object, List<ConfigAttribute>> requestMap = new LinkedHashMap<Object, List<ConfigAttribute>>();
      List<RoleVO> authRole =  sqlSession.selectList(NAMESPACE + ".selectAuthority");
      System.out.println("authRole : " + authRole);
      AntPathRequestMatcher requestMatcher = null;
      List<ConfigAttribute> configList = null;
      RoleVO role = new RoleVO();
      AuthorityVO auth = new AuthorityVO();
      String roleName = "";
      String authority = "";
      try {
    	  
    	 for(RoleVO authRoles : authRole) {
        	  if(roleName != (role.getrName())) {
        		  requestMatcher = new AntPathRequestMatcher(role.getrName());
        		  configList = new LinkedList<ConfigAttribute>();   
        		  requestMap.put(requestMatcher, configList);
        		  roleName =  role.getrName();
        	  }
        	  
        	  if(authority != (auth.getaName())) {
        		  configList.add(new SecurityConfig(auth.getaName()));
        		  authority = auth.getaName();
        	  }
          }
		
	} catch (Exception e) {
		e.printStackTrace();
	}

      System.out.println("requestMap : " + requestMap);
      return requestMap;

   }

   
}



