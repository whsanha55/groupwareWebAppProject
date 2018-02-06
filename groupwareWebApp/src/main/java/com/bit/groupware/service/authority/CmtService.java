package com.bit.groupware.service.authority;

import java.util.List;

import com.bit.groupware.domain.authority.CmtVO;

public interface CmtService {

	public List<CmtVO> retrieveComment(int postNo) throws Exception;

	int registerCmt(CmtVO cmt) throws Exception;

	int modifyCmt(CmtVO cmt) throws Exception;

	int removeCmt(int cmtNo) throws Exception;

}
