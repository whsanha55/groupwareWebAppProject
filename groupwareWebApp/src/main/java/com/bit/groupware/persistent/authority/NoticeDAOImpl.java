package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.NoticeVO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.NoticeMapper";	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVO> selectNoticeList(Map<String, Object> map) {
		List<NoticeVO> notices = sqlSession.selectList(NAMESPACE + ".selectNoticeList", map);
		System.out.print("dddddddddd!!!!!!!!!!!!"+notices.toString());
		return notices;
	}

	public NoticeVO selectNotice(int noticeNo) {
		NoticeVO notice = sqlSession.selectOne(NAMESPACE + ".selectNotice", noticeNo);
		return notice;
	}

	public int insertNotice(NoticeVO notice) {
		sqlSession.insert(NAMESPACE + ".insertNotice", notice);
		return notice.getNoticeNo();
	}

	public void updateNotice(NoticeVO notice) {
		sqlSession.update(NAMESPACE + ".updateNotice", notice);	
	}

	public void deleteNotice(Map<String, Object> map) {
		sqlSession.delete(NAMESPACE + ".deleteNotice", map);
	}

	public List<NoticeVO> findNotice(String noticeTitle) {
		List<NoticeVO> notices = sqlSession.selectList(NAMESPACE + ".findNoticeList", noticeTitle);
		return notices;
	}
	
	public int selectNoticeCount(Map<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".selectNoticeCount", map);
		
	}
}
