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
	 	if(document.fr.password.value == ""){
	    	alert("비밀번호를 입력하세요.");
	    	document.fr.password.focus();
	    	return false;
	 	}
	 
	 	if(document.fr.password.value != document.fr.password2.value){
			alert("비밀번호가 맞지 않습니다..");
		    document.fr.password.focus();
		    return false;
		}
	}
	  
	function MemberInfo(){
		var id=${sessionScope.id};
		$.ajax({
				type : "post",
				asyn : false,
				url : "MemberController.do?req=memberInfoToEditByOneself",
				data : {id:id},
				dataType : "JSON",
				success : function(data, textStatus){
						$("#no").val(data.memberInfo.no);
						$("#from").val("member");
						$("#phoneNumber").val(data.memberInfo.id);
						$("#id").val(data.memberInfo.id);
						$("#name").val(data.memberInfo.name);
						$('#membership option[value="'+data.memberInfo.membership+'"]').prop('selected',true);
						$("#beginDate").val(data.memberInfo.beginDate);
						$("#expDate").val(data.memberInfo.expDate);
						$('#level option[value="'+data.memberInfo.level+'"]').prop('selected',true);
						$("#remaining").val(data.memberInfo.remaining);
						$("#phoneNumber_front option[value=]"+data.memberInfo.name.substr(0,3)+'"]').prop('selected',true);
			   }, //success : function()
				error:function(textStatus){
							console.log(textStatus)
							alert("에러가 발생했슈");
		 	   } // error :
			}); // ajax
		} // ()	  
	  
</script>
<body>
								<%-- About Us 좌측 목록 --%>	
	<jsp:include page="myPagelist.jsp"/>
		<%-- -------------------------------------------------------------------- --%>	

 	<article id="aboutUs"> 
	<h1>My Info</h1>
		<form action="MemberController.do?req=updateMemberInfoByOneself" id="join" method="post" name="fr">
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
				<input type="text" id="phoneNumber" name="phoneNumber" size="30" readOnly>
			<hr>
			<label>User ID</label>
				<input type="text" id="id" name="id" class="id" size="30" readOnly>
			<hr>
			<label>Name</label>
				<input type="text" id="name" name="name" size="30" readOnly>
			<hr>
			<label>Membership</label> 
				<select id="membership" name="membership" 
				onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">
					<option value="10">10회</option>
					<option value="30">30회</option>
					<option value="50">50회</option>
					<option value="100">100회</option>
				</select><br><br>
			<hr>	
			<label>Begin Date</label>
				 <input type="date" id="beginDate" name="beginDate" readOnly>
			<hr>	
			<label>Exp. Date</label>
			 	<input type="date" id="expDate" name="expDate" readOnly>
			<hr>
			<label>Level</label>
			 	<select id="level" name="level" 
			 	onFocus="this.initialSelect = this.selectedIndex;" onChange="this.selectedIndex = this.initialSelect;">>
					<option value="basic">basic</option>
					<option value="intermediate">intermediate</option>
					<option value="advanced">advanced</option>
				</select><br><br>
			<hr>	
			<label>Attendance Remaining</label>
			 	<input type="text" id="remaining" name="remaining" readOnly>
			<hr>
			<label>Password</label>
				<input type="password" id="password" name="password" placeholder="변경가능합니다." value="" size="30">
			* 변경할 비밀번호나 기존 비밀번호를 입력하세요
			<hr>
			<label>Retype_Password</label>
				<input type="password" id="password2" name="password2" class="password" >
			<hr>
		
		</fieldset>
		
		<script>MemberInfo();</script>
		
		<div class="clear"></div>
		<div id="buttons">
			<input type="hidden" id="no" name="no">
			<input type="hidden" id="from" name="from">
			<input type="submit" id="sbtn" value="확인" class="submit">
		</div>
		
	</form>
	</article>
	<div class="clear"></div>
</body>
</body>
</html>