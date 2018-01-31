package com.bit.groupware.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.approval.ApprovalFileVO;


public class UploadApprovalFiles {

	private static final Logger logger = LoggerFactory.getLogger(UploadApprovalFiles.class);
	private static int count = 1;

	public static ApprovalFileVO uploadFile(MultipartFile part, ServletContext context) throws IOException {
		String root = context.getRealPath("/");
		String path = root + "resources/upload/approvalFile/";
		
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

		ApprovalFileVO approvalFile = new ApprovalFileVO();
		approvalFile.setOriginalFileName(originalFileName);
		approvalFile.setSystemFileName(systemFileName);
		approvalFile.setFileSize(part.getSize());
		return approvalFile;
	}

	
}
