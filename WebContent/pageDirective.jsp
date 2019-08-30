<%@page import="java.io.BufferedReader"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList, java.io.BufferedReader"%>
<!-- 응답 MIMW 타입돠 문자이콘딩을 지정한다. -->
<%@ page contentType="text/html;charset=utf-8"%>
<!-- 문자 인코딩을 지정한다. -->
<%@ page pageEncoding="UTF-8" %>
<!-- HttpSession 객체를 사용여부 결정한다. -->
<%@ page session = "false" %>

<%@ page isErrorpage ="ture" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP page directive Demo</title>
<script>
	let aa = '성영한';
	let str = `나는  ${aa} 입니다.`
	console.log(str);
</script>
</head>
<body>
	<h1>jsp page directive1111</h1>
	<%
		HttpSession ses = null;
	    ArrayList list = new ArrayList();
	    BufferedReader br = null;
	    request.setAttribute("name","sung");
	    String id = request.getParameter("id");
	    if(id == null){
	    	id = "";
	    }
	%>
	당신의 이름 : ${name}
	당신의 이름 : ${param.id} , <%=id %>
</body>
</html>