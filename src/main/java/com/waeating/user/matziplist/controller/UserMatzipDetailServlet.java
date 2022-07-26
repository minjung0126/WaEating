package com.waeating.user.matziplist.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserMatzipDetailServlet
 */
@WebServlet("/user/matzip/detail")
public class UserMatzipDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		request.getRequestDispatcher("/WEB-INF/views/user/user_matzip/user_matzip_detail.jsp").forward(request, response);
	}	
}