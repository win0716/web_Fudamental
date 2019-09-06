<%@page import="kr.co.kic.dev1.dao.MemberDao"%>
<%@ page contentType="application/json;charset=UTF-8"%>

<%
	String email = request.getParameter("email");
	MemberDao dao = MemberDao.getInstance();
	boolean isExisted = dao.isCheck(email);//
	if(isExisted){
%>
{"result" : "ok"}
<%}else{%>
{"result" : "fail"}
<%}%>