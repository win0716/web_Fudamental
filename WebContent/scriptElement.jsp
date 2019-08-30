<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="UTF-8"%>
<html>
	<body>
		<h1>Scripting Element</h1>
		<%!
			private int age;
			public void m(){
				
			}
		%>
		<%
			int tt;
			m();
		
		%>
		<select>
		<%
		Calendar c = Calendar.getInstance();
		int year =c.get(Calendar.YEAR);
		for(int i=1900;i<=2019;i++){
		%>
			<option value='<%=i%>'<%if((year-20)==i){%> selected="selected"<%} %>><%=i %></option>
			
			
			<%
		}
		%>
		</select>
</body>
</html>