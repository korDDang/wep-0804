<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>호봉 정보 조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<h2>호봉 정보 조회</h2>
<hr>
<table border="1" class="tab1">
<tr>
	<th class="th1">no</th>
	<th class="th1">등급</th>
	<th class="th1">급여</th>
	<th class="th1">구분</th>
</tr>
<%
DecimalFormat fo=new DecimalFormat("###,###");
int no=0;
try{
	String sql="select * from hobong0804";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String dunggub=rs.getString(1);
		String dunggub2=rs.getString(1);
		switch(dunggub2){
		case "1": dunggub2="1급";
		break;
		case "2": dunggub2="2급";
		break;
		case "3": dunggub2="3급";
		break;
		case "4": dunggub2="4급";
		break;
		case "5": dunggub2="5급";
		break;
		}
		int salary=rs.getInt(2);
		no++;
	
%>
<tr>
	<td><%=no %></td>
	<td><%=dunggub2 %></td>
	<td class="td2"><%=fo.format(salary) %></td>
	<td class="td1">
	<a href="update_hobong.jsp?dunggub=<%=dunggub %>">수정</a> /
	<a href="delete_hobong.jsp?dunggub=<%=dunggub %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
	</td>
</tr>
<%
	}
	}catch(SQLException e){
		e.printStackTrace();
		System.out.println("조회 실패");
	}
%>
</table>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>