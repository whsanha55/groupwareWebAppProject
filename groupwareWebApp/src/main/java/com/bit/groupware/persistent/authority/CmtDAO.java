package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.authority.CmtVO;

public interface CmtDAO {
	
	// 댓글 개수
    public int cmtCount() throws Exception;
 
    // 댓글 목록
    public List<CmtVO> selectCmtList(int postNo) throws Exception;
 
    // 댓글 작성
    public int insertCmt(CmtVO cmt) throws Exception;
    
    // 댓글 수정
    public int updateCmt(CmtVO cmt) throws Exception;
 
    // 댓글 삭제
    public int deleteCmt(int cmtNo) throws Exception;
    
    // 게시글과 함께 댓글 삭제
    public int deleteCmtList(int postNo);



}
