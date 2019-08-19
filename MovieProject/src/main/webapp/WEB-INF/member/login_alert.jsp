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
	String rlink = (String)request.getAttribute("rlink");
	if(msg!=null){
		if(msg.equals("login_delete")){
			%>
			alert('탈퇴한 회원입니다. \n문의사항이 있을 경우 관리자에게 문의해주세요. ');
			<%
		}else if(msg.equals("login_cert")){
			%>
			alert('메일인증을 진행해주세요. \n인증이 안될경우 관리자에게 문의해주세요.');
			<%
		}else if(msg.equals("login_pw")){
			%>
			alert('비밀번호가 다릅니다. 확인해주세요!');
			<%
		}else if(msg.equals("login_idpw")){
			%>
			alert('아이디 혹은 비밀번호가 다릅니다. 확인해주세요!');
			<%
		}else if(msg.equals("join_success")){
			%>
			alert('회원가입이 완료되었습니다.\n가입한 메일로 인증메일이 발송됩니다.\n메일함을 확인해주세요.\n10분내에 메일을 받지못했을 경우 관리자에게 문의해주세요.');
			<%
		}else if(msg.equals("join_fail")){
			%>
			alert('회원가입에 실패했습니다. 관리자에게 문의해주세요.');
			<%
		}
	}
	%>
	location.href='<%=rlink%>';
	</script>
</body>
</html>
