<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="red" value="빨강이야~~"/>
<title>게시판</title>
</head>
<body>
${list}
${userList}
${red}
<table border='1'>
	<tr>
		<td>번호</td>
		<td>이름</td>
		<td>내용</td>
		<td>생성자</td>
		<td>생성일자</td>
	</tr>
	<c:forEach var="b" items="${boardList}">
		<tr>
			<td>${b.bNum}</td>
			<td>${b.title}</td>
			<td>${b.content}</td>
			<td>${b.writer}</td>
			<td>${b.regDate}</td>
			
		</tr>
	</c:forEach>		
</table>
게시판 리스트 입니다.
</body>
</html>