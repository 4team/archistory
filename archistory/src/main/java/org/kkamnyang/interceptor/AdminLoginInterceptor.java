package org.kkamnyang.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "login";

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object admin = modelMap.get("adminVO");
		
		if(admin != null){
			System.out.println("Admin의 로그인 성공======= : AdminLoginInterceptor");
			session.setAttribute(LOGIN, admin);
			response.sendRedirect("/");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		return super.preHandle(request, response, handler);
	}
	
	
	
}
