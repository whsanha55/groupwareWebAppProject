package com.bit.groupware.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.employee.PhotoVO;
import com.bit.groupware.domain.employee.PlanFileVO;


public class UploadPlanFiles {

	private static final Logger logger = LoggerFactory.getLogger(UploadPlanFiles.class);
	private static int count = 1;

	public static PlanFileVO uploadFile(MultipartFile part, ServletContext context) throws IOException {
		String root = context.getRealPath("/");
		String path = root + "resources/upload/employeeFiles/planFiles/";
		logger.info("path : {} ", path);

		String fileName = part.getOriginalFilename();
		String systemFileName = "";
		File file = new File(path + File.separator + fileName);
		if (file.exists()) {
			systemFileName = fileName.substring(0, fileName.lastIndexOf(".")) + "_" + count
					+ fileName.substring(fileName.lastIndexOf("."));
			count++;
		} else {
			systemFileName = fileName;
		}
		
		File dest = new File(path + File.separator + systemFileName);
		part.transferTo(dest);

		PlanFileVO planFile = new PlanFileVO();
		planFile.setFileName(fileName);
		planFile.setSystemFileName(systemFileName);
		planFile.setFileSize(part.getSize());
		return planFile;
	}

}