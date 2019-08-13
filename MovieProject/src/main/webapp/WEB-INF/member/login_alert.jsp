<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
</head>
<body>
	<script type="text/javascript">
	<%
	String msg = (String)request.getAttribute("msg");
	if(msg!=null){
		if(msg.equals("delete")){
			%>
			alert('탈퇴한 회원입니다. \\n문의사항이 있을 경우 관리자에게 문의해주세요. ');
			<%
		}else if(msg.equals("cert")){
			%>
			alert('메일인증을 진행해주세요. \\n인증이 안될경우 관리자에게 문의해주세요.');
			<%
		}else if(msg.equals("pw")){
			%>
			alert('비밀번호가 다릅니다. 확인해주세요!');
			<%
		}else if(msg.equals("idpw")){
			%>
			alert('아이디 혹은 비밀번호가 다릅니다. 확인해주세요!');
			<%
		}
	}
	%>
	location.href="index";
	</script>
</body>
</html>
