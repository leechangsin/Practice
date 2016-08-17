<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; utf-8">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body{background-color:#EAEAEA; font-family: 'Nanum Gothic', sans-serif; }
</style>
</head>

<body>
	<div class='col-md-12'>
		<!--상단바-->
		<p class="bg-primary" style="margin 0% 0% 0% 0%;">
      <img src='/resources/navbar.jpg' style="width:66px; height:35px; margin:3px 10px 3px 5px;">
		<B>CAMPUSBOOK</B>
		<td align=right><button type="button" class="btn btn-primary" style='margin: 0px 0px 0px 1550px;'id="logout" name="logout">LOGOUT</button></td>
		</p>
	</div>
		<div class='col-md-2'>
		</div>
	<div class='col-md-8'>
		<div class='col-md-3'>
			<div class="row">
				<div class="col-sm-10 col-md-12">
					<div class="thumbnail" >
						<div class="caption">
							<div class='col-md-12'>
								<div class='col-md-7'>
									<img src='<%=session.getAttribute("img")%>'
										style='width: 100%; height: 120px; margin: 0px 0px 0px -20px;'>
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
								<li role="presentation" class="dropdown"
									style='margin: 20px 0px 0px 0px;'><center>
										<a class="dropdown-toggle" data-toggle="dropdown" href="#"
											role="button" aria-expanded="false"> 게 시 판 <span
											class="caret"></span>
										</a>
										<ul class="dropdown-menu" role="menu">
											<c:forEach items="${subject_List}" var="list">
												<li role="presentation"><a role="menuitem"
													tabindex="-1" href="/board/${list.subnum}">${list.subject}</a></li>
											</c:forEach>
										</ul>
									</center></li>
								<center>
									<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
										href="/search">친 구 찾 기</a></li>
								</center>
								<center>
									<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
										href="/friend">친 구  목 록</a></li>
								</center>
								<center>
									<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
										href="/message">메 세 지</a></li>
								</center>
								<center>
									<li role="presentation" style='margin: 20px 0px 0px 0px;'><a
										href="/profile">환 경 설 정</a></li>
								</center>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class='col-md-9'>
			<div class="row">
				<div class="col-sm-10 col-md-12" >
					<div class="thumbnail" style='margin: 0px 0px -3px 0px;'>
			<ul class="nav nav-tabs nav-justified">
				<li role="presentation"><a href="/search"><span
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
			<div class="panel panel-default" style='margin: 10px 0px 0px 0px;'>
				<div class="panel-heading">
                     <h1><strong><mark>${lecture_subject}</mark></strong></h1>
                     <table width="100%">
                       <tbody>
                        <td>
                          <h4><strong>교수님</strong></h4>
                           ${lecture_professor}
                        </td>
                        <td>
                          <h4><strong>시간</strong></h4>
                           ${lecture_time}
                        </td>
                        <td>
                          <h4><strong>강의 개요</strong></h4>
                           ${lecture_intro}
                        </td>
                        <td>
                          <img src= "${lecture_image}" style="width:66px; height:70px;">
                        </td>
                       </tbody>
                     </table>
            </div>
				<div class="panel-body" style='height: 65%;'>
					<div style='margin: 3px 0px 0px 0px;'>
						<form>
							<div class="input-group">
								<input type="text" name="content" id="content"
									class="form-control" placeholder="내용"> <span
									class="input-group-btn">
									<button class="btn btn-default" id="write" type="button"
										role="button">글쓰기</button>
								</span>
							</div>
							<!-- /input-group -->
						</form>
					</div>
					<!-- /.row -->
					<table class="table table-striped" id="boardResultArea">
						<tr>
							<td>한줄 수다</td>
							<td>작성자</td>
						</tr>
						<c:forEach items="${board_List}" var="list">
							<tr>
								<td>${list.content}</td>
								<td>${list.id}</td>
							</tr>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>
	</div>
	<div class='col-md-2'>
		</div>
</body>
<script>
	$('#write').click(function() {
		$.ajax({
			type : "GET", // GET or POST
			url : '/writeBoard', // URL
			datatype : "xml", // html, xml, json, jsonp, script, text
			data:{content:$('#content').val()},         // parameters as plain object
			error : function(XMLHttpRequest, textStatus, thrownError) {
				alert(textStatus);
			},
			success : function(data,status) { // Ajax complete handelr
				$('#boardResultArea').empty().append(data);
			}
		});
	})
	$("#logout").click(function(){
		alert("이용해주셔서 감사합니다.")
		location.href= "/logout"
	})
</script>
</html>