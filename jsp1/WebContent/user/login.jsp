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
		if(this.id=="btnLogin")return;
		var value=this.value;
		if(value=="회원탈퇴"){
			$("#command").val("delete");
		}else if(value=="회원정보수정"){
			location.href="/user/update.jsp";
			return;
		}else if(value=="회원리스트"){
			location.href="/user/list.jsp";
			return;
		}
		this.form.submit();
	})
})
</script>

<body>
<%
Map<String, String> user = null;
if(session.getAttribute("user")!=null){
	user = (Map <String, String>)session.getAttribute("user");//getAttribute return type은 object
}
if(user==null){	
%>
<script>
var AjaxUtil = function(p_url, p_params, p_method, p_aSync){
	if(!p_url||p_url.trim()==""){
		alert("AjaxUtil 호출시 url은 필수 입니다.");
		return;
	}
	this.params = p_params;
	var getHttpXmlObj = function(){
		if(window.XMLHttpRequest){
	  		return new XMLHttpRequest();
	 	}else if(window.ActiveXObject){
	  		return new ActiveXObject("Microsoft.XMLHTTP");
	 	}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj();
	var method = p_method?p_method:"get";
	var url = p_url;
	//var aSync = true;//중요한 부분: 비동기가 true 동기가  false
	var aSync = p_aSync?p_aSync:true;
	this.xhr.callback=null;
	this.xhr.onreadystatechange=function(){
   		if (this.readyState==4){// readyState는 0~4 까지 밖에 없음, 4가 되야 서버에서 받을수 있음
   			if(this.status==200){//200번이어야 서버에서 받은 거 구나.
	   			var result = decodeURIComponent(this.responseText);//여기서 this는 xhr을 의미함
	   			if(this.callback){ 
	   				this.callback(result);
	   			}else{
	   				alert(result);
	   			}
   			}else{
   				var result = decodeURIComponent(this.responseText);
   				alert(result);
   			}
   		}
	}
	this.changeCallBack = function(func){
		this.xhr.callback = func;
	}
   	this.xhr.open(method, url+this.params, aSync);
   	this.send = function(){
   		this.xhr.send.arguments = this;
   	   	this.xhr.send();// 이게 실행되야 바로 서버로 넘어 감
   	}
}

$(document).ready(function(){
	$("#btnLogin").click(function(){	
		var idValue = $("#id").val().trim();
		var pwdValue = $("#pwd").val().trim();
		if(idValue==""){
			alert("아이디를 적어야지!");
			$("#id").val("");
			$("#id").focus();
			return;
		}
		if(pwdValue==""){
			alert("비밀번호 빼먹었네!!");
			$("#pwd").val("");
			$("#pwd").focus();
			return;
		}
		var param ={};
		param["id"]=idValue;
		param["pwd"]=pwdValue;
		
//		param = JSON.stringify(param);
//		alert(param);
		param = "?command=login&param="+JSON.stringify(param);
		param = encodeURI(param);
		var au = new AjaxUtil("test.user",param, "post");
		au.changeCallBack(callback);
		au.send();
	});
})
function callback(result){
	var re = JSON.parse(result);
	alert(re.result);
	location.href=re.url;
}
</script>
	<form action="login.user" method="post">
		아이디: <input type="text" name="id" id="id" ><br>
		비밀번호: <input type="password" name="pwd" id="pwd"><br>
		<input type="hidden" name="command" id="command" value="login">	
		<input type="button" id="btnLogin" value="로그인" >
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

<form action="some.user" method="post" >
	<input type="button" value="로그아웃">
	<input type="button" value="회원탈퇴" >
	<input type="button" value="회원정보수정">
	<input type="button" value="회원리스트">
	<input type="hidden" name="command" id="command" value="logout">
	<input type="hidden" name="user_no" value="<%=user_no%>">
</form>
<%
}
%>
</body>
</html>