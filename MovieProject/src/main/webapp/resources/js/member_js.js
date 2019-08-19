//회원가입 제출양식의 유효성 확인 
function check(){
	var joinform = document.getElementById("joinform");
	var m_email = joinform.m_email.value;		//이메일 input
	var m_name = joinform.m_name.value;	//이름 input
	var m_nickname = joinform.m_nickname.value;	//닉네임 input
	var m_password = joinform.m_password.value;	//비밀번호 input
	var repassword = joinform.repassword.value;	//비밀번호 확인 input
	var phone = joinform.m_phone.value;	//전화번호 전체값을 저장할 input
	var favorite = joinform.m_favorite.value;	//선호장르 checkbox
	
	var m_eagree = joinform.m_eagree.value;	//m_eagree 체크박스 
	var m_sagree = joinform.m_sagree.value;	//m_agree 체크박스
	
	var email_btn = joinform.email_btn.value;	//이메일 중복확인 버튼의 value, 0일경우 non-check, 1일경우 check	
	var nickname_btn = joinform.nickname_btn.value;	//닉네임 중복확인 버튼의 value, 0일경우 non-check, 1일경우 check
	
	//이메일 중복확인 버튼을 눌렀는지 체크
	if(email_btn == 0){
		alert('이메일 중복확인 버튼을 눌러주세요.');
		return false;
	}
	//이름 입력 유무 체크
	if(m_name == ""){
		alert('이름을 입력해주세요.');
		return false;
	}
	
	//닉네임 중복확인 버튼을 눌렀는지 체크
	if(nickname_btn == 0){
		alert('닉네임 중복확인 버튼을 눌러주세요.');
		return false;
	}
	
	//비밀번호와 비밀번호 확인 입력값이 일치하지 않을경우
	var pass_rule = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,50}).{8,20}$/;
	if((pass_rule).test(m_password) == false || joinform.pass_chk.value == 0){
		alert('비밀번호를 확인해주세요.');
		return false;
	}
	
	//전화번호 입력 유무 체크
	if(joinform.phone1.value==""||joinform.phone2.value==""||joinform.phone3.value=="" ){	//세개의 phone input 중 하나라도 빈칸일 경우
		alert('전화번호를 입력해주세요.');
		return false;
	}else{
		m_phone.setAttribute("value",joinform.phone1.value+'-'+joinform.phone2.value+'-'+joinform.phone3.value );
	}
	
	//이용약관 체크여부
	if(joinform.usage_agree.checked == false){
		alert('[필수]이용약관을 확인해주세요.');
		return false;
	}
	
	//개인정보 수집 및 이용 체크여부
	if(joinform.info_agree.checked == false){
		alert('[필수]개인정보 수집 및 이용을 확인해주세요.');
		return false;
	}
	
	//이메일 수신동의 체크
	if(joinform.m_eagree_chk.checked == true){
		$('#m_eagree').attr('value','Y');
	}else{
		$('#m_eagree').attr('value','N');
	}
	
	//sms 수신동의 체크
	if(joinform.m_sagree_chk.checked == true){
		$('#m_sagree').attr('value','Y');
	}else{
		$('#m_sagree').attr('value','N');
	}
	
	//모든 항목을 통과했을 경우
	return true;
}

//input의 최대 글자수 제한(number일경우, maxlength 동작x)
function numberMaxLength(e){
    if(e.value.length > e.maxLength){
        e.value = e.value.slice(0, e.maxLength);
    }
}

//이메일 input의 값이 변경될 경우 
$('.join #m_email').on('change keyup paste input', function() {
	var email_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var formtype = document.getElementById("formtype").value;
	var form = document.getElementById(formtype);
	var m_email = form.m_email.value;
	
	if(email_rule .test(m_email) == false){
		$('#email_msg1').html('ㄴ이메일 양식에 맞게 입력해주세요.').css('color', 'black');
		$('#email_msg1').css('display', '');
	}else{
		$('#email_msg1').css('display', 'none');
	}
	
	$('#email_btn').attr('value',0);
	$('#email_msg2').html('ㄴ이메일 중복확인 버튼을 눌러주세요.').css('color', 'black');
});
//이메일 중복체크
$('#email_btn').on('click', function (event) {
	var formtype = document.getElementById("formtype").value;
	var form = document.getElementById(formtype);
	var m_email = form.m_email.value;
	$.ajax({
		url: "/movie/email_overlap_chk",
		data: { 'm_email': m_email },
		dataType: 'text',
		type: 'get',
		contentType: 'application/text; charset=UTF-8',
		success: function (data) {
			if (data == "success") {
				$('#email_btn').attr('value',1);
				$('#email_msg2').html('ㄴ사용 가능한 이메일 주소입니다.').css('color', 'blue');
			} else if (data == "fail") {
				$('#email_btn').attr('value',0);
				$('#email_msg2').html('ㄴ이미 사용중인 이메일 입니다').css('color', 'red');
			}
		},
		error: function (xhr, status, e) {
			alert("에러!" + status);
		}
	});
});

//닉네임 input의 값이 변경될 경우 
$('.join #m_nickname').on('change keyup paste input', function() {
	$('#nickname_btn').attr('value',0);
	$('#nickname_msg').html('ㄴ닉네임 중복확인 버튼을 눌러주세요.').css('color', 'black');
});
//닉네임 중복체크
$('#nickname_btn').on('click', function (event) {
	var joinform = document.getElementById("joinform");
	var m_nickname = joinform.m_nickname.value;
	$.ajax({
		url: "/movie/nick_overlap_chk",
		data: { 'm_nickname': m_nickname },
		dataType: 'text',
		type: 'get',
		contentType: 'application/text; charset=UTF-8',
		success: function (data) {
			if (data == "success") {
				$('#nickname_btn').attr('value',1);
				$('#nickname_msg').html('ㄴ사용 가능한 닉네임 입니다.').css('color', 'blue');
			} else if (data == "fail") {
				$('#nickname_btn').attr('value',0);
				$('#nickname_msg').html('ㄴ이미사용중인 닉네임 입니다').css('color', 'red');
			}
		},
		error: function (xhr, status, e) {
			alert("에러!" + status);
		}
	});
});

//비밀번호 체크
$('.join #m_password').on('change keyup paste input', function() {
	var password_rule = /(?=.*\d{1,20})(?=.*[~`!@#$%\^&*()-+=]{1,20})(?=.*[a-zA-Z]{1,50}).{8,20}$/;
	var formtype = document.getElementById("formtype").value;
	var form = document.getElementById(formtype);
	var m_password = form.m_password.value;
	
	$('#pass_chk_f').css('display', '');
	$('#pass_chk_t').css('display', 'none');
	$('#pass_chk').attr('value',0);
	
	if(password_rule .test(m_password) == false){
		$('#password_msg').html('ㄴ8-20자 이내 영문자, 숫자의 조합으로 입력해주세요.').css('color', 'red');
	}else{
		$('#password_msg').html('');
	}
});
//비밀번호 확인 체크
$('.join #repassword').on('change keyup paste input', function() {
	var formtype = document.getElementById("formtype").value;
	var form = document.getElementById(formtype);
	var m_password = form.m_password.value;
	var repassword = form.repassword.value;
	
	if(m_password != repassword){
		$('#pass_chk_f').css('display', '');
		$('#pass_chk_f').css('color', 'red');
		$('#pass_chk_t').css('display', 'none');
		$('#pass_chk').attr('value',0);
	}else{
		$('#pass_chk_f').css('display', 'none');
		$('#pass_chk_t').css('display', '');
		$('#pass_chk').attr('value',1);
	}
});

//checkbox 전체동의 체크 
$('#chk_all').on('click', function () {
	$('.chk_box').prop('checked', this.checked);
});
//전체동의 상태에서 하나라도 해제하면 전체동의 해제
$('.chk_box').on('click', function () {
	var num = $('input:checkbox[class="chk_box"]:checked').length;
	if(num == 4){
		$('#chk_all').prop('checked', true);
	}else{
		$('#chk_all').prop('checked', false);
	}
});

//아이디 찾기
$('.search #search_email_btn').on('click', function () {
	var m_name = $('#search_m_name').val();
	var m_phone = $('#search_phone1').val()+'-'+$('#search_phone2').val()+'-'+$('#search_phone3').val();
	$.ajax({
		url: "/movie/id_find",
		data: { 'm_name':m_name, 'm_phone':m_phone },
		dataType: 'text',
		type: 'get',
		contentType: 'application/text; charset=UTF-8',
		success: function (data) {
			if (data == "fail") {
				$('#search_email_result').html('결과없음.<br>입력한 정보를 확인해주세요.');
				$('.search_content_input').css('display','none');
			} else{
				var email = data.split('@');	//@를 기준으로 분할
				var length = email[0].length;	//@앞 아이디의 길이
				var num = Math.round(length*0.3);	//@앞 아이디 글자수의 30% 값
				var result = email[0].substr(0,length-num);	
				for(var i=0; i<num;i++){
					result+='*';
				}
				result = result+'@'+email[1];
				$('#search_email_result').html(result);
			}
			$('.search_content_result').css('display','block');
		},
		error: function (xhr, status, e) {
			alert("에러!" + status);
			$('#search_email_result').html('결과 없음.<br>입력한 정보를 확인해주세요.');
			$('.search_content_result').css('display','block');
			$('.search_content_input').css('display','none');
		}
	});
});

//비밀번호 찾기
$('.search #search_pw_btn').on('click', function () {
	var m_email = $('#search_m_email').val();
	var m_name = $('#search_m_name').val();
	var m_phone = $('#search_phone1').val()+'-'+$('#search_phone2').val()+'-'+$('#search_phone3').val();
	if($('#search_m_email_chk').attr('value') == 1){
		$.ajax({
			url: "/movie/pw_find",
			data: { 'm_email':m_email, 'm_name':m_name, 'm_phone':m_phone },
			dataType: 'text',
			type: 'get',
			contentType: 'application/text; charset=UTF-8',
			success: function (data) {
				if (data == "success") {
					alert("입력한 아이디(이메일)로 임시 비밀번호 발송되었습니다. \n메일함을 확인해주세요.");
					location.href='index';
				} else{
					alert("결과가 없습니다.\n입력한 값을 다시 확인해주세요. " + status);
				}
			},
			error: function (xhr, status, e) {
				alert("입력한 값을 다시 확인해주세요." + status);
			}
		});
	}else{
		alert("입력한 값을 다시 확인해주세요.");
	}
});
//비밀번호 찾기 - 이메일 input의 값이 변경될 경우 
$('.search #search_m_email').on('change keyup paste input', function() {
	var email_rule = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var m_email = $('#search_m_email').val();
	
	if(email_rule .test(m_email) == false){
		$('#email_msg1').html('ㄴ이메일 양식에 맞게 입력해주세요.').css('color', 'black');
		$('#email_msg1').css('display', '');
		$('#email_msg1').css('color', 'red');
		$('#search_m_email_chk').attr('value', '0');
		
	}else{
		$('#email_msg1').css('display', 'none');
		$('#search_m_email_chk').attr('value', '1');
	}
});
