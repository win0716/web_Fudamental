<%@ page pageEncoding="utf8"%>
<%
	//HttpSession 객체를 종료하는 3가지방법
	//1.브라우저를 종료했을 경우.
	//2.해당페이지의 시간이 30분 경과되면 자동종료.
	//3.invalidate() 메서드를 호출하면 자동종료.
	session.invalidate();
	response.sendRedirect("/");
%>