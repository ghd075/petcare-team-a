<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<div>
		<h1>예약정보</h1>
	</div>
	
	<form role="form" action="/appointment/modify" method="post">
		<input type='hidden' name='apptNo' value="${appt.apptNo}">
		<input type="hidden" name='pageNum' value="${cri.pageNum}">
		<input type="hidden" name='amount' value="${cri.amount}">
	
		<div>
			예약날짜 : <input value=<fmt:formatDate value="${appt.apptDate}" pattern="yyyy/MM/dd"/> readonly="readonly">
		</div>
		<div>
			예약시간 : <input value=<fmt:formatDate value="${appt.apptTime}" pattern="HH:mm"/> readonly="readonly">
		</div>
		<div>
			동물이름 : <input value="${appt.petNo}" readonly="readonly">
		</div>
		<div>
			예약아이디 : <input value="${appt.userId}" readonly="readonly">
		</div>
		<div>
			예약상태<select name="apptStatus">
				<option value="0" <c:if test="${appt.apptStatus == 0}">selected</c:if>>예약완료</option>
				<option value="1" <c:if test="${appt.apptStatus == 1}">selected</c:if>>에약취소</option>
			</select>
		</div>
			<button type="submit" data-oper='modify'>수정</button>
			<button type="submit" data-oper='remove'>삭제</button>
			<button type="submit" data-oper='list'>목록</button>
		<div>
		
		</div>
	</form>
</div>
<script>
$(document).ready(function(){
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		
		var operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", '/appointment/remove?apptNo=${appt.apptNo}');
		}else if(operation === 'list'){
			formObj.attr("action", "/appointment/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		
		formObj.submit();
	});
});
</script>
</body>
</html>