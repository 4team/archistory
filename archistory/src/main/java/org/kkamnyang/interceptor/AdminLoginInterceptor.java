package org.kkamnyang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "LOGIN";

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		System.out.println("POST Handle 실행됨==========");
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object admin = modelMap.get("adminVO");
		System.out.println("ADMIN"+admin);
		
		if(admin != null){
			System.out.println("Admin의 로그인 성공======= : AdminLoginInterceptor(postHandle)");
			session.setAttribute(LOGIN, admin);
			response.sendRedirect("/");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			System.out.println("로그인 전에 세션에 있는 로그인 데이터를 초기화한다.======: AdminLoginInterceptor (preHandel)");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	
	
}
