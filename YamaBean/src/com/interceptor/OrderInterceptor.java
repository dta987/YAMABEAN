package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class OrderInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		System.out.println("Interceptor");
		
		System.out.println("요청주소 : " + request.getRequestURI());
	

		HttpSession session = request.getSession();
		if (session.getAttribute("loginInfo") != null) {

		} else {
			response.sendRedirect(request.getContextPath() + "/member/login");
		}

		return true;
	}

}
