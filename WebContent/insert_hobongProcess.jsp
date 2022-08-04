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
	String sql="insert into hobong0804 values(?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, dunggub);
	pstmt.setString(2, salary);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록 완료");
	location.href="hobongSelect.jsp";
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
}
%>
</body>
</html>