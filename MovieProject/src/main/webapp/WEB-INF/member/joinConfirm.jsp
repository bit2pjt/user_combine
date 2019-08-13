<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원인증</title>
</head>
<body>
	<script type="text/javascript">
	<%
	String m_cert = (String)request.getAttribute("confirm");
	if(m_cert.equals("success")){
	%>
		alert('회원가입을 축하합니다. 이제 로그인이 가능 합니다.');

	<%
	}else if(m_cert.equals("before")){ 
	%>

		alert('이미 인증된 회원입니다.');

	<%
	} else{
	%>
		alert('유효하지 않은 인증키입니다. 관리자에게 문의해주세요.');
	<%
	}
	%>
		window.open('', '_self', ''); //브라우저창 열기
		window.close(); // 브라우저 창 닫기
	</script>
</body>
</html>
