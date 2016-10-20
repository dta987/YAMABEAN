package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.member.dto.Member;

public class OrderInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {

		System.out.println("Interceptor");

		System.out.println("요청주소 : " + request.getRequestURI());

		HttpSession session = request.getSession();
		
		Member loginInfo = null;
		loginInfo = (Member)session.getAttribute("loginInfo");
		
		if (loginInfo == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
		} else if (((int)session.getAttribute("whologin")) == 1) {
			if(request.getRequestURI().indexOf("admin") == -1) {
				System.out.println(request.getRequestURI().indexOf("admin"));
				return true;
			} else {
				response.sendRedirect(request.getContextPath() + "/");
			}
		} else if (((int)session.getAttribute("whologin")) == 2) {
			return true;
		}
		
		return true;

	}
}
