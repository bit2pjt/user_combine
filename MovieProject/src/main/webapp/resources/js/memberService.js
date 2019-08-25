//1-1. 화면의 팔로워 수 갱신
function countFollower(id, callback, error) {
	console.log('id를 기준으로 팔로워 카운터 시작' + id);
	$.ajax({
		type: 'get',
		dataType: 'json',	//자동처리 믿지말자. 없으면 success가 작동하지 않는다.
		url: '/movie/getCountFollower/' + id,
		success: function (result) {
			console.log('countFollower call back  : ' + result);
			if (callback) {
				callback(result);
			}
		},
		error: function (xhr, status, er) {
			if (error) {
				alert('에러??');
				error(er);
			}
		}
	});
}

function countFollowing(id, callback, error) {
	console.log('id를 기준으로 팔로워 카운터 시작' + id);
	$.ajax({
		type: 'get',
		dataType: 'json',	//자동처리 믿지말자. 없으면 success가 작동하지 않는다.
		url: '/movie/getCountFollowing/' + id,
		success: function (result) {
			console.log('countFollowing call back  : ' + result);
			if (callback) {
				callback(result);
			}
		},
		error: function (xhr, status, er) {
			if (error) {
				alert('에러??');
				error(er);
			}
		}
	});
}

//1-2. 화면의 좋아요 수 갱신
function countLike(mml_num, callback, error) {
	console.log('id를 기준으로 좋아요 카운터 시작' + mml_num);
	$.ajax({
		type: 'get',
		dataType: 'json',	//자동처리 믿지말자. 없으면 success가 작동하지 않는다.
		url: '/movie/getCountLike/' + mml_num,
		success: function (result) {
			console.log('countLike call back  : ' + result);
			if (callback) {
				callback(result);
			}
		},
		error: function (xhr, status, er) {
			if (error) {
				alert('에러??');
				error(er);
			}
		}
	});
}




//2-3-1 회원전용 서비스 클릭시, 로그인 여부를 검증하는 함수다. 로그인을 하지 않은 경우에만 작동하며, 다른 이벤트를 모두
// 취소시킨 후 로그인 modal로 강제 이동시킨다.
$('.ws_memberService').on('click', function (event) {

	var session_email = $('#ws_email_session').val();
	//alert('멤버서비스'+session_email); //어떤 값이 들어오는지 확인할 때.
	//var session_email = null; //null값에 정상적으로 반응하는지 확인하려면.
	if (session_email == null || session_email == "") {
		alert('회원전용 서비스입니다. 로그인 페이지로 이동합니다');
		//이벤트 중지
		event.stopImmediatePropagation();
		//새로운 이벤트 발생 : 트리거
		$('.loginLink').trigger("click");
	}

});

//팔로우 클릭시, 2-3-2
$('#ws_following').on('click', function (event, callback, error) {
	var id = $('#ws_id').val();
	var name = $('#mml_con_nick').attr('value');
	//1. 팔로우 테이블에 새로운 값 추가<insert> 발생. 입력과 갱신(member의 follower값 update)만 있을 뿐, 반환값은 없다.
	//2. 바로 이어서 follower값을 요청하는 함수를 호출해준다. 우선은 이렇게 해줘야 나중에 화면에서 흐름을 이해하기 쉬울듯 하다.
	console.log('팔로우 테이블에 관계레코드 추가 ' + id);
	$.ajax({
		type: 'get',
		dataType: 'text',	//컨트롤러에서는 결과처리가 확인되지만, Ajax가 값을 못 받는다면 dataType의 문제다. 원인은 모른다.
		url: '/movie/registerFollowRelationship/' + id,

		success: function (result) {

			console.log('setFollowRelationship call back  : ' + result);
			if (result == 'success') {
				alert(name + '님을 팔로우 합니다');
				//추가되었으니, 다시 follower값을 갱신해주자.
				countFollower(id, function (result) {
					$('#ws_follower_set').html(result);
				});
			} else if (result == 'followItSelf') {
				alert('스스로를 follow 할 수 없습니다.');
			} else if (result == 'overlaped') {
				alert('이미 팔로우 하셨습니다.')
			}
		},
		error: function (xhr, status, er) {
			if (error) {
				alert('에러??');
				error(er);
			}
		}
	});




});



//좋아요 클릭시, 2-3-3
//좋아요 추가 -> 나영리 게시글 테이블의 좋아요 수 업데이트 -> 화면의 좋아요 카운트 갱신
$('#ws_give_like').on('click', function (event) {
	var mml_num = $('#ws_mml_content_num').val();
	alert(mml_num + ' 게시물을 추천합니다');	//ajax  시작

	$.ajax({
		type: 'get',
		dataType: 'text',	//컨트롤러에서는 결과처리가 확인되지만, Ajax가 값을 못 받는다면 dataType의 문제다. 원인은 모른다.
		url: '/movie/giveLike/' + mml_num,

		success: function (result) {

			console.log('setFollowRelationship call back  : ' + result);
			if (result == 'success') {
				alert('추천하셨습니다');
				//추가되었으니, 다시 follower값을 갱신해주자.
				countLike($('#ws_mml_content_num').val(), function (result) {
					$('#ws_like_set').html(result);
				});
			} else if (result == 'likeItSelf') {
				alert('스스로를 추천 할 수 없습니다.');
			} else if (result == 'overlaped') {
				alert('이미 추천하셨습니다.')
			}
		},
		error: function (xhr, status, er) {
			if (error) {
				alert('에러??');
				error(er);
			}
		}
	});

});



//신고 클릭시, 2-3-4
$('#ws_give_warning').on('click', function (event) {
	var mml_num = $('#ws_mml_content_num').val();
	alert(mml_num + ' 게시물을 신고합니다');	//Ajax 시작

	$.ajax({
		type: 'get',
		dataType: 'text',	//컨트롤러에서는 결과처리가 확인되지만, Ajax가 값을 못 받는다면 dataType의 문제다. 원인은 모른다.
		url: '/movie/giveWarning/' + mml_num,

		success: function (result) {

			console.log('setFollowRelationship call back  : ' + result);
			if (result == 'success') {
				alert('신고가 정상적으로 접수되었습니다');
				//신고는 별도의 화면갱신 없다.

			} else if (result == 'likeItSelf') {
				alert('스스로를 신고할 수 없습니다.');
			} else if (result == 'overlaped') {
				alert('이미 신고하셨습니다.')
			}
		},
		error: function (xhr, status, er) {
			if (error) {
				alert('에러??');
				error(er);
			}
		}
	});


});


