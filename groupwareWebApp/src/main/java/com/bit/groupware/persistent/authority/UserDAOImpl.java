package com.bit.groupware.persistent.authority;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.employee.EmployeeVO;

@Repository
public class UserDAOImpl implements UserDAO {

	private final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.AuthorityMapper";

	private final static Logger Logger = LoggerFactory.getLogger(UserDAOImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public EmployeeVO selectUserById(String id) throws Exception {
		EmployeeVO emp = sqlSession.selectOne(NAMESPACE + ".selectEmployee", id);
		Logger.info("emp : {}" , emp.toString());
		return emp;
	}

	
	public List<String> selectAutorities(String id) throws Exception {
		List<String> authorities = new ArrayList<String>();
		authorities = sqlSession.selectList(NAMESPACE + ".selectAuthEmp" , id);
		Logger.info("authorities : {}" , authorities.toString());
		return authorities;
	}

}
