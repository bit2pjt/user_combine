//==js for login and sign up
var loginLink = $(".loginLink");
var signupLink = $(".signupLink");
var loginct = $("#login-content");
var signupct = $("#signup-content");
var loginWrap = $(".login-wrapper");

var overlay = $(".overlay");

loginWrap.each(function () {
	$(this).wrap('<div class="overlay"></div>')
});

//pop up for login form
loginLink.on('click', function (event) {
	event.preventDefault();
	loginct.parents(overlay).addClass("openform");
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(loginct).each(function () {
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for signup form
signupLink.on('click', function (event) {
	event.preventDefault();
	signupct.parents(overlay).addClass("openform");
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(signupct).each(function () {
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

// close popup for mobile
var closebt = $(".close");
closebt.on('click', function (e) {
	e.preventDefault();
	var overlay = $(".overlay");
	overlay.removeClass("openform");
});

// 여기서부터 추가
// var = $(".");
var signupokLink = $(".signupokLink");
var idfindLink = $(".idfindLink");
var idokLink = $(".idokLink");
var pwfindLink = $(".pwfindLink");
var pwokLink = $(".pwokLink");
var idcheckLink = $(".idcheckLink");
var nikcheckLink = $(".nikcheckLink");
// 약관 수정중
var termsLink = $(".termsLink");

// var = $("#"); 
var sginupokct = $("#signup-ok-content");
var idfindct = $("#id-find-content");
var idokct = $("#id-ok-content");
var pwfindct = $("#pw-find-content");
var pwokct = $("#pw-ok-content");
var idcheckct = $("#id-check-content");
var nikcheckct = $("#nik-check-content");
// 약관 수정중
var termsct = $("#terms-content");

//pop up for signup ok 추가
signupokLink.on('click', function (event) {
	event.preventDefault();
	sginupokct.parents(overlay).addClass("openform");
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(sginupokct).each(function () {
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for 추가

//pop up for id-find-content 추가
idfindLink.on('click', function (event) { // link 변경
	event.preventDefault();
	idfindct.parents(overlay).addClass("openform"); // ct 변경
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(idfindct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for id-ok-content 추가
idokLink.on('click', function (event) { // link 변경
	event.preventDefault();
	idokct.parents(overlay).addClass("openform"); // ct 변경
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(idokct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for pw-find-content 추가
pwfindLink.on('click', function (event) { // link 변경
	event.preventDefault();
	pwfindct.parents(overlay).addClass("openform"); // ct 변경
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(pwfindct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for pw-ok-content 추가
pwokLink.on('click', function (event) { // link 변경
	event.preventDefault();
	pwokct.parents(overlay).addClass("openform"); // ct 변경
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(pwokct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for id-check-content 추가
idcheckLink.on('click', function (event) { // link 변경
	event.preventDefault();
	idcheckct.parents(overlay).addClass("openform"); // ct 변경
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(idcheckct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

//pop up for nik-check-content 추가
nikcheckLink.on('click', function (event) { // link 변경
	event.preventDefault();
	nikcheckct.parents(overlay).addClass("openform"); // ct 변경
	$(document).on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(nikcheckct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});

/* 수정중 */
// //pop up for terms-content 추가
termsLink.on('click', function (event) { // link 변경
	event.preventDefault();
	termsct.parents(overlay2).addClass("openform2"); // ct 변경

	$(document).on('click', function (e) {

		var target = $(e.target);
		if ($(target).hasClass("overlay2")) {
			$(target).find(termsct).each(function () { // ct 변경
				$(this).removeClass("openform2");
			});
			setTimeout(function () {
				$(target).removeClass("openform2");
			}, 350);
		}
	});
});

/* 모달 닫기 */
// $('.terms-content-bt').click(function(){
// 	$().modal("hide"); //닫기
// 	event.preventDefault(); 

// });
// modal 끝

$('.terms-content-bt').on('click', function (event) { // link 변경
	event.preventDefault();
	termsct.parents(overlay).addClass("openform"); // ct 변경
	$('.terms-content').on('click', function (e) {
		var target = $(e.target);
		if ($(target).hasClass("overlay")) {
			$(target).find(termsct).each(function () { // ct 변경
				$(this).removeClass("openform");
			});
			setTimeout(function () {
				$(target).removeClass("openform");
			}, 350);
		}
	});
});



// 탑버튼 
// When the user scrolls down 20px from the top of the document, show the button
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		document.getElementById("hm_myBtn").style.display = "block";
	} else {
		document.getElementById("hm_myBtn").style.display = "none";
	}
}

// When the user clicks on the button, scroll to the top of the document
function topFunction() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

// 약관 wrapper 수정 중

var loginWrap2 = $(".login-wrapper2");

var overlay2 = $(".overlay2");

loginWrap2.each(function () {
	$(this).wrap('<div class="overlay2"></div>');
});


$('.terms-content-bt').click(function () {
	$('.overlay2').modal("hide");
	
});