<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>급여 정보 조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section>
<h2>급여 정보 조회</h2>
<hr>
<table border="1" class="tab1">
<tr>
	<th class="th1">no</th>
	<th class="th1">사원번호</th>
	<th class="th1">이름</th>
	<th class="th1">급여</th>
	<th class="th1">가족수당</th>
	<th class="th1">직책수당</th>
	<th class="th1">근속수당</th>
	<th class="th1">기타수당</th>
	<th class="th1">급여합계</th>
</tr>
<%
DecimalFormat fo=new DecimalFormat("###,###");
int no=0;
int total=0;
try{
	String sql="select s.id,i.name,h.salary,s.gajok,s.jikchak,s.gunsok,s.gitasudang from sudang0804 s,info0804 i,hobong0804 h where s.id=i.id and i.position=h.dunggub" ;
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String name=rs.getString(2);
		int salary=rs.getInt(3);
		int gajok=rs.getInt(4);
		int jikchak=rs.getInt(5);
		int gunsok=rs.getInt(6);
		int gitasudang=rs.getInt(7);
		total=gajok+jikchak+gunsok+gitasudang+salary;
		no++;
	
%>
<tr>
	<td class="td1"><%=no %></td>
	<td class="td1"><%=id %></td>
	<td class="td1"><%=name %></td>
	<td class="td2"><%=fo.format(salary) %></td>
	<td class="td2"><%=fo.format(gajok) %></td>
	<td class="td2"><%=fo.format(jikchak) %></td>
	<td class="td2"><%=fo.format(gunsok) %></td>
	<td class="td2"><%=fo.format(gitasudang) %></td>
	<td class="td2"><%=fo.format(total) %></td>
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