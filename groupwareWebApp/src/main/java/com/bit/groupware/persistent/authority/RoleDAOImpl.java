package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.AuthRoleVO;
import com.bit.groupware.domain.authority.NoticeVO;
import com.bit.groupware.domain.authority.RoleVO;
@Repository
public class RoleDAOImpl implements RoleDAO {
   private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.RoleMapper";   
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   public void insertAuthRole(AuthRoleVO arole) {
	   sqlSession.insert(NAMESPACE + ".designateRole", arole);
   }

   public void addRole(RoleVO role) {
      sqlSession.insert(NAMESPACE + ".addRole", role);
   }

   public int aNoIsExist(String rId) {
	   return sqlSession.selectOne(NAMESPACE + ".aNoIsExist", rId);
   }

   public List<RoleVO> selectRoleByRname(String aName) {
      List<RoleVO> roles = sqlSession.selectList(NAMESPACE + ".selectRoleByRname", aName);
      return roles;
   }

   public List<RoleVO> selectRoleList(String aName) {
      List<RoleVO> roles = sqlSession.selectList(NAMESPACE + ".selectRoleReList", aName);
      return roles;
   }

   public void nonInsertAuthRole(String rId) {
	   sqlSession.delete(NAMESPACE + ".nonDesignateRole", rId);
   }

   public void updateRoleRegistration(RoleVO role) {
	   sqlSession.update(NAMESPACE + ".updateRoleRegistration", role);
   }

   public RoleVO selectRole(String rId) {
	   RoleVO role = sqlSession.selectOne(NAMESPACE + ".selectRole", rId);
	   return role;
   }

   public List<RoleVO> selectRoleList(Map<String, Object> map) {
      List<RoleVO> roles = sqlSession.selectList(NAMESPACE + ".selectRoleList", map);
      return roles;
   }

   public void updateRole(RoleVO role) {
      sqlSession.update(NAMESPACE + ".updateRole", role);
   }

   public void deleteRole(Map<String, Object> map) {
      sqlSession.delete(NAMESPACE + ".deleteRole", map);
   }

   public int selectRoleCount(Map<String, Object> map) {
      return sqlSession.selectOne(NAMESPACE + ".selectRoleCount", map);
   }

   public int rNameIsExist(String rName) {
      return sqlSession.selectOne(NAMESPACE + ".rNameIsExist", rName);
   }

   public int rIdIsExist(AuthRoleVO arole) {
	 return sqlSession.selectOne(NAMESPACE + ".rIdIsExist", arole);
   }

}