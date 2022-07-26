package com.itbank.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

// 인터셉터 : 요청을 가로채서 사전 체크를 할 수 있고, 여러 주소에 대해 적용할 수 있다\
// 인터셉터는 클래스 상속을 통해 구현한다
// 인터셉터가 작동할 수 있는 시점은 크게 3가지로 분류한다
// 1) 요청이 컨트롤러에 도달하기 전							(preHandle)
// 2) 요청이 컨트롤러에 도착하고 나서 응답이 클라이언트에 도달하기 전	(postHandle)
// 3) 요청 처리가 끝나고, 클라이언트가 응답을 받은 이후 			(afterCompletion)
// 여기서 말하는 handler는 컨트롤러의 메서드를 의미한다

// 상속을 작성한 이후, 우클릭 - source - override/implement method

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String login = (String)session.getAttribute("login");
		String url = null;
		url = request.getRequestURI().toString();
		url = URLEncoder.encode(url, "utf-8"); // 특수기호 때문에 urlEncoding 처리함
		
		if(login == null) {
			System.out.println("preHandle (false)");
			System.out.println("인터셉터에 의해 로그인 페이지로 이동합니다");
			System.out.println("로그인 이후 이동할 주소 : " + url);
			response.sendRedirect(request.getContextPath() + "/login?url=" + url);
			return false;	// 로그인이 없으면 일시정지, 이후 원하는 코드 추가 기능
		}
		
		System.out.println("preHandle (true)");
		return true;		// 로그인이 있으면 원래 예정대로 계속 진행
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion");
	}

}
