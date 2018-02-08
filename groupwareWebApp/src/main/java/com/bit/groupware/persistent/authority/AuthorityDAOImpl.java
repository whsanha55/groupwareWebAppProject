package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.AuthEmpListVO;
import com.bit.groupware.domain.authority.AuthEmpVO;
import com.bit.groupware.domain.authority.AuthorityVO;

@Repository
public class AuthorityDAOImpl implements AuthorityDAO {

	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.AuthorityMapper";	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//���� ����� ��ȸ�ϴ�.
	public List<AuthorityVO> selectAuthorityList(Map<String, Object> map) {
		List<AuthorityVO> authorities= sqlSession.selectList(NAMESPACE + ".selectListAuthority", map);
		return authorities;
	}

	//������ ����ϴ�.
	public void insertAuthority(AuthorityVO authority) {
		sqlSession.insert(NAMESPACE + ".insertAuthority" , authority);
	}

	//������ �����ϴ�.
	public void updateAuthority(AuthorityVO authority) {
		sqlSession.update(NAMESPACE + ".updateAuthority" , authority);
	}

	//������ �ϰ������ϴ�.
	public void deleteAuthority(Map<String, Object> map) {
		sqlSession.delete(NAMESPACE + ".deleteAuthority", map);
		
	}
	
	//���ѿ���, ���� ��� ���翩��
	public int selectAuthRoleCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthRoleCount", map);
	}

	//�� �Խñ� ���� ���ϴ�.
	public int selectAuthorityCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityCount", map);
	}

	//���ѹ�ȣ�� �ش��ϴ� ����� ��ȸ�ϴ�.
	public List<AuthorityVO> selectAuthEmpList(String aNo) {
		return sqlSession.selectList(NAMESPACE + ".selectAuthEmpList" ,aNo);
	}

	//������ ��ȸ�ϴ�.
	public AuthorityVO selectAuthorityByaNo(String aNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityByaNo" , aNo);
	}

	//���Ѹ� üũ
	public int selectAuthorityByAname(String aName) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthorityByAname", aName);
	}

	//���� ����� ����ϴ�.
	public void insertAuthEmp(AuthEmpVO authEmp) {
		sqlSession.insert(NAMESPACE + ".insertAuthEmp", authEmp);
		
	}

	//���ѹ�ȣ�� �ش��ϴ� ����� ��ȸ�ϴ�.
	public List<AuthEmpListVO> selectAuthEmpList(Map<String, Object> map) {
		List<AuthEmpListVO> authEmps = sqlSession.selectList(NAMESPACE + ".selectListAuthEmp", map);
		return authEmps;
	}

	//���ѹ�ȣ�� �ش��ϴ� ����� �Խñ� ���� ���ϴ�.
	public int selectAuthEmpCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectAuthEmpCount", map);
	}
	
	
}
