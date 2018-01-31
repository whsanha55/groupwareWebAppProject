package com.bit.groupware.persistent.authority;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bit.groupware.domain.authority.NoticeVO;

public class NoticeDAOImpl implements NoticeDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.NoticeMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<NoticeVO> selectNoticeList(Map<String, Integer> map) {
		return sqlSession.selectList(NAMESPACE + ".selectNoticeList", map);
	}

	public NoticeVO selectNotice(int noticeNo) {
		return sqlSession.selectOne(NAMESPACE + ".selectNotice", noticeNo);
	}

	public int insertNotice(NoticeVO notice) {
		return sqlSession.insert(NAMESPACE + ".insertNotice", notice);
		
	}

	public void updateNotice(NoticeVO notice) {
		sqlSession.update(NAMESPACE + ".updateNotice", notice);
		
	}

	public void deleteNotice(int noticeNo) {
		sqlSession.delete(NAMESPACE + ".deleteNotice", noticeNo);
		
	}

}
