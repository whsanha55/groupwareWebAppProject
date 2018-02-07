package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.authority.CmtVO;

public interface CmtDAO {
	
	// ´ñ±Û °³¼ö
    public int cmtCount() throws Exception;
 
    // ´ñ±Û ¸ñ·Ï
    public List<CmtVO> selectCmtList(int postNo) throws Exception;
 
    // ´ñ±Û ÀÛ¼º
    public int insertCmt(CmtVO cmt) throws Exception;
    
    // ´ñ±Û ¼öÁ¤
    public int updateCmt(CmtVO cmt) throws Exception;
 
    // ´ñ±Û »èÁ¦
    public int deleteCmt(int cmtNo) throws Exception;



}
