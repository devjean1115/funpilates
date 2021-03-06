<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>Insert title here</title>
<link href="./css/default.css" rel="stylesheet" type="text/css">
<link href="./css/subpage.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<script>
	window.onload = function(){
	    document.getElementById("sbtn").onclick = chkData;
	 }
	
	  function chkData(){
	 if(document.fr.name.value == ""){
	 		alert("이름을 입력하세요.");
		    document.fr.name.focus();
		    return false;
	 }
	    
	 if(document.fr.beginDate.value == ""){
	    alert("비밀번호를 입력하세요.");
	    document.fr.password.focus();
	    return false;
	 }
	 
	 if(document.fr.password.value != document.fr.password2.value){
		      alert("비밀번호가 맞지 않습니다..");
		      document.fr.password.focus();
		      return false;
		   }
	 
	if($("#ibtn").val()!="승인 완료"){
		 alert("중복체크하세요")
		 document.fr.ibtn.focus();
		 return false;
	 }
	}
	  
	  $('#phoneNumber_front option[value="${param.phNumberFrontCheck}"]').prop('selected',true);	  
</script>

<body>
								<%-- About Us 좌측 목록 --%>	
	<jsp:include page="ManagementList.jsp"/>
		<%-- -------------------------------------------------------------------- --%>	

<article id="aboutUs"> 
	<h1>Add Wait_List</h1>
		<form action="MemberController.do?req=updateWaitList" id="join" method="post" name="fr">
		<fieldset>
			<label>구분</label>
				<input type="radio" name="sel" value="회원" checked>회원
			<hr>	
			<label>MobilePhoneNumber</label>	
				<select id="phoneNumber_front" name="phoneNumber_front" readOnly>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="019">019</option>
				</select>
				<input type="text" id="phoneNumber" name="phoneNumber" value="${param.phNumberCheck}" size="30" readOnly>
			<hr>
			<label>User ID</label>
				<input type="text" id="id" name="id" class="id" placeholder="자동입력됩니다." value="${param.phNumberCheck}" size="30" readOnly>
			<hr>
			<label>Name</label>
				<input type="text" id="name" name="name" size="30">
			<hr>
			<label>Membership</label> 
				<select id="membership" name="membership">
					<option value="10">10회</option>
					<option value="30">30회</option>
					<option value="50">50회</option>
					<option value="100">100회</option>
				</select><br><br>
			<hr>	
			<label>Begin Date</label>
				 <input type="date" id="beginDate" name="beginDate">
			<hr>	
			<label>Exp. Date</label>
			 	<input type="date" id="expDate" name="expDate">
			 	<hr>	
			<label>Level</label>
			 	<select id="level" name="level">
					<option value="basic">초급</option>
					<option value="intermediate">중급</option>
					<option value="advanced">고급</option>
				</select><br><br>
				<hr>
		</fieldset>
		
		<div class="clear"></div>
		<div id="buttons">
			<input type="submit" id="sbtn" value="작성완료" class="submit">
		</div>
	</form>
	</article>
	<div class="clear"></div>
</body>
<script>
		document.getElementById('beginDate').valueAsDate = new Date();
		document.getElementById('expDate').valueAsDate = new Date();
</script>

</html>