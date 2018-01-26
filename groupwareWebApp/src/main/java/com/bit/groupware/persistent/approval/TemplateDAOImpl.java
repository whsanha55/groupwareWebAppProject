package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.TemplateVO;
@Repository
public class TemplateDAOImpl implements TemplateDAO{
private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.TemplateMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertTemplate(TemplateVO template) {
		sqlSession.insert(NAMESPACE + ".insertTemplate", template);

	}

	public List<TemplateVO> selectTemplateList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectTemplateList");
	}

	public TemplateVO selectTemplate(int tmpNo) {
		return sqlSession.selectOne(NAMESPACE+".selectTemplate",tmpNo);
	}

	public void deleteTemplate(int tmpNo) {
		sqlSession.delete(NAMESPACE + ".deleteTemplate", tmpNo);
		
	}
}
