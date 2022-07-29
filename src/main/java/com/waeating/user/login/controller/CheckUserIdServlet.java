package com.waeating.user.login.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.waeating.user.login.model.service.UserService;

/**
 * Servlet implementation class CheckUserIdServlet
 */
@WebServlet("/member/user/ckeckId")
public class CheckUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String userId = request.getParameter("userId");
		System.out.println("userId : " + userId);
		
		UserService userService = new UserService();
		
		int result = userService.dubleCkId(userId);
		
		System.out.println("result : " + result);
		
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(result);
		
		out.flush();
		out.close();
	} 

}
