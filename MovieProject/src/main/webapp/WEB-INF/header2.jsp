

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header2 시작 -->
<!--  hm | </head> 부터 </header>까지 -->
</head>


<body>
	<!--preloading-->
	<div id="preloader">
		<img class="logo" src="resources/images/logo1.png" alt="" width="119"
			height="58">
		<div id="status">
			<span></span> <span></span>
		</div>
	</div>
	<!--end of preloading-->

	<!-- ======================================================                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ================================================================== -->
	<!--                                               hm |        모달 팝업 시작                                                  -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!--                                            hm |         로그인 팝업 시작                                                  -->
	<!-- 입력 폼 패턴 삭제 -->
	<div class="login-wrapper" id="login-content">
		<div class="login-content">
			<a href="#" class="close">x</a>
			<h3>Login</h3>
			<form method="post" action="login.php">
				<!-- action 변경 필요 -->
				<div class="row">
					<label for="email"> <input type="text" name="email"
						id="email" placeholder="이메일" required="required"
						autocapitalize="off" />
					</label>
				</div>

				<div class="row">
					<label for="password"> <input type="password"
						name="password" id="password" placeholder="비밀번호"
						required="required" />
					</label>
				</div>
				<div class="row">
					<div class="remember">
						<div>
							<input type="checkbox" name="remember" value="Remember me"><span>아이디
								저장</span>
						</div>
					</div>
				</div>
				<div class="row hm_logtext">
					<button type="submit">Login</button>
					<a class="btn signupLink" href="#">회원가입 | </a> <a
						class="btn idfindLink" href="">아이디 찾기 | </a> <a
						class="btn pwfindLink" href="">비밀번호 찾기</a>
				</div>
			</form>

		</div>
	</div>
	<!--    hm |                                                         로그인 폼 팝업 끝                                                 -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!-- |   hm |                                                      아이디 찾기 팝업 시작                                              | -->
	<div class="login-wrapper" id="id-find-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h3>아이디 찾기</h3>
			<h6>등록된 휴대폰 번호로 찾기</h6>
			<p>가입 당시 입력한 휴대전화 번호를 통해 아이디를 찾을 수 있습니다.</p>
			<form method="post" action="id_find.php">
				<!-- login.php 액션 변경 -->

				<div class="row">
					<label for="username"> <!-- username 라벨 이름 변경 --> 이름 <!-- 라벨 추가 -->
						<input type="text" name="username" id="username" placeholder="이름"
						required="required" autocapitalize="off" /> <!-- name, id, placeholder 변경-->
					</label>
				</div>

				<div class="row phone">
					<label for="phone"> <!-- password 라벨 이름 변경 --> 휴대전화</br> <!-- 라벨 추가 -->
						<input type="text" name="phone-1" placeholder="010"
						Srequired="required" /> - <input type="text" name="phone-2"
						placeholder="" Srequired="required" /> - <input type="text"
						name="phone-3" placeholder="" Srequired="required" /> <!-- name, id, placeholder 변경-->
					</label>
				</div>

				<div class="row" id="hm_logtext">
					<!-- <button type="submit">확인</button>  버튼 이름 변경 -->
					<button class="idokLink" type="submit">확인</button>
					<a class="btn pwfindLink" href="">비밀번호 찾기</a>
					<!-- 하단 링크 변경 -->
				</div>
			</form>

		</div>
	</div>
	<!-- |        hm |                                                  아이디 찾기 팝업 끝                                              |  -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!-- |        hm |                                            아이디 찾기 확인 팝업 시작                                              | -->
	<div class="login-wrapper" id="id-ok-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content" style="text-align: center">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h6>입력하신 정보와 일치하는 아이디는</h6>
			<h6>아래와 같습니다.</h6>
			<!-- 이메일 정보 추가 -->
			<p>bit0***@gmail.com</p>
			<div class="row">
				<button class="close" type="submit" style="display: inline-block;">확인</button>
			</div>
		</div>
	</div>
	<!-- |           hm |                                          아이디 찾기 확인 팝업 끝                                              |  -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!-- |          hm |                                        비밀번호 찾기 폼 팝업 시작                                              | -->
	<div class="login-wrapper" id="pw-find-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h3>비밀번호 찾기</h3>
			<h6>등록된 휴대폰 번호로 찾기</h6>
			<p>가입 당시 입력한 휴대전화 번호를 통해 인증 후 새비밀번호를 등록해주세요.</p>
			<form method="post" action="pw_find.php">
				<!-- login.php 액션 변경 -->
				<div class="row">
					<label for="email"> <!-- username 라벨 이름 변경 --> 이메일 <!-- 라벨 추가 -->
						<input type="text" name="email" id="email" placeholder="이메일"
						required="required" autocapitalize="off" /> <!-- name, id, placeholder 변경-->
					</label>
				</div>

				<div class="row">
					<label for="username"> <!-- username 라벨 이름 변경 --> 이름 <!-- 라벨 추가 -->
						<input type="text" name="username" id="username" placeholder="이름"
						required="required" autocapitalize="off" /> <!-- name, id, placeholder 변경-->
					</label>
				</div>

				<div class="row phone">
					<label for="phone"> <!-- password 라벨 이름 변경 --> 휴대전화</br> <!-- 라벨 추가 -->
						<input type="text" name="phone-1" placeholder="010"
						Srequired="required" /> - <input type="text" name="phone-2"
						placeholder="" Srequired="required" /> - <input type="text"
						name="phone-3" placeholder="" Srequired="required" /> <!-- name, id, placeholder 변경-->
					</label>
				</div>

				<div class="row" id="hm_logtext">
					<!-- <button type="submit">확인</button>  버튼 이름 변경 -->
					<button class="pwokLink" type="submit">확인</button>
					<a class="btn idfindLink" href="">아이디 찾기</a>
					<!-- 하단 링크 변경 -->
				</div>
			</form>

		</div>
	</div>
	<!-- |      hm |                                            비밀번호 찾기 폼 팝업 끝                                               |  -->
	<!-- ======================================================================================================================== -->




	<!-- ======================================================================================================================== -->
	<!-- |       hm |                                           비밀번호 찾기 확인 팝업 시작                                              | -->
	<div class="login-wrapper" id="pw-ok-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h3>비밀번호 찾기</h3>
			<p>회원님의 계정 비밀번호를 재설정 해주세요.</p>
			<p>신규비밀번호는 8-20자 이내의 영문자, 숫자의 조합으로 작성 하셔야 합니다.</p>

			<div class="row">
				<label for="password"> <!-- username 라벨 이름 변경 --> 신규 비밀번호 입력
					</br> <!-- 라벨 추가 --> <input type="password" name="password"
					id="password" placeholder="" required="required"
					autocapitalize="off" /> <!-- name, id, placeholder 변경-->
				</label>
			</div>

			<div class="row">
				<label for="password2"> <!-- username 라벨 이름 변경 --> 비밀번호 확인 </br>
					<!-- 라벨 추가 --> <input type="password" name="password2"
					id="password2" placeholder="" required="required"
					autocapitalize="off" /> <!-- name, id, placeholder 변경-->
				</label>
			</div>
			<div class="row">
				<button class="" type="submit">비밀번호 변경</button>
			</div>
		</div>
	</div>
	<!-- |     hm |                                             비밀번호 찾기 확인 팝업 끝                                               |  -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!--         hm |                                                   회원가입 폼 팝업 시작                                              -->
	<!--signup form popup-->
	<div class="login-wrapper" id="signup-content">
		<div class="login-content">
			<a href="#" class="close">x</a>
			<h3>sign up</h3>
			<form method="post" action="signup.php">

				<div class="row">
					<label for="email-2"> 이메일 :</br> <input type="text" name="email"
						id="email-2" placeholder="이메일을 입력하세요" required="required" />
						<button id="overch">중복확인</button>
					</label>
				</div>

				<div class="row">
					<label for="username-2"> 이름 : <input type="text"
						name="username" id="username-2" placeholder="이름을 입력하세요"
						required="required" />
					</label>
				</div>

				<div class="row">
					<label for="nickname-2"> 닉네임 :</br> <input type="text"
						name="nickname" id="nickname-2" placeholder="닉네임을 입력하세요"
						required="required" />
						<button id="overch">중복확인</button>
					</label>
				</div>

				<div class="row">
					<label for="password-2"> 비밀번호: <input type="password"
						name="password" id="password-2" placeholder="8-20자 이내 영문자, 숫자의 조합"
						required="required" />
					</label>
				</div>
				<div class="row">
					<label for="repassword-2"> 비밀번호 확인 : <input type="password"
						name="password" id="repassword-2"
						placeholder="8-20자 이내 영문자, 숫자의 조합" Srequired="required" />
					</label>
				</div>

				<div class="row phone">
					<label for="repassword-2"> 휴대전화 : </br> <input type="text"
						name="phone-1" placeholder="" Srequired="required" /> - <input
						type="text" name="phone-2" placeholder="" Srequired="required" />
						- <input type="text" name="phone-3" placeholder=""
						Srequired="required" />
					</label>
				</div>

				<div class="row">
					<label for="genre-2"> 선호장르 : </br> <label
						class="fancy-radio custom-color-coral"> <input
							name="gender4" value="공포/호러" type="radio" checked><span><i></i>공포/호러</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="멜로/로맨스" type="radio"><span><i></i>멜로/로맨스
						</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="액션" type="radio"><span><i></i>액션</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="코미디" type="radio"><span><i></i>코미디</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="범죄" type="radio"><span><i></i>범죄</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="스릴러" type="radio"><span><i></i>스릴러</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="느와르" type="radio"><span><i></i>느와르</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="가족" type="radio"><span><i></i>가족</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="애니메이션" type="radio"><span><i></i>애니메이션</span>
					</label> <label class="fancy-radio custom-color-coral"> <input
							name="gender4" value="코미디" type="radio"><span><i></i>코미디</span>
					</label>
					</label>
				</div>

				<div class="row">

					<label for="terms-2"> 약관동의 : </br> <label
						class="fancy-checkbox custom-bgcolor-coral"> <input
							type="checkbox" checked><span>[필수]이용약관</span>
					</label> <a class="termsLink">약관보기</a> <label
						class="fancy-checkbox custom-bgcolor-coral"> <input
							type="checkbox" checked><span>[필수]개인정보 수집 및 이용</span>
					</label> <a class="termsLink">약관보기</a> <label
						class="fancy-checkbox custom-bgcolor-coral"> <input
							type="checkbox" checked><span>이메일 수신 동의</span></label> <label
						class="fancy-checkbox custom-bgcolor-coral"> <input
							type="checkbox" checked><span>SMS 수신 동의</span></label>
					</label>
					<label class="fancy-checkbox custom-bgcolor-coral" id="checkall" st>
						<input type="checkbox" checked=""><span>전체동의</span>
					</label>
					<hr>
				</div>

				<div class="row">
					<button class="signupokLink" type="submit">가입하기</button>
				</div>
			</form>
		</div>
	</div>
	<!--end of signup form popup-->
	<!--        hm |                                                     회원가입 폼 팝업 끝                                               -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!-- |      hm |                                              회원가입 확인 팝업 시작                                                 | -->
	<!--signup OK popup-->
	<div class="login-wrapper" id="signup-ok-content" style="height: 50%;">
		<div class="login-content">
			<a href="#" class="close">x</a>
			<h3>sign up</h3>

			<h4>회원가입이 완료되었습니다.</h4>
			</br>
			<!-- 코드수정: id 넣어야 함-->
			<h6>회원님 회원가입을 축하합니다.</h6>
			</br>
			<p>블록버스터의 다양한 영화 정보를 확인하세요!</p>

			<div class="row">
				<button class="close" type="submit" id="hm_button2">홈으로</button>
				<button class="loginLink" type="submit" id="hm_button2">로그인</button>

			</div>
		</div>
	</div>
	<!--end of signup OK popup-->
	<!-- |          hm |                                           회원가입 확인 팝업 끝                                                 |  -->
	<!-- ======================================================================================================================== -->




	<!-- ======================================================================================================================== -->
	<!-- |          hm |                                          아이디 중복확인 팝업 시작                                               | -->
	<div class="login-wrapper" id="id-check-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h3>아이디 중복 확인</h3>

			<div class="row">
				<label for="email"> <!-- username 라벨 이름 변경 --> 사용할 이메일 입력 <!-- 라벨 추가 -->
					<input type="text" name="email" id="email" placeholder=""
					required="required" autocapitalize="off" /> <!-- name, id, placeholder 변경-->
				</label>
			</div>

			<div class="row">
				<button class="" type="submit">확인</button>
				<!-- 한칸만 끄기.. -->
			</div>
		</div>
	</div>
	<!-- |           hm |                                          아이디 중복확인 팝업 끝                                               |  -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!-- |            hm |                                        닉네임 중복확인 팝업 시작                                               | -->
	<div class="login-wrapper" id="nik-check-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h3>닉네임 중복 확인</h3>

			<div class="row">
				<label for="nickname"> <!-- username 라벨 이름 변경 --> 사용할 닉네임 입력
					<!-- 라벨 추가 --> <input type="text" name="nickname" id="nickname"
					placeholder="" required="required" autocapitalize="off" /> <!-- name, id, placeholder 변경-->
				</label>
			</div>

			<div class="row">
				<button class="" type="submit">확인</button>
				<!-- 한칸만 끄기 -->
			</div>
		</div>
	</div>
	<!-- |      hm |                                               닉네임 중복확인 팝업 끝                                               |  -->
	<!-- ======================================================================================================================== -->

	<!-- ======================================================================================================================== -->
	<!-- |            hm |                                        약관 팝업 시작                                               | -->
	<div class="login-wrapper2" id="terms-content">
		<!-- login-content 아이디 변경 -->
		<div class="login-content2">
			<!-- login-content 클래스 변경 X -->
			<a href="#" class="close">x</a>
			<h3>약관</h3>
			<div class="hm_contents">
				<h3>제 1장 총칙</h3>
				<h4>제 1 조 (목적)</h4>
				<p>본 약관은 통계청(이하 ‘제공기관’이라 한다)에서 제공하는 BBB(Block Buster Bit)를 활용함에
					있어 준수하여야 하는 활용조건 및 절차, 활용자의 권리・의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
				<h4>제2조(용어의 정의) 이 약관에서 사용하는 용어의 뜻은 다음과 같습니다.</h4>
				<ul>
					<li>“공공정보”란, 「국가정보화기본법」 제3조 제1호에 따른 정보로서 「국가정보화기본법」제3조, 제10호에
						따른 공공기관이 보유・관리하는 정보를 말합니다.</li>
					<li>“제공기관”이란, 본 약관에 따라 정보를 제공하는 기관을 말합니다.</li>
					<li>“통계정보”란, BBB에서 제공하는 콘텐츠 중 승인통계와 관련된 통계DB 및 통계DB 내용을 보여주는
						통계표와 통계표 파일 및 온라인간행물에 대해서만 해당됩니다.</li>
				</ul>
				<h4>제3조(효력)</h4>
				<ul>
					<li>활용자가 본 약관을 읽고 동의하는 의사표시를 하는 경우 본 약관에 동의한 것으로 간주하며, 정보의 제공
						및 활용에 관하여 본 약관의 적용을 받게 됩니다.</li>
					<li>제공기관은 관련 법령 등을 위배하지 않는 범위에서 약관을 개정할 수 있습니다.</li>
					<li>제2항에 따른 약관의 변경은 활용자가 동의함으로써 그 효력이 발생됩니다. 다만, 제2항에 따른 통지를
						하면서 활용자에게 일정한 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확히 전달하였음에도
						활용자가 명시적으로 거부의 의사표시를 하지 아니한 경우에는 활용자가 개정약관에 동의한 것으로 봅니다.</li>
					<li>활용자는 정보 및 OpenAPI 연결, 다운로드, 웹 파싱 서비스를 활용할 시 주기적으로 제공기관의
						공지사항을 확인하여야 하며, 제공기관에서 요구하는 사항에 대한 보고의 의무가 있습니다.</li>
					<li>약관의 변경 사실 및 내역을 확인하지 못하여 발생한 모든 손해에 대한 책임은 활용자에게 귀속됩니다.</li>
				</ul>
				<h3>제 2 장 활용조건</h3>
				<h4>제4조(권장사양)</h4>
				<p>정보제공서비스 활용가능기기 및 활용에 필요한 최소한의 기술사양은 제공기관에서 제시하는 권장사양정보에 따르며,
					활용자의 기술사양 등이 이에 미치지 못하는 경우 제공기관은 정보를 제공하지 않을 수 있습니다.</p>
				<h4>제5조(금지사항)</h4>
				<p style="margin-bottom: 5px;">활용자는 다음 각 호의 행위를 하지 않아야 합니다.</p>
				<ul>
					<li>속임에 의한 활용자 사칭</li>
					<li>전자적 접근 등으로 인한 바이러스・웜 등의 악성코드 등의 전파</li>
					<li>저작권 위반 및 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제44조 7의 불법정보 등과 결합
						또는 연계 이용하는 행위</li>
					<li>제공받은 정보를 특정한 서비스 플랫폼 없이 그대로 제3자에게 유료로 제공・공유하는 행위</li>
					<li>활용자가 제공기관과 같은 공적 지위가 있는 것처럼 외관을 형성하거나, 본 약관의 동의가 없었음에도
						불구하고 제공기관이 정보의 활용을 승인한 것으로 보이게 하는 방법으로 활용하는 행위</li>
					<li>OpenAPI 연결방식의 위・변조 금지</li>
					<li>OpenAPI 접속 인증키(key)의 무단 양도, 증여 및 담보 목적물로 사용하는 행위</li>
					<li>접근이 허용된 범위 외에 권한 없이 접근을 시도하는 행위</li>
				</ul>

				<h4>제6조(활용제한)</h4>
				<p style="margin-bottom: 5px;">다음 각 호의 경우 제공기관은 정보의 일부 또는 전부를
					제공하지 않을 수 있습니다.</p>
				<ul>
					<li>국제통계 등 라이선스 제약을 받는 경우</li>
					<li>제공기관이 수용 가능한 트래픽을 초과하는 정보 활용의 경우</li>
					<li>그 밖의 정상적인 업무수행에 현저한 지장을 초래하는 수준의 기술적 혹은 재정적 노력이 필요한 정보 활용의
						경우</li>
					<li>제공기관에서 기술적으로 제공하는 OpenAPI 서비스 외의 다른 형태의 OpenAPI 연결을 요청하는
						경우</li>
				</ul>
				<h4>제7조(이용지침 준수 및 출처표시 의무)</h4>
				<ul>
					<li>활용자는 정보를 활용함에 있어 통계정보 이용지침을 준수하고 제공기관에서 제공된 정보임을 표시하는 출처표시
						의무를 가집니다.</li>
					<li>제공기관은 활용자가 제1항의 출처표시 의무 및 이용지침을 위반하는 경우 정보 제공을 중단하고 활용관계를
						해지할 수 있습니다.</li>
				</ul>
				<h4>제8조(통계정보의 상업적 활용)</h4>
				<ul>
					<li>활용자는 통계정보를 상업적인 목적으로 활용할 수 있습니다. 다만, 예외사항으로 규정하는 경우에는 해당되지
						않습니다.</li>
					<li>예외사항은 변경될 수 있으며, 그 내역은 사이트를 통해 공지됩니다.</li>
				</ul>

				<h3>제3장 활용절차 및 방법</h3>

				<h4>제9조(제공방법)</h4>
				<ul>
					<li>제공기관은 제공기관에서 서비스하는 방식으로 정보를 제공할 수 있습니다.</li>
					<li>제공기관은 계속적이고 안정적인 공공정보 서비스 제공을 위하여, 설비에 장애가 생기거나 관련 자료가 멸실된
						경우에는 부득이한 사유가 없는 한 지체 없이 이를 수리 또는 복구하여야 합니다.</li>
					<li>활용자는 데이터 플랫폼에 접근할 수 있도록 정한 프로토콜, 요청 및 출력 수단을 사용하여 자유롭게 본인이
						만든 웹 서비스에 연동하거나 독립 프로그램을 개발하여 배포 할 수 있습니다.</li>
					<li>활용자는 제공기관의 공공정보 서비스를 활용하여 영업활동을 하는 경우 그 영업활동의 결과에 대해 제공기관은
						책임을 지지 않습니다. 또한 활용자는 이와 같은 영업활동으로 제공기관이 손해를 입은 경우 제공기관에 대해 손해배상의무를
						지며, 제공기관은 활용자에 대해 서비스 활용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다.</li>
					<li>정보의 제공 및 활용기간은 본 약관이 효력을 발휘하는 날로부터 1년으로 하며, 그 종료시점 30일 전에
						제공기관이나 활용자의 특별한 의사표시가 없는 한 1년 더 갱신되는 것으로 합니다.</li>
					<li>제공기관은 OpenAPI 연결의 방식으로 다음 각 호의 내용에 따라 정보를 제공할 수 있습니다.
						<ol>
							<li>OpenAPI 서비스의 이용은 제공기관의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일
								24시간 운영을 원칙으로 합니다. 다만, 제12조제2항부터 제4항의 내용에 따라 일시 중단될 수 있습니다.</li>
							<li>제공기관은 활용자에게 OpenAPI 서비스를 사용할 수 있는 인증키와 사용권을 부여하며, 활용자는
								해당 인증키를 선량한 관리자의 주의 의무를 다하여 관리하여야 합니다.</li>
							<li>제공기관은 OpenAPI 서비스를 특정 범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수
								있습니다. 다만, 이 경우 그 내용을 사전 공지하도록 합니다.</li>
						</ol>
					</li>
				</ul>
				<h4>제10조(비용)</h4>
				<p style="margin-bottom: 5px;">정보는 무상으로 제공하는 것을 원칙으로 합니다. 단,
					제공기관에서 서비스하는 방법이 아닌 다른 방법으로 정보를 제공하여 줄 것을 요청한 경우에는 필요한 비용을 청구할 수
					있으며, 비용을 산정하는 방법은 다음 각 호의 하나에 해당하는 경우에 따라 산정합니다.</p>
				<ul>
					<li>정보제공에 대한 제공기관의 산정 기준이 존재할 경우, 해당 기준에 따릅니다.</li>
					<li>기타 제공기관과 활용자간의 별도 협의에 따릅니다.</li>
				</ul>
				<h4>제11조(활용변경 및 해지)</h4>
				<ul>
					<li>활용자는 정보의 활용수단 및 활용양 등의 변경사항이 있는 경우 제공기관에 활용변경을 요청할 수 있으며,
						제공기관은 위법・부당한 활용변경이 아닌 경우 이에 응하여야 합니다.</li>
					<li>활용자는 주소, 연락처, 전자우편 주소 등 활용계약사항이 변경된 경우에 해당 절차를 거쳐 이를 제공기관에
						즉시 통보하여야 합니다. 활용자가 본 항의 개인정보 등을 적절히 변경하지 아니하여 발생하는 활용자의 손해 또는 손실 등
						불이익에 대하여는 활용자가 책임을 부담합니다.</li>
					<li>더 이상 정보의 활용이 필요 없는 활용자의 경우 해지의 의사표시로 본 약관에 의한 정보의 활용관계를
						해지할 수 있습니다.</li>
					<li>제공기관은 관련 법령 내용 및 활용자의 약관 및 준수사항 위반에 따라 활용관계를 해지할 수 있습니다.</li>
				</ul>
				<h4>제12조(제공중단)</h4>
				<ul>
					<li>제3조의 금지행위가 발생하는 등 활용자가 본 약관의 내용을 위반하는 경우 제공기관은 정보 제공을 중단할
						수 있으며, 적법한 조치를 포함한 필요 조치를 취할 수 있습니다.</li>
					<li>제공기관은 다음 각 호에 해당하는 경우 사전 공지 후 정보의 제공을 일시적으로 중단 할 수 있습니다.
						<ol>
							<li>시스템 정기점검, 증설 및 교체의 경우</li>
							<li>서비스를 제공함에 있어 기술적 결함이 발견되는 경우</li>
							<li>신규 서비스를 추가하는 경우</li>
							<li>제공기관과 협의한 서비스 기준을 초과한 호출을 요청한 경우</li>
						</ol>
					</li>
					<li>제2항에도 불구하고 제공기관은 긴급한 시스템 점검, 증설 및 교체 등 부득이한 사유로 인하여 예고 없이
						일시적으로 OpenAPI 연결, 다운로드, 웹 파싱 서비스를 중단할 수 있으며, 새로운 OpenAPI 연결, 다운로드,
						웹 파싱 서비스로의 교체 등 제공기관이 적절하다고 판단하는 사유에 의하여(예: 기능 개선 및 보안 등) 현재 제공되는
						공공정보 서비스를 완전히 중단할 수 있습니다.</li>
					<li>제공기관이 통제할 수 없는 사유로 인한 공공정보 서비스 중단의 경우(천재지변 등의 불가항력 상황,
						시스템관리자의 고의・과실 없는 장애, 시스템다운 등)에 사전통지가 불가능하며, 타인(인터넷통신사업자 등)의 고의・과실로
						인한 시스템중단 등의 경우에는 통지하지 못할 수 있습니다.</li>
				</ul>
				<h3>제4장 기타</h3>
				<h4>제13조(면책)</h4>
				<ul>
					<li>제공기관은 활용자가 본 약관의 내용을 준수하지 않아 발생한 손해에 대하여 책임지지 않습니다.</li>
					<li>정보는 현재 상태 그대로 활용할 수 있도록 제공되며, 제공기관은 정보에 포함된 오류, 누락 등 정보의
						품질 또는 정보의 활용으로 인한 손해・손실에 대한 책임을 부담하지 않습니다.</li>
					<li>제공기관은 관련 법령에서 정하는 사항 외에 정보와 관련된 진술, 보증, 의무, 책임을 부담하지 않습니다.</li>
					<li>제공기관은 공공정보의 계속적 제공 또는 추가되는 공공정보의 지속적 제공을 보장하지 않습니다.</li>
					<li>정보는 이용자에게 통보 없이 추가, 변경, 개선, 업데이트될 수 있습니다.</li>
					<li>제공기관은 서비스 장애 등으로 발생한 활용자의 손해에 대해 책임을 지지 않습니다.</li>
					<li>제공기관은 활용자와 제3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없으며, 이로
						인한 손해를 배상할 책임도 없습니다. 만일 활용자와 분쟁 중인 제3자가 제공기관을 상대로 이의를 제기할 경우 활용자는
						제공기관을 자신의 비용과 책임으로 면책시켜야 합니다.</li>
				</ul>
				<h4>제14조(개인정보의 수집 등 관리)</h4>
				<ul>
					<li>제공기관은 정보의 원활한 제공 및 활용을 위하여 다음 각 호의 개인정보를 수집 할 수 있습니다.
						<ol>
							<li>성명(법인인 경우 법인명, 대표자명, 담당자명)</li>
							<li>전자우편 주소(법인의 경우 대표자와 담당자의 전자우편 주소)</li>
							<li>연락처(개인 휴대전화번호가 없을 경우 연락받을 수 있는 연락처, 법인의 경우 대표자와 담당자 연락처)</li>
						</ol>
					</li>
					<li>활용자가 제공한 모든 정보는 다음 각 호의 목적에 필요한 용도 이외로는 사용되지 않으며, 이용 목적이
						변경될 시에는 사전 동의를 구하여야 합니다.
						<ol>
							<li>계약 이행, 정보 제공 및 OpenAPI 연결, 다운로드, 웹 파싱 허용에 따른 비용정산</li>
							<li>제공기관 및 기타 관련 기관의 정보이용과 관련한 홍보 및 안내</li>
						</ol>
					</li>
					<li>제공기관은 활용자가 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 활용목적이 달성되거나
						보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기하여야 합니다. 다만, 활용계약관계가 종료하거나 목적이
						달성된 이후라도 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라 일정 기간 저장・보관된 후 파기할 수
						있습니다.</li>
				</ul>
				<h4>제15조(규정의 준용)</h4>
				<p>본 약관에 명시되지 않은 사항에 대해서는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「공공기관의
					정보공개에 관한 법률, 저작권법」, 「콘텐츠산업진흥법」 등 관련법령 및 「공공정보 제공지침」에 의합니다.</p>
				<h4>제16조(관할)</h4>
				<p>정보의 활용과 관련하여 제공기관과 활용자 간에 발생한 분쟁에 대해서는 대전지방법원을 전속관할로 합니다.</p>
				<h4>부 칙</h4>
				<p>
					<strong>[시행일]</strong> 본 활용약관은 2013년 9월 3일부터 적용토록 합니다. <br>
					개정된 활용약관의 적용일자 이전 활용자 또한 개정된 활용약관의 적용을 받습니다.
				</p>
			</div>

			<div class="row">
				<!-- <button onclick="this.parentNode.parentsNode.style.display = 'none';">확인</button>-->
				<button class="terms-content-bt">닫기</button>

			</div>
		</div>
	</div>
	<!-- |      hm |                                               약관 팝업 끝                                               |  -->
	<!-- ======================================================================================================================== -->



	<!-- ======================================================================================================================== -->
	<!-- ======================================================================================================================== -->
	<!-- ======================================================================================================================== -->
	<!--        hm |                                                       모달 팝업 끝                                                    -->
	<!-- ======================================================================================================================== -->

	<!-- BEGIN | Header -->
	<header class="ht-header sticky">
		<div class="container">
			<nav class="navbar navbar-default navbar-custom">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header logo">
					<div class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
						<div id="nav-icon1">
							<span></span> <span></span> <span></span>
						</div>
					</div>
					<a href="index.do"><img class="logo"
						src="resources/images/logo1.png" alt="" width="119" height="58"></a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse flex-parent"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav flex-child-menu menu-left">
						<li class="hidden"><a href="#page-top"></a></li>
						<!--  hm |   add : 각 항목의 텍스트 변경-->
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1"
							href="movieTicketing.do"> 예매 </a></li>
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1" href="movieList.do">
								영화 </a></li>

						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1" href="cinemaList.do">
								영화관 </a></li>
								
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1"
							data-toggle="dropdown" data-hover="dropdown"> 이벤트 & 정보<i
								class="fa fa-angle-down" aria-hidden="true"></i>
						</a>
							<ul class="dropdown-menu level1">
								<li><a href="">지난 이벤트</a></li> <!-- hm | 지난이벤트 , 당첨자 확인 링크 필요 -->
								<li class="it-last"><a href="">당첨자 확인</a></li>
							</ul></li>
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1"
							data-toggle="dropdown" data-hover="dropdown"> 커뮤니티<i
								class="fa fa-angle-down" aria-hidden="true"></i>
						</a>
							<ul class="dropdown-menu level1">
								<li><a href="boardFreeList.do">자유 게시판</a></li>
								<li class="it-last"><a href="boardShreList.do">나눔 게시판</a></li>
							</ul></li>
					</ul>
					<ul class="nav navbar-nav flex-child-menu menu-right">
						<li class="dropdown first"><a
							class="btn btn-default dropdown-toggle lv1" href="mmlList.do">
								나영리 </a></li>
						<li><a href="mypage.do">마이페이지</a></li>
						<li class="loginLink"><a href="#">로그인</a></li>
						<li class="btn signupLink"><a href="#">회원가입</a></li>
					</ul>

				</div>
				<!-- 검색 모달 -->
				<form id="demo-2">
					<input type="search" placeholder="Search">
				</form>
			</nav>

		</div>
	</header>
	<!-- END | Header -->
	<script src="<c:url value="/resources/js/jquery.js" />"></script>
<script src="<c:url value="/resources/js/plugins.js" />"></script>
<script src="<c:url value="/resources/js/plugins2.js" />"></script>
	
<!-- header2 끝 -->
