package com.ec.survey.ctrl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ec.survey.dao.DAOFactory;
import com.ec.survey.dao.UserDAO;
import com.ec.survey.dto.User;

public class UserManage extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mutex1 = "";
		// String mutex2="";
		String op = request.getParameter("op");
		if ("addUser".equals(op)) {
			String email = request.getParameter("email");
			String nickname = request.getParameter("nickname");
			String password = request.getParameter("password");
			UserDAO dao = DAOFactory.getUserDAO();
			User user = new User();
			user.setEmail(email);
			user.setNickname(nickname);
			user.setPassword(password);
			try {
				dao.addUser(user);
				request.getSession().setAttribute("user", user);
				

				response.sendRedirect("../OpResult.jsp?op=reg&ret=true");
			} catch (Exception e) {
				response.sendRedirect("../OpResult.jsp?op=reg&ret=false");
			}

		} else if ("userLogin".equals(op)) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			UserDAO dao = DAOFactory.getUserDAO();
			User user;
			try {
				user = dao.findOneUserByEmail(email);
				if (user.getPassword().equals(password)) {
					request.getSession().setAttribute("user", user);
					response.sendRedirect("../OpResult.jsp?op=login&ret=true");
				} else {
					response.sendRedirect("../OpResult.jsp?op=login&ret=false");
				}
			} catch (Exception e) {
				response.sendRedirect("../OpResult.jsp?op=login&ret=false");
			}

		}
	}
}
