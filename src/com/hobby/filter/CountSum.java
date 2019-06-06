package com.hobby.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CountSum implements Filter {

	// 记录来访数量
	private int count;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
        String param = filterConfig.getInitParameter("count");// 获取初始值
        count = Integer.valueOf(param);
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		count++;
		HttpServletRequest req = (HttpServletRequest) request;
		ServletContext context = req.getSession().getServletContext();
		context.setAttribute("count", count);// 保存到ServletContext中
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
	}

}
