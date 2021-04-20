<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="login.model.*, login.service.*" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>  

<%
//로그인 화면으로 부터 DATA받기
String id = request.getParameter("userid");
String password = request.getParameter("password");

LoginService service  =  LoginService.getInstance();
List<LoginRec> list = service.confirmMember(id,password);

int uscd = 0;
int age = 0;
String address = null;
String name = null;

if(list.size()==0) {
	
}else{
	uscd = list.get(0).getUscd();
	address = list.get(0).getAddress();
	age = list.get(0).getAge();
	name = list.get(0).getName();
}

%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인 세션</title>
</head>
<script type="text/javascript">

function reject() {
	alert("아이디 또는 비밀번호를 다시확인해주세요.");
	location.href='login.jsp';
}



</script>

<body>

<%
//로그인 결과에 따른 작업

	if(list.size()==0) {
		out.println("<script>reject()</script>");
	}else{
		
			
		session.setAttribute("uscd", uscd);
		session.setAttribute("age", age);
		session.setAttribute("address", address);
		session.setAttribute("name", name);
		
		response.sendRedirect("../index.jsp");
		
	}


%>


</body>
</html>