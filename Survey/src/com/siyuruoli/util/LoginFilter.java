package com.siyuruoli.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 
 */
//@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
       
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest=(HttpServletRequest)request;
		HttpServletResponse httpResponse=(HttpServletResponse)response;
		HttpSession httpSession=httpRequest.getSession();
		
        String uri=httpRequest.getRequestURI();
		
		Object user=httpSession.getAttribute("user");
		
		if(uri.indexOf("login.shtml")>0||uri.indexOf("register.shtml")>0||uri.indexOf("entry.shtml")>0
				){
			chain.doFilter(request,response);
		}else{
			if(user!=null){
				// 登录的场合，请求传递给下一个目标资源
				chain.doFilter(request, response);
				return;
			}else{
				// 没登录的场合，页面转到login.jsp
				System.out.println("------");
				httpResponse.sendRedirect("/Survey/jsp/entry.jsp");
			}
		
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
