package com.bit.groupware.persistent.authority;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.groupware.domain.authority.CmtVO;

@Repository
public class CmtDAOImpl implements CmtDAO {
	private static final String NAMESPACE = "com.bit.groupware.persistent.mapper.authority.CmtMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int cmtCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".cmtCount");
	}

	public List<CmtVO> selectCmtList(int postNo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectCmtList", postNo);
	}

	public int insertCmt(CmtVO cmt) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertCmt", cmt);
	}

	public int updateCmt(CmtVO cmt) throws Exception {
		return sqlSession.update(NAMESPACE + ".updateCmt", cmt);
	}

	public int deleteCmt(int cmtNo) throws Exception {
		return sqlSession.delete(NAMESPACE + ".deleteCmt", cmtNo);
	}

	public int deleteCmtList(int postNo) {		
		return sqlSession.delete(NAMESPACE + ".deleteCmtList", postNo);
	}

}
