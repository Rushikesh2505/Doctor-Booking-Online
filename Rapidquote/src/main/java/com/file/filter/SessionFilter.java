package com.file.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/sessionFilter")
public class SessionFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("In Filter INIT");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session = ((HttpServletRequest) request).getSession(false);

		if (session != null) {
			if (session.getAttribute("user") != null) {
				chain.doFilter(request, response);
			} else {
				request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
			}
		}else {
			request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
		}
		if (request.getParameter("sessionLocale") != null) {
			((HttpServletRequest) request).getSession().setAttribute("lang", request.getParameter("sessionLocale"));
		}

		/*
		 * if (session == null) { // generate a new session HttpSession newSession =
		 * ((HttpServletRequest) request).getSession(true);
		 * System.out.println("New Session : " + newSession.getId());
		 * 
		 * } else { System.out.println("Existed : " + session.getId()); }
		 */
		/* HttpSession session = request.getSession(false); */// don't create if it doesn't exist
		/*
		 * if (session.getAttribute("user") != null) { chain.doFilter(request,
		 * response); } else {
		 * request.getRequestDispatcher("/WEB-INF/pages/uploadFile.jsp").forward(
		 * request, response); }
		 */

	}

}