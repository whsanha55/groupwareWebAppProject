package com.bit.groupware.persistent.approval;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.TemplateCategoryVO;
@Repository
public class TemplateCategoryDAOImpl implements TemplateCategoryDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.TemplateCategoryMapper.xml";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TemplateCategoryVO> selectCategoryList() {
		return sqlSession.selectList(NAMESPACE+".selectTemplateCategoryList");
	}

	public void insertTemplateCategory(TemplateCategoryVO category) {
		sqlSession.insert(NAMESPACE+".insertTemplateCategory",category);
	}

	public void deleteTemplateCategory(int categoryNo) {
		sqlSession.delete(NAMESPACE+".deleteTemplateCategory",categoryNo);
	}

}
