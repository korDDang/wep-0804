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
String id=request.getParameter("id");
try{
	String sql="delete from info0804 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.executeUpdate();
	%>
	<script>
	alert("삭제 완료");
	location.href="infoSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>