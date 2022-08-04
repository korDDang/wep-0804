<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp"%>
<%
String dunggub=request.getParameter("dunggub");
try{
	String sql="delete from hobong0804 where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dunggub);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제 완료");
	location.href="hobongSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>