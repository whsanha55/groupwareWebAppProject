package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.NoticeFileVO;
import com.bit.groupware.domain.authority.NoticeVO;
@Repository
public class NoticeFileDAOImpl implements NoticeFileDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.NoticeFileMapper";	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertNoticeFile(Map<String, Object> map) {
		sqlSession.insert(NAMESPACE + ".insertNoticeFile", map);		
		
	}

	public void deleteNoticeFile(int noticeNo) {
		sqlSession.delete(NAMESPACE + ".deleteNoticeFile", noticeNo);		
	}

	public void deleteNoticeFileList(Map<String, Object> map) {
		sqlSession.delete(NAMESPACE + ".deleteNoticeFileList", map);
	}
}
