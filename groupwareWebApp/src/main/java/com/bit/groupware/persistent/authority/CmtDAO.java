package com.bit.groupware.persistent.authority;

import java.util.List;

import com.bit.groupware.domain.authority.CmtVO;

public interface CmtDAO {
	
	// ��� ����
    public int cmtCount() throws Exception;
 
    // ��� ���
    public List<CmtVO> selectCmtList(int postNo) throws Exception;
 
    // ��� �ۼ�
    public int insertCmt(CmtVO cmt) throws Exception;
    
    // ��� ����
    public int updateCmt(CmtVO cmt) throws Exception;
 
    // ��� ����
    public int deleteCmt(int cmtNo) throws Exception;



}
