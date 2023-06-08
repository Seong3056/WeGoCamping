package com.camping.wego.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UserLoginHandler implements HandlerInterceptor {

	@Override
		public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
				ModelAndView modelAndView) throws Exception {

		log.info("요청 방식 : " + request.getMethod());

		if(request.getMethod().equals("POST")) {
			ModelMap map = modelAndView.getModelMap();
			String id = (String) map.get("user");
			String name = (String) map.get("name");

			if(id != null) {
				log.info("로그인 성공 로직이 동작합니다!");
				HttpSession session = request.getSession();
				session.setAttribute("login", id);
				session.setAttribute("name", name);
				response.sendRedirect(request.getContextPath() + "/");

			} else {
				modelAndView.addObject("msg", "loginFail");
			}

		}

	}

}
