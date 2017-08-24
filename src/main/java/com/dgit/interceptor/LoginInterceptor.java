package com.dgit.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dgit.domain.UsersVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	private static final String LOGIN = "login";
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Login Interceptor PreHandle ---------@");
		return super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("Login Interceptor PostHandle ---------@");
		UsersVO vo = (UsersVO) modelAndView.getModel().get("loginVO");
		if(vo != null ){
			//로그인 처리시 session영역에 login한 사람의 정보 넣음
			HttpSession session = request.getSession();
			session.setAttribute(LOGIN, vo.getUid());
			String uid = (String) session.getAttribute("login");
			System.out.println("넣고 난 후 세션값:"+uid);
			//login이전에 이동될 uri가 있다면 dest에 저장을 해두었음.
			//저장된 dest의 값을 받아, 그곳으로 이동되도록 함.
			String path = (String) session.getAttribute("dest");
			if(path != null){
				System.out.println("돌아가는 path 확인:"+path);
				response.sendRedirect(path);
			}
		}else if(vo == null && modelAndView.getModel().get("UserIsExist")==null){
			System.out.println("vo is null, redirect,,");
			response.sendRedirect("login?UserIsExist="+false);// 회원가입으로 유도해야하나, 화면X 이리 처리함.
				
		}
	}
	
}
