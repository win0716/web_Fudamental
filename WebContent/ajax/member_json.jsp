<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json;charset=utf-8"%>
<%
	MemberDao dao = MemberDao.getInstance();
	int start = Integer.parseInt(request.getParameter("start"));
	int length = Integer.parseInt(request.getParameter("length"));
	out.print(dao.selectJson(start, length));
%>

