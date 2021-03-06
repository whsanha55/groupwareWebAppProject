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

public class DownloadApprovalFileView extends AbstractView {
	private static final Logger logger = LoggerFactory.getLogger(DownloadApprovalFileView.class);
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, 
		HttpServletRequest req, HttpServletResponse resp)
		throws Exception {

		String originalFileName = (String) model.get("originalFileName");
		String systemFileName = (String) model.get("systemFileName");

		String userAgent = req.getHeader("User-Agent");
		if (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1) {
			// IE인 경우
			originalFileName = URLEncoder.encode(originalFileName, "utf-8");
		} else {
			// 다른 웹 브라우저 인 경우
			originalFileName = new String(originalFileName.getBytes("utf-8"), "ISO_8859_1");
		}

		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\";");
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		try {
			String path = req.getSession().getServletContext().getRealPath("/resources/upload/approvalFile");
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
