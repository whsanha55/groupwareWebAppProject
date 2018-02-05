package com.bit.groupware.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.authority.NoticeFileVO;
import com.bit.groupware.domain.authority.PostFileVO;


public class UploadFiles {

	private static final Logger logger = LoggerFactory.getLogger(UploadFiles.class);
	private static int count = 1;

	public static PostFileVO uploadFile2(MultipartFile part, ServletContext context) throws IOException {
		String path = context.getRealPath("/upload");
		logger.info("path : {}",path);
		
		String originalFileName = part.getOriginalFilename();
		String systemFileName = "";
		File file = new File(path + File.separator + originalFileName);
		if (file.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
			count++;
		} else {
			systemFileName = originalFileName;
		}
		
		File dest = new File(path + File.separator + systemFileName);
		part.transferTo(dest);

		PostFileVO postFile = new PostFileVO();
		postFile.setOriginalFileName(originalFileName);
		postFile.setSystemFileName(systemFileName);
		return postFile;
	}

	public static NoticeFileVO uploadFile(MultipartFile part, ServletContext context) throws IOException {
		String path = context.getRealPath("/upload");
		logger.info("path : {}",path);
		
		String originalFileName = part.getOriginalFilename();
		String systemFileName = "";
		File file = new File(path + File.separator + originalFileName);
		if (file.exists()) {
			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count
					+ originalFileName.substring(originalFileName.lastIndexOf("."));
			count++;
		} else {
			systemFileName = originalFileName;
		}
		
		File dest = new File(path + File.separator + systemFileName);
		part.transferTo(dest);

		NoticeFileVO noticeFile = new NoticeFileVO();
		noticeFile.setOriginalFileName(originalFileName);
		noticeFile.setSystemFileName(systemFileName);
		return noticeFile;
	}
}
