package com.bit.groupware.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class UploadFiles {

	private static final Logger logger = LoggerFactory.getLogger(UploadFiles.class);
	private static int count = 1;

//	public static ArticleFileVO uploadFile(MultipartFile part, ServletContext context) throws IOException {
//		String path = context.getRealPath("/upload");
//		logger.info("path : {}",path);
//		
//		String originalFileName = part.getOriginalFilename();
//		String systemFileName = "";
//		File file = new File(path + File.separator + originalFileName);
//		if (file.exists()) {
//			systemFileName = originalFileName.substring(0, originalFileName.lastIndexOf(".")) + "_" + count
//					+ originalFileName.substring(originalFileName.lastIndexOf("."));
//			count++;
//		} else {
//			systemFileName = originalFileName;
//		}
//		
//		File dest = new File(path + File.separator + systemFileName);
//		part.transferTo(dest);
//
//		ArticleFileVO articleFile = new ArticleFileVO();
//		articleFile.setOriginalFileName(originalFileName);
//		articleFile.setSystemFileName(systemFileName);
//		articleFile.setFileSize(part.getSize());
//		return articleFile;
//	}

	
}
