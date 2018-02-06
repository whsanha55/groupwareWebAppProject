package com.bit.groupware.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.bit.groupware.domain.employee.EmployeeVO;
import com.bit.groupware.domain.employee.PhotoVO;


public class UploadPhotos {

	private static final Logger logger = LoggerFactory.getLogger(UploadPhotos.class);
	private static int count = 1;
	
	public static PhotoVO uploadFile(MultipartFile part, ServletContext context) throws IOException {
		String root = context.getRealPath("/");
		String path = root + "resources/upload/employeeFiles/photos/";

		String photoName = part.getOriginalFilename();
		String systemFileName = "";
		File file = new File(path + File.separator + photoName);
		if (file.exists()) {
			systemFileName = photoName.substring(0, photoName.lastIndexOf(".")) + "_" + count
					+ photoName.substring(photoName.lastIndexOf("."));
			count++;
		} else {
			systemFileName = photoName;
		}
		
		File dest = new File(path + File.separator + systemFileName);
		part.transferTo(dest);

		PhotoVO photo = new PhotoVO();
		photo.setPhotoName(photoName);
		photo.setSystemFileName(systemFileName);
		photo.setFileSize(part.getSize());
		return photo;
	}
}
