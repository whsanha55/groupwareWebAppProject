package com.bit.groupware.service.authority;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.groupware.domain.authority.NoticeFileVO;
import com.bit.groupware.domain.authority.NoticeVO;
import com.bit.groupware.persistent.authority.NoticeDAO;
import com.bit.groupware.persistent.authority.NoticeFileDAO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private NoticeFileDAO noticeFileDAO;
	
	public List<NoticeVO> retrieveNoticeList(Map<String, Object> map) {
		return noticeDAO.selectNoticeList(map);
	}

	public List<NoticeVO> retrieveNoticeList() {
		return noticeDAO.selectNoticeList();
	}

	public NoticeVO retrieveNotice(int noticeNo) {
		return noticeDAO.selectNotice(noticeNo);
	}

	public void registerNotice(NoticeVO notice) {
		//因走紫牌 去系
		int noticeNo = noticeDAO.insertNotice(notice);
		System.out.println("腰硲!!!!!!!!!!!!!!!!!!!!たたたたたたたたたたたたたたたた" + noticeNo);
		//歎採督析 去系
		List<NoticeFileVO> files = notice.getFiles();
		if(files.size() != 0) {
			for(NoticeFileVO file : files) {
				file.setNoticeNo(noticeNo);
			}			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("noticeFiles", files);
			System.out.println("焼たたたたたたたたたたたたたたたた" + files.toString());
			noticeFileDAO.insertNoticeFile(map);
		}
	}

	public void modifyNotice(NoticeVO notice) {
		//因走紫牌 呪舛
		noticeDAO.updateNotice(notice);
		
		//歎採督析 呪舛
		List<NoticeFileVO> files = notice.getFiles();
		if(files.size() != 0) {
			for(NoticeFileVO file : files) {
				file.setNoticeNo(notice.getNoticeNo());
			}			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("noticeFiles", files);
			noticeFileDAO.insertNoticeFile(map);		
			}
	}

	public void removeNotice(Map<String, Object> map) {
		System.out.println("焼!!!!!!!!!!!!!!!!!!!!!"+map);
		//因走紫牌 督析 肢薦
		noticeFileDAO.deleteNoticeFileList(map);		
		
		//因走紫牌 肢薦
		noticeDAO.deleteNotice(map);
	} 

	public int retrieveNoticeCount(Map<String, Object> map) {
		return noticeDAO.selectNoticeCount(map);
	}
	

	public void removeNoticeFile(int noticeNo) {
		noticeFileDAO.deleteNoticeFile(noticeNo);
	}

	public void upHitCount(int noticeNo) {
		noticeDAO.upHitCount(noticeNo);
	}

}
