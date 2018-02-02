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

	public NoticeVO retrieveNotice(int noticeNo) {
		return noticeDAO.selectNotice(noticeNo);
	}

	public void registerNotice(NoticeVO notice) {
		//�������� ���
		int noticeNo = noticeDAO.insertNotice(notice);
		System.out.println("��ȣ!!!!!!!!!!!!!!!!!!!!��������������������������������" + noticeNo);
		//÷������ ���
		List<NoticeFileVO> files = notice.getFiles();
		if(files.size() != 0) {
			for(NoticeFileVO file : files) {
				file.setNoticeNo(noticeNo);
			}			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("noticeFiles", files);
			System.out.println("�Ƥ�������������������������������" + files.toString());
			noticeFileDAO.insertNoticeFile(map);
		}
	}

	public void modifyNotice(NoticeVO notice) {
		//�������� ����
		noticeDAO.updateNotice(notice);
		
		//÷������ ����
		List<NoticeFileVO> files = notice.getFiles();
		if(files.size() != 0) {
			for(NoticeFileVO file : files) {
				file.setNoticeNo(notice.getNoticeNo());
			}			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("noticeFiles", files);
			noticeFileDAO.insertNoticeFile(map);		}
	}

	public void removeNotice(int noticeNo) {
		noticeDAO.deleteNotice(noticeNo);
	}
	

	public int retrieveNoticeCount() {
		return noticeDAO.selectNoticeCount();
	}
	
	

}
