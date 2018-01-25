package com.bit.groupware.persistent.approval;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.approval.TemplateBookmarkVO;

@Repository
public class TemplateBookmarkDAOImpl implements TemplateBookmarkDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.approval.TemplateBookmarkMapper.xml";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertTemplateBookmark(TemplateBookmarkVO templateBookmark) {
		sqlSession.insert(NAMESPACE+".insertTemplateBookmark",templateBookmark);
	}

	public void deleteTemplateBookmark(int bookmarkNo) {
		sqlSession.delete(NAMESPACE+".deleteTemplateBookmark",bookmarkNo);
	}

}
