<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>영화 시간 보기</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
/* All Device - 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨.*/

/* Mobile Device - 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨. 미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */

/* Tablet &amp; Desktop Device - 사용자 해상도가 768px 이상일 때 이 코드가 실행됨. 테블릿과 데스크톱의 공통 코드를 작성한다.*/
@media all and (min-width:768px) {
	.select-wrap {
		display: flex;
		align-items: center;
	}
	.select-style {
		border: 1px solid #ccc;
		width: 100%;
		height: 300px;
		border-radius: 3px;
		overflow: auto;
		background: #fafafa;
	}
	.select-style select {
		padding: 5px 8px;
		width: 100%;
		border: none;
		box-shadow: none;
		background: transparent;
		-webkit-appearance: none;
	}
	.select-style select:focus {
		outline: none;
	}
}

/* Tablet Device -  사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨. 아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */
@media all and (min-width:768px) and (max-width:1024px) {
	.select-wrap {
		display: flex;
		align-items: center;
	}
	.select-style {
		border: 1px solid #ccc;
		width: 100%;
		height: 300px;
		border-radius: 3px;
		overflow: auto;
		background: #fafafa;
	}
	.select-style select {
		padding: 5px 8px;
		width: 100%;
		border: none;
		box-shadow: none;
		background: transparent;
		-webkit-appearance: none;
	}
	.select-style select:focus {
		outline: none;
	}
}

/* Desktop Device  - 사용자 해상도가 1025px 이상일 때 이 코드가 실행됨. 1025px 이상의 랩탑 또는 데스크톱에 대응하는 코드를 작성한다.*/
@media all and (min-width:1025px) {
	.select-wrap {
		display: flex;
		align-items: center;
	}
	.select-style {
		border: 1px solid #ccc;
		width: 30%;
		height: 300px;
		border-radius: 3px;
		overflow: auto;
		background: #fafafa;
	}
	.select-style select {
		padding: 5px 8px;
		width: 100%;
		border: none;
		box-shadow: none;
		background: transparent;
		-webkit-appearance: none;
	}
	.select-style select:focus {
		outline: none;
	}
}
</style>
</head>

<body>
	<script>
		function selectCinema() {

			var CGV = [ "강남", "서초", "인천" ];
			var LOTTECINEMA = [ "강남", "서초", "인천", "서울역" ];
			var MEGABOX = [ "종로", "서초", "강남", "강변" ];

			var selectItem = $("#select1").val();

			var changeItem;

			if (selectItem == "CGV") {
				changeItem = CGV;
			} else if (selectItem == "롯데시네마") {
				changeItem = LOTTECINEMA;
			} else if (selectItem == "메가박스") {
				changeItem = MEGABOX;
			}

			$('#select2').empty();

			for (var count = 0; count < changeItem.length; count++) {
				var option = $("<option>" + selectItem + " "
						+ changeItem[count] + "</option>");
				$('#select2').append(option);
			}

		}

		function selectMovieroom() {

			var CGV = [ "1관", "2관", "3관" ];
			var LOTTECINEMA = [ "강남", "서초", "인천", "서울역" ];
			var MEGABOX = [ "종로", "서초", "강남", "강변" ];

			var selectItem = $("#select1").val();

			var changeItem;

			if (selectItem == "CGV") {
				changeItem = CGV;
			} else if (selectItem == "롯데시네마") {
				changeItem = LOTTECINEMA;
			} else if (selectItem == "메가박스") {
				changeItem = MEGABOX;
			}

			$('#select3').empty();

			for (var count = 0; count < changeItem.length; count++) {
				var option = $("<option>" + changeItem[count] + "</option>");
				$('#select3').append(option);
			}

		}
	</script>

	<div class="select-wrap">
		<div class="select-style">
			<select id="select1" onchange="selectCinema()" multiple>
				<option>CGV</option>
				<option>롯데시네마</option>
				<option>메가박스</option>
			</select>
		</div>

		<div class="select-style">
			<select id="select2" onchange="selectMovieroom()" multiple>
				<option>영화사를</option>
				<option>선택해주세요</option>
			</select>
		</div>

		<div class="select-style">
			<select id="select3" multiple>
				<option>영화관을</option>
				<option>선택해주세요</option>
			</select>
		</div>
	</div>
</body>

</html>