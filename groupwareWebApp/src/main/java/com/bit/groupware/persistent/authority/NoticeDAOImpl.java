package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.groupware.domain.authority.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {
	private static final String NAMESPACE = "com.bit.article.persistent.mapper.authority.NoticeMapper";	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVO> selectNoticeList(Map<String, Integer> map) {
		List<NoticeVO> notices = sqlSession.selectList(NAMESPACE + ".selectNoticeList", map);
		return notices;
	}

	public NoticeVO selectNotice(int noticeNo) {
		NoticeVO notice = sqlSession.selectOne(NAMESPACE + ".selectNotice", noticeNo);
		return notice;
	}

	public void insertNotice(NoticeVO notice) {
		sqlSession.insert(NAMESPACE + ".insertNotice", notice);
	}

	public void updateNotice(NoticeVO notice) {
		sqlSession.update(NAMESPACE + ".updateNotice", notice);	
	}

	public void deleteNotice(int noticeNo) {
		sqlSession.delete(NAMESPACE + ".deleteNotice", noticeNo);
	}

	public List<NoticeVO> findNotice(String noticeTitle) {
		List<NoticeVO> notices = sqlSession.selectList(NAMESPACE + ".findNoticeList", noticeTitle);
		return notices;
	}
}
