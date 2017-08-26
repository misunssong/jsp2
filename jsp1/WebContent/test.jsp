<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
function test(){
	var name = $("#name").val();
	var age = $("#age").val();
	var result = "이름:" + name +"<br>";
	result += "나이:" + age;
	$("#result_div").html(result);
}
$(document).ready(function(){
	$("#btn1").click(function(){
		var name = $("#name").val();
		var age = $("#age").val();
		var result = "이름:" + name +"<br>";
		result += "나이:" + age;
		$("#result_div").html(result);
	})
})
</script>
</head>

<body>
이름 : <input type="text" name="name" id="name"><br>
나이 : <input type="text" name="age" id="age"><br>
<div id="result_div"></div>
<input type="button" value="클릭" id="btn1">
</body>

</html>