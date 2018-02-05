package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.NoticeVO;
import com.bit.groupware.domain.authority.RoleVO;
@Repository
public class RoleDAOImpl implements RoleDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.RoleMapper";	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertAuthRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public void addRole(RoleVO role) {
		sqlSession.insert(NAMESPACE + ".addRole", role);
	}

	public void insertRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public List<RoleVO> selectRoleList() {
		List<RoleVO> roles = sqlSession.selectList(NAMESPACE + ".selectRoleListt");
		return roles;
	}

	public void nonInsertRole(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	public List<RoleVO> selectRoleList(Map<String, Object> map) {
		List<RoleVO> roles = sqlSession.selectList(NAMESPACE + ".selectRoleList", map);
		System.out.print("dddddddddd!!!!!!!!!!!!"+roles.toString());
		return roles;
	}

	public void updateRole(RoleVO role) {
		// TODO Auto-generated method stub
		
	}

	public void deleteRole(Map<String, Object> map) {
		sqlSession.delete(NAMESPACE + ".deleteRole", map);
	}

	public int selectRoleCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectRoleCount", map);
	}

}
