<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<meta charset="UTF-8">
	<title>DB Setting Page</title>
	<style>
		.wrap {
			width: 1100px;
			margin: 200px auto 0;
			text-align: center;
		}

		h2.title {
			margin: 5px;
			font-size: 34px;
			font-weight: 700;
		}

		a.link {
			margin: 5px;
			line-height: 2em;
			font-size: 22px;
		}
	</style>
</head>

<%@ include file="../include/header.jsp" %>

<div class="wrap">
	<h2 class="title">캠핑장 정보 DB 입력용 페이지</h2> <br>
	<hr> <br>
	<div class="link-box">
		<a class="link" href="1">첫번째 Json 파일 DB에 넣기</a> <br>
		<a class="link" href="2">두번째 Json 파일 DB에 넣기</a> <br>
		<a class="link" href="3">세번째 Json 파일 DB에 넣기</a> <br>
		<a class="link" href="4">네번째 Json 파일 DB에 넣기</a> <br>
		<a class="link" href="5">캠핑장 요금</a>
	</div>
</div>

<script>
	window.onload = function () {

		document.querySelector('.link-box').addEventListener('click', e => {
			e.preventDefault();

			if (!e.target.matches('a')) {
				return;
			}

			const num = e.target.getAttribute('href');

			const reqObj = {
				method: 'post'
			};

			fetch('${pageContext.request.contextPath}/db/set/' + num, reqObj)
				.then(res => res.text())
				.then(data => {
					alert(num + '번째 JSON 파일 DB 저장 완료!');
				});

		});

		

	};
</script>

<%@ include file="../include/footer.jsp" %>