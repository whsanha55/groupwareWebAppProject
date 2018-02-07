package com.bit.groupware.service.authority;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.CmtVO;
import com.bit.groupware.persistent.authority.CmtDAO;

@Service
public class CmtServiceImpl implements CmtService {

	@Autowired
	private CmtDAO cmtDAO;
	
	public List<CmtVO> retrieveComment(int postNo) throws Exception {
		return cmtDAO.selectCmtList(postNo);
	}

	public int registerCmt(CmtVO cmt) throws Exception {
		return cmtDAO.insertCmt(cmt);
	}

	public int modifyCmt(CmtVO cmt) throws Exception {
		return cmtDAO.updateCmt(cmt);
	}

	public int removeCmt(int cmtNo) throws Exception {
		return cmtDAO.deleteCmt(cmtNo);
	}

}
