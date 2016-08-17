<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	background-color: #EAEAEA;
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>

<body>
	<div class='col-md-12'>
		<!--상단바-->
		<p class="bg-primary" style="">
			<img src='/resources/navbar.jpg'
				style="width: 66px; height: 35px; margin: 3px 10px 3px 5px;">
			<B>CAMPUSBOOK</B>
			<td align=right><button type="button" class="btn btn-primary"
					style='margin: 0px 0px 0px 1550px;' id="logout" name="logout">LOGOUT</button></td>
		</p>
	</div>
	<div class='col-md-2'></div>
	<div class='col-md-8'>
		<div class='col-md-3'>
			<div class="row">
				<div class="col-sm-10 col-md-12">
					<div class="thumbnail" style='height: 100%;'>
						<div class="caption">
							<div class='col-md-12'>
								<div class='col-md-7'>
									<img src='<%=session.getAttribute("img")%>'
										style='width: 100%; height: 120px; margin: 0px 0px 0px -20px;'
										class="img-rounded">
								</div>
								<div class='col-md-5' style='margin: 0px 0px 0px -20px;'>
									</br> </br> </br>
									<a href="/main"><h4><B><%=session.getAttribute("username")%></B></h4></a>
								</div>
							</div>
							<ul class="nav nav-pills nav-stacked">
								<center>
									<li role="presentation" style='margin: 40px 0px 0px 0px;'><a
										href="#">시 간 표</a></li>
								</center>
								<center>
									<li role="presentation" class="dropdown"
										style='margin: 20px 0px 0px 0px;'><a
										class="dropdown-toggle" data-toggle="dropdown" href="#"
										role="button" aria-expanded="false"> 게 시 판 <span
											class="caret"></span>
									</a>
										<ul class="dropdown-menu" role="menu">
											<c:forEach items="${subject_List}" var="list">
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="/board/${list.subnum}">${list.subject}</a></li>
											</c:forEach>
										</ul></li>
								</center>
								<li role="presentation" class="active"
									style='margin: 20px 0px 0px 0px;'><a href="/search"><center>친
											구 찾 기</center></a></li>
								<center>
									<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
										href="/friend">친 구 목 록</a></li>
								</center>
								<center>
									<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
										href="/message">메 세 지</a></li>
								</center>
								<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
									href="/profile"><center>환 경 설 정</center></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='col-md-9'>
			<div class="row">
				<div class="col-sm-10 col-md-12">
					<div class="thumbnail" style='margin: 0px 0px -3px 0px;'>
						<ul class="nav nav-tabs nav-justified">
							<li role="presentation" class="active"><a href="/search"><span
									class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
							<li role="presentation"><a href="/friend"><span
									class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
							<li role="presentation"><a href="/message"><span
									class="glyphicon glyphicon-comment" aria-hidden="true"></span></a></li>
							<li role="presentation"><a href="/profile"><span
									class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class='col-md-9'>
			<!--고정틀말고-->
			<form action="/search_Friend" method="post">
				<div class="panel panel-default" style='margin: 10px 0px 0px 0px;'>
					<div class="panel-heading">인천대학교 친구들을 찾아줍니다!</div>
					<div class="panel-body" style='height: 95%;'>
						<div class='col-md-12'>
							<div class='col-md-4'>
								<div class="panel panel-default">
									<div class="panel-heading">성별</div>
									<div class="panel-body">
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="sex" id="major"
												value="남자"> 남자
											</label>
										</div>
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="sex" id="major"
												value="여자"> 여자
											</label>
										</div>
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="sex" id="major"
												value="NO"> 무관
											</label>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">학과</div>
									<div class="panel-body">
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="major"
												id="major" value="컴퓨터공학부"> 컴퓨터공학부
											</label>
										</div>
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="major"
												id="major" value="정보통신공학과"> 정보통신학과
											</label>
										</div>
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="major"
												id="major" value="임베디드시스템공학부"> 임베디드시스템공학부
											</label>
										</div>
										<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
											<label> <input type="checkbox" name="major"
												id="major" value="NO"> 무관
											</label>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading">강의</div>
									<div class="panel-body">

										<c:forEach items="${subject_List}" var="list">
											<div class="checkbox" style='margin: 10px 0px 0px 0px;'>
												<label> <input type="checkbox" name="subnum"
													id="subnum" value="${list.subnum}">${list.subject}
												</label>
											</div>
										</c:forEach>


									</div>
								</div>
								<button type="submit" class="btn btn-default"
									style='width: 100%; margin: 2px 0px 0px 0px;'>찾기</button>
							</div>
							<div class='col-md-8'>
								<div class="panel panel-default"
									style='margin: 0% 0% 0% 0%; height: 100%;'>

									<div class="panel-body">
										<c:forEach items="${search_Friend}" var="list">
											<div class='col-md-12' style='margin:0px 0px 5px 0px;'>
												<div class='col-md-4'>
													<table width="100%">
														<tbody>
															<tr>
																<td class="goods_img"><sapn class="goods_cnt"></sapn>
																	<img src="${list.image}"
																	style="height: 100px; width: 100px; margin: 0px 0px 0px -10px;"
																	class="img-rounded"></td>

															</tr>
														</tbody>
													</table>
												</div>
												<div class='col-md-6'>

													<table width="100%">
														<tbody>
															<tr>
																<td class="goods_infogrp">
																	<h5 style='margin: 20px 0px 0px -35px;'>
																		이름:${list.name}
																		</h6>
																		<h5 style='margin: 10px 0px 0px -35px;'>학과:${list.major}</h5>
																		<h5 style='margin: 10px 0px 10px -35px;'>학번:${list.id}</h5>
																	</h5>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class='col-md-2'>

													<table width="100%">
														<tbody>
															<tr>
																<td>
																	<button class="btn btn-primary" type="button"
																		style='margin: 60% 0% 0% 0%;' id="add"
																		onClick="location.href='/addFriend?id=${list.id}'">추가</button>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class='col-md-2'></div>
</body>
<script>
<!-- 다중선택 방법 알아내기 -->
	$('#search_member').click(function() {
		$.ajax({
			type : "GET", // GET or POST
			url : '/search_Friend', // URL
			datatype : "xml", // html, xml, json, jsonp, script, text
			data : {
				subject : $('#subject').val(),
				major : $('#major').val(),
				error : function(XMLHttpRequest, textStatus, thrownError) {
					alert(textStatus);
				},
				success : function(data, status) { // Ajax complete handelr
					alert();
				}
			}
		});
	})
	$("#logout").click(function() {
		alert("이용해주셔서 감사합니다.")
		location.href = "/logout"
	})
</script>

</html>