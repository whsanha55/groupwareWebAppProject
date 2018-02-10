package com.bit.groupware.security;

import javax.servlet.RequestDispatcher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.bit.groupware.domain.authority.UserVO;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	private static final Logger logger = LoggerFactory.getLogger(LoginSuccessHandler.class);

	public void onAuthenticationSuccess(javax.servlet.http.HttpServletRequest request,
			javax.servlet.http.HttpServletResponse response, Authentication authentication)
			throws java.io.IOException, javax.servlet.ServletException {

		String role = request.getParameter("role");
		logger.info("==================================== role : {}", role);
		
		if (role.equals("user")) {
			// RequestDispatcher dispatcher =
			// request.getRequestDispatcher("/WEB-INF/views/common/index.jsp");
			// dispatcher.forward(request, response);
			response.sendRedirect(request.getContextPath() + "/index.do");
		} else if (role.equals("admin")) {
			UserVO user = (UserVO) authentication.getPrincipal();
			String isAdmin = user.getIsAdmin();
			if (isAdmin.equals("T")) {
				response.sendRedirect(request.getContextPath() + "/admin/index.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/login.do?authFail=true");
			}
		}
	}

}
