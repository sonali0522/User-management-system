<%@page import="com.org.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password Page</title>
<%@ include file="components/bootstrapCss.jsp" %>
</head>
<body>
<%
	User sessionUser = (User) session.getAttribute("userObj");
	if (sessionUser == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
		<%@ include file="components/homenavbar.jsp"%>
	
<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
					<%
					    int id = Integer.parseInt(request.getParameter("id"));
					%>
						<%
						String msg = (String) session.getAttribute("fail");
						if (msg != null) {
						%>
						 <h5 style="color: red;"><%= msg %></h5>
						<%
						session.removeAttribute("fail");
						}
						%>
						<% 
                        String msg1 = (String)session.getAttribute("success");
                        if(msg1 != null) { 
                        %>
                            <h5 style="color: green;"><%= msg1 %></h5>
                        <%  
                            session.removeAttribute("success");
                        }
                        %>
                        <p class="fs-4 text-center"><b>Change Password</b></p>
						<form action="changePassword" method="post">
							
							<div class="mb-3">
								<label class="form-label">Enter Old Password</label> <input
									name="oldPassword" type="password" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Enter New Password</label> <input
									name="newPassword" type="password" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Confirm New Password</label> <input
									name="confirmPassword" type="password" class="form-control" required>
							</div>
							<input type="hidden" name="id" value="<%=sessionUser.getId()%>">
							<button type="submit" class="btn bg-primary text-white col-md-12">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
   
  <%
	}
	%>
</body>
</html>