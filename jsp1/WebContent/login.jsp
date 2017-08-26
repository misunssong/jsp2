<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="8kb"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
	$("input[type='button']").click(function(){
		var value=this.value;
		if(value=="회원탈퇴"){
			$("#command").val("delete");
		}
		this.form.submit();
	})
})
</script>

<body>
<%
//String login =(String)session.getAttribute("login");
//String login=null;
Map<String, String> user = null;
if(session.getAttribute("user")!=null){
	user = (Map <String, String>)session.getAttribute("user");//getAttribute return type은 object
}
if(user==null){	
%>
	<form action="login.user" method="post">
		아이디: <input type="text" name="id" id="id" ><br>
		비밀번호: <input type="password" name="pwd" id="pwd"><br>
		<input type="hidden" name="command" id="command" value="login">	
		<input type="submit" value="로그인" >
	</form>
<%
	}else{
		String id = user.get("id");
		String user_no = user.get("user_no");
		String name = user.get("name");
		String hobby = user.get("hobby");
		String result = user_no+"번째로 가입하신"+ name + "님 반갑습니다.<br>";
		result += name +"님의 id는 " + id + "이며 취미는 아래와 같습니다.<br>";
		result +="취미 : " + hobby;
		out.print(result);
%>
<form action="some.user" method="post">
<input type="button" value="로그아웃">
<input type="button" value="회원탈퇴" >
<input type="button" value="회원정보수정">
<input type="hidden" name="command" id="command" value="logout">
<input type="hidden" name="user_no" value="<%=user_no%>">
</form>
<%
}
%>
</body>
</html>