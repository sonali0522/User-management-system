package com.org.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.org.dao.UserDao;
import com.org.dto.User;

@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet{
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String oldPassword = req.getParameter("oldPassword");
	int id  =Integer.parseInt(req.getParameter("id"));
	String newPassword = req.getParameter("newPassword");
	String confirmPassword = req.getParameter("confirmPassword");
	
	UserDao dao = new UserDao();
	User u = UserDao.fetchUserById(id);
	
	HttpSession session = req.getSession();

	if (u.getPassword().equals(oldPassword)) {
		
		if (newPassword.equals(confirmPassword)) {
			dao.updateUserPasswordById(id, newPassword);
			
			session.setAttribute("success","Password updated successfully");
			resp.sendRedirect("home.jsp");
		} else {
			session.setAttribute("fail","Invalid 0ld password");
			resp.sendRedirect("changePassword.jsp");
		}
	}
	else {
			session.setAttribute("fail","New password and confirm password should be same");
			resp.sendRedirect("changePassword.jsp?id=" + id);
	}
}
}