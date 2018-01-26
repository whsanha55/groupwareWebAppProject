package com.bit.groupware.persistent.authority;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Repository;

@Repository("securedObjectDao")
public class SecuredObjectDaoImpl implements SecuredObjectDao {
	@Autowired
	private DataSource dataSource;

	// URL 형식인 보호자원 - Role 매핑 정보를 조회하는 SQL
	public static final String DEF_ROLES_AND_URL_QUERY = 
			"SELECT  t1.r_name, t3.a_name                                                "
			+ "FROM role t1, authority_role t2, authority t3                            "
			+ "WHERE t1.r_id = t2.r_id  													   "
			+ "AND t2.a_no = t3.a_no  													   "	
			+ "AND t1.r_type = 'url'  														   "	
			+ "ORDER BY  t3.a_name ASC, t1.sort_order ASC                           ";       

	public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndURL() throws Exception {
		return getRolesAndResources("URL");
	}

	public LinkedHashMap<Object, List<ConfigAttribute>> getRolesAndResources(String resourceType)
			throws Exception {
		LinkedHashMap<Object, List<ConfigAttribute>> requestMap = new LinkedHashMap<Object, List<ConfigAttribute>>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;		
		try {
			conn = dataSource.getConnection();
			System.out.println("Connection : " + conn);
			stmt = conn.createStatement();
			
			System.out.println("sql : " + DEF_ROLES_AND_URL_QUERY);
				
			rs = stmt.executeQuery(DEF_ROLES_AND_URL_QUERY);

			String roleName = "";
			String authority = "";
			AntPathRequestMatcher requestMatcher = null;
			List<ConfigAttribute> configList = null;
		
			while (rs.next()) {
				if (roleName != rs.getString(1)) {
					requestMatcher = new AntPathRequestMatcher(rs.getString(1)); //URL 
					configList = new LinkedList<ConfigAttribute>();              //권한목록
					requestMap.put(requestMatcher, configList);
					roleName = rs.getString(1);
				}

				if (authority != rs.getString(2)) {
					configList.add(new SecurityConfig(rs.getString(2)));
					authority = rs.getString(2);
				}
			}

		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		
		System.out.println("requestMap : " + requestMap);
		return requestMap;

	}

	
}
















