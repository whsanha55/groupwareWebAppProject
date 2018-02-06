package com.bit.groupware.view;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadPlanFileView extends AbstractView {
	private static final Logger logger = LoggerFactory.getLogger(DownloadPlanFileView.class);
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
		HttpServletRequest req, HttpServletResponse resp)
		throws Exception {

		String fileName = (String) model.get("fileName");
		String systemFileName = (String) model.get("systemFileName");

		String userAgent = req.getHeader("User-Agent");
		if (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) {
			// IE인 경우
			fileName = URLEncoder.encode(fileName, "utf-8");
		} else {
			// 다른 웹 브라우저 인 경우
			fileName = new String(fileName.getBytes("utf-8"), "ISO_8859_1");
		}

		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		try {
			String path = req.getSession().getServletContext().getRealPath("/upload");
			logger.info("Upload Path : {}", path);
			
			fis = new FileInputStream(path + File.separator + systemFileName);
			byte[] buf = new byte[1024];
			int readByte = 0;
			sos = resp.getOutputStream();
			while ((readByte = fis.read(buf)) != -1) {
				sos.write(buf, 0, readByte);
			}
		} catch (Exception e) {
			logger.error("exception : {}", e);
			throw e;
		} finally {
			try {
				if (sos != null) sos.close();
				if (fis != null) fis.close();
			} catch (Exception e2) {
				logger.error("exception : {}", e2);
				throw e2;
			}
		}

	}

}
