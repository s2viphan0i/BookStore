package com.trungtamjava.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns= {"/admin/pages/*","/client/user/*"})
public class LoginFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
		HttpServletRequest httpReq	 = (HttpServletRequest) req;
		HttpSession session = httpReq.getSession();
		if(session.getAttribute("current_user")!=null) {
			chain.doFilter(req, resp);
		}
		else {
			HttpServletResponse httpResp = (HttpServletResponse) resp;
			String url = httpReq.getRequestURI();
			if(url.contains("admin")) {
				httpResp.sendRedirect("/BookShopOnline/login");
			}else if(url.contains("user")) {
				httpResp.sendRedirect("/BookShopOnline/client/login");
			}
		}
		resp.setCharacterEncoding("UTF-8");
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
