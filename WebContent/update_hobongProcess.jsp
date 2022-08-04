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
String salary=request.getParameter("salary");
try{
	String sql="update hobong0804 set salary=? where dunggub=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(2, dunggub);
	pstmt.setString(1, salary);
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정 완료");
	location.href="hobongSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>