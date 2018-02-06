package com.bit.groupware.persistent.approval;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.controller.approval.AdminTemplateController;
import com.bit.groupware.domain.approval.TemplateVO;
@Repository
public class TemplateDAOImpl implements TemplateDAO{
private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.TemplateMapper";
	
private final static Logger logger = LoggerFactory.getLogger(AdminTemplateController.class);

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void insertTemplate(TemplateVO template) {
		sqlSession.insert(NAMESPACE + ".insertTemplate", template);

	}

	public List<TemplateVO> selectTemplateList(Map<String, Object> map) {
		return sqlSession.selectList(NAMESPACE + ".selectTemplateList", map);
	}
	
	public TemplateVO selectTemplate(int tmpNo) {
		return sqlSession.selectOne(NAMESPACE+".selectTemplate",tmpNo);
	}

	public void deleteTemplate(Map<String, Object> map) {
		logger.info("map-dao : {} ", map); 
		sqlSession.delete(NAMESPACE + ".deleteTemplate", map);
				
	}

	public int selectTemplateCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectTemplateCount", map);
	}

	public List<String> selectTemplateNameList() {
		return sqlSession.selectList(NAMESPACE + ".selectTemplateNameList");
	}

	public void updateTemplateUsing(Map<String, Object> map) {
		sqlSession.update(NAMESPACE + ".updateTemplateUsing", map);
		
	}
	
	

	
}
