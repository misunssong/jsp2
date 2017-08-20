<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.sql.Statement" %>  
    <%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login page</title>
</head>
<body>
<%
		String id = request.getParameter("id1");//getParameter의 return type은 무조건 String
		String pwd = request.getParameter("pwd1");
		String dbUrl = "jdbc:mysql://localhost:3306/jspstudy";
		String dbId="root";
		String dbPwd = "misunssong";
		Connection con;
		PreparedStatement ps;
		String result = id + "는 없는 아이디 입니다.";
		try {
		 Class.forName("org.mariadb.jdbc.Driver");
		 con = DriverManager.getConnection(dbUrl, dbId, dbPwd);
		 System.out.println("연결 성공");
		 String sql="select * from user where id=?";
		 ps = con.prepareStatement(sql);
		 ps.setString(1, id);
		 ResultSet rs = ps.executeQuery();//select만 executeQuery()를 쓰고 나머지는 executeUpdate()를 쓴다.
		 out.println("<table border=1>");
		 while(rs.next()) {
			if (pwd.equals(rs.getString("password"))){
				result= "로그인 성공하셨네요!";
				session.setAttribute("login" , "true");
				session.setAttribute("id", id);
			}else{
				result= "비밀번호가 틀리셨습니다.";
			}
		 }
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch (SQLException e) {
			e.printStackTrace();
		}

boolean login =false;
%>
<%=session.getId()%>
<%=session.getAttribute("test") %>
<script>
	alert("<%=result%>");
	location.href="/login.jsp";
</script>
</body>
</html>