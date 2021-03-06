<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A</title>
<link href="./css/board.css" rel="stylesheet" type="text/css">
</head>
<body>
 
 <script type="text/javascript">
	
  	function checkPassword(password, reqNum){

  		var inputPasswd = prompt("비밀번호를 입력하세요");
			
  		if(password!=inputPasswd) {
  			alert("비밀번호가 맞지않습니다.");
  			return false;
  		} else {
  			location.href='BoardController.do?req=qNaContent&num='+reqNum;
  		}
  	}

 </script>


								<%-- Q&A 좌측 목록 --%>	
	<jsp:include page="Boardlist.jsp"/>
		<%-- -------------------------------------------------------------------- --%>	
	
	<article id="QnA">
	<c:set var="count" value="${count}"/>
	
	<h1>Q & A[전체글개수 :${count}]</h1>
	<table id="boardQnA">
	<tr><th class="tno">No.</th>
		<th class="tstatus">Status</th>
	    <th class="ttitle">Title</th>
	    <th class="twriter">Writer</th>
	    <th class="tdate">Date</th>
	</tr>
	<c:choose>    
	<c:when test="${count>0}">
		<c:forEach var="list" items="${qnaBoard}">
		 	<%-- ArrayList의 각인덱스 위치에 저장 되어 있는 BoardBean객체를 ArrayList배열로부터 얻어
			    BoardBean객체의 각변수값들을getter메소드를 통해 얻어 ~ 출력~ --%>
			<c:choose>
			<c:when test="${empty list.getPassword()||sessionScope.sel=='관리자'}">
				<tr onclick="location.href='BoardController.do?req=qNaContent&num=${list.getNum()}&pageNum=${pageNum}'">
			</c:when>
			<c:otherwise>
				<tr onclick="checkPassword(${list.getPassword()},${list.getNum()});">
			</c:otherwise>
			</c:choose>
				<td id="tdNum">${list.getNum()}</td>
				<td id="tdStatus">${list.getStatus()}</td>
				<td class="left"> 
					<c:if test="${empty list.getPassword()}">
						[공개]  
					</c:if>
					<c:if test="${!empty list.getPassword()}">
						[비공개]  
					</c:if>
					${list.getSubject()}
				</td>
				<td id="tdWriter">익명</td>
				<td id="tdDate">${list.getDate()}</td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr>
			<td colspan="5">게시판 글 없음</td>
		</tr>
	</c:otherwise>
	</c:choose>
	</table>
	
	<%-- 여긴 qna페이지라 로그인하지 않아도 글 쓸 수 있다. --%>
	<div id="table_search">
	<c:if test="${!(empty sessionScope.id)}">
		<input type="button" value="내가쓴글" class="btn" onclick="location.href='BoardController.do?req=myContents&id=${sessionScope.id}'"/>
	</c:if>
	</div>
	<div id="table_search">
		<input type="button" value="문의하기" class="btn" onclick="location.href='Main.jsp?center=board/write.jsp&title=Write'"/>
	</div>
	
	<div id="table_search">
		<input type="text" name="search" class="input_box">
		<input type="button" value="검색" class="btn">
	</div>
	
	<div class="clear"></div>
	<div id="page_control">	                   
		<%-- //[이전] 시작페이지 번호가 하나의 블럭에 보여줄페이지수보다 클때~ --%>
			<c:if test="${startPage > pageBlock}">	
				<a href="BoardController.do?req=QnAboard&selBoard=qna&pageNum=${startPage-pageBlock}"></a>
			</c:if>
			  
		<%-- // [1] [2] [3]....[10] 페이지번호 --%>
			<c:forEach var="cnt" begin="${startPage}" end="${endPage}" step="1">	
					<a href="BoardController.do?req=qna&pageNum=${cnt}">[${cnt}]</a>			
			</c:forEach>
		<%-- //[다음] 끝페이지 번호가 전체페이지 수 보다 작을때.. --%>	
			<c:if test="${endPage<pageCount}">	
				<a href="BoardController.do?req=qna&pageNum=${startPage+pageBlock}">[다음]</a>
			</c:if>
	</div>
<div class="clear"></div>
	</article>
<div class="clear"></div>
</body>
</html>
