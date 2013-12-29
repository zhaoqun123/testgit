package com.ec.survey.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SecurityFilter implements Filter {

	public SecurityFilter() {
		// TODO Auto-generated constructor stub
	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String reg = request.getParameter("reg");
		HttpSession session = ((HttpServletRequest) request).getSession();
		try {
			if (!reg.equals("1")) {
				if (session.getAttribute("username") != null
						&& (!"".equals(session.getAttribute("username")))) {
					chain.doFilter(request, response);
					return;
				}
				((HttpServletResponse) response).sendRedirect("../login.jsp");
				return;

			}
			chain.doFilter(request, response);

		} catch (Exception e) {
			System.out.println("request addr " + request.getRemoteAddr());
			System.out.println("request path " + request.getRemoteHost());
			chain.doFilter(request, response);
		}

		return;
	}

	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub

	}

}
