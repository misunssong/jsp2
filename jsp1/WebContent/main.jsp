<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
</head>
<script>
$(document).ready(function(){
	$("input[type='button']").click(function(){
		var value= this.value;
		//alert(this.getAttribute("data-url"));// 앞에 data- 가 붙으면 무조건 커스텀태그 라고 생각하면 됨
		var url = this.getAttribute("data-url");
		var urls = url.split(".");
		if(urls[1].indexOf("jsp")!=-1){
			location.href=url;
		}else{
			$("#command").val(urls[0]);
			this.form.submit();
		}
	})
})
</script>
<body>
<%
if(user!=null){
	String id = user.get("id");
	String user_no = user.get("user_no");
	String name = user.get("name");
	String hobby = user.get("hobby");
	String result = user_no+"번째로 가입하신 "+ name + "님 반갑습니다.<br>";
	result += name +"님의 id는 " + id + "이며 취미는 아래와 같습니다.<br>";
	result +="취미 : " + hobby;
	out.print(result);
%>

<form action="some.user" method="post" >
<input type="button" value="로그아웃" data-url="logout.user">
<input type="button" value="회원탈퇴" data-url="delete.user">
<input type="button" value="회원정보수정" data-url="/user/update.jsp?user_no=<%=user_no%>">
<input type="button" value="회원리스트" data-url="/user/list.jsp">
<input type="button" value="게시판가기" data-url="/board/board_list.jsp">
<input type="hidden" name="command" id="command" value="logout">
<input type="hidden" name="user_no" value="<%=user_no%>">
</form>
<%
}
%>
</body>

</html>