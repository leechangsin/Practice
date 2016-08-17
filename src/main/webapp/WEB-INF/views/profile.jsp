<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset=utf-8">


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
    <div class='col-md-12'><!--상단바-->
        <p class="bg-primary" style="margin 0% 0% 0% 0%;">
      <img src='/resources/navbar.jpg' style="width:66px; height:35px; margin:3px 10px 3px 5px;">
		<B>CAMPUSBOOK</B>
		<td align=right><button type="button" class="btn btn-primary" style='margin: 0px 0px 0px 1550px;' id="logout" name="logout">LOGOUT</button></td>
   </p>
    </div>
    <div class='col-md-2'>
		</div>
    <div class='col-md-8'>
        <div class='col-md-3'>
            <div class="row">
                <div class="col-sm-10 col-md-12" >
                    <div class="thumbnail" style='height:100%;'>
                        <div class="caption">
                        <div class='col-md-12'>
                            <div class='col-md-7'>
                                <img src='<%=session.getAttribute("img") %>' style= 'width:100%; height:120px; margin:0px 0px 0px -20px;' class="img-rounded">
                            </div>
                            <div class='col-md-5' style='margin:0px 0px 0px -20px;'>
                                </br></br></br>
                                <a href="/main"><h4><B><%=session.getAttribute("username")%></B></h4></a>
                            </div>
                        </div>
                            <ul class="nav nav-pills nav-stacked" >
                                <center><li role="presentation" style='margin: 40px 0px 0px 0px;'><a href="#">시 간 표</a></li></center>
                                <center><li role="presentation" class="dropdown" style='margin:20px 0px 0px 0px;'>
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                      게 시 판 <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                    <c:forEach items="${subject_List}" var="list">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="/board/${list.subnum}">${list.subject}</a></li>
                                    </c:forEach>
                                    </ul>
                                 </li></center>
                                <center><li role="presentation" style='margin:20px 0px 0px 0px;'><a href="/search">친 구  찾 기</a></li></center>
                                <center><li role="presentation" style='margin:20px 0px 0px 0px;'><a href="/friend">친 구  목 록</a></li></center>
                                <center><li role="presentation" style='margin:20px 0px 0px 0px;'><a href="/message">메 세 지</a></li></center>
                                <li role="presentation" class="active" style='margin:20px 0px 0px 0px;' ><a href="/profile"><center>환 경 설 정</center></a></li>
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
                <li role="presentation" ><a href="/search"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></li>
                <li role="presentation" ><a href="/friend"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
                <li role="presentation" ><a href="/message"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></a></li>
                <li role="presentation" class="active"><a href="/profile"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></li>
            </ul>
			</div>
					   </div>
					</div>
        </div>
        <div class='col-md-9'> <!--고정틀말고-->
        <form action = "/modify" method ="post" enctype="multipart/form-data">
		<div class="panel panel-default" style='margin: 10px 0px 0px 0px;'>
            <div class="panel-body" style='height:95%;'>
			<div class='col-md-12'>
                <div class='col-md-5'>
                    <img src='/resources/inuimg.jpg' style='height:45%; width:100%; margin:60px 0px 0px 0px;'>
                  <input type=file name='upload' style='display: none;'> 
                  <button type="button" class="btn btn-primary" style='float:right; margin: 10px 0px 0px 0px;' src='이미지경로' border='0' onclick='document.all.upload.click(); document.all.file2.value=document.all.file1.value'> 
                     사진 바꾸기
                  </button>                  
                </div>
                <div class='col-md-7'>
                    <div class="list-group" style='margin: 60px 0px -7px 0px;'>
                      <a href="#" class="list-group-item">
                        <h4 class="list-group-item-heading" style='margin: 10px 0px 0px 0px;'>이름</h4>
                        <p class="list-group-item-text">
                            <div class="input-group" style='width:100%; margin: 10px 0px -5px 0px;'>
                                <h4><B><%=session.getAttribute("username") %></B></h4>
                                <span class="input-group-btn" >
                                </span>
                            </div>
                        </p>
                      </a>
                    </div>
                    <div class="list-group" style=' margin:20px 0px -7px 0px;'>
                      <a href="#" class="list-group-item" >
                        <h4 class="list-group-item-heading" style='margin: 10px 0px 0px 0px;'>성별</h4>
                        <p class="list-group-item-text">    
                            <div class="radio-inline" style='margin: 10px 0px -7px 0px;'>
                                <label>
                                    <input type="radio" name="sex" id="optionsRadios1" value="남자">
                                    남자
                                    </label>
                            </div>
                            <div class="radio-inline" style='margin: 10px 0px -7px 0px;'>
                                <label>
                                    <input type="radio" name="sex" id="optionsRadios2" value="여자">
                                    여자
                                </label>
                            </div>
                        </p>
                      </a>
                    </div>
                    <div class="list-group" style='margin:20px 0px -7px 0px;'>
                      <li href="#" class="list-group-item">
                        <h4 class="list-group-item-heading">학과</h4>
                        <p class="list-group-item-text">
                     <div class="radio-inline" style='margin: 10px 0px -7px 0px;'>
                                <label>
                                    <input type="radio" name="major" id="optionsRadios1" value="컴퓨터공학부">
                              컴퓨터공학부
                                    </label>
                            </div>
                            <div class="radio-inline" style='margin: 10px 0px -7px 0px;'>
                                <label>
                                    <input type="radio" name="major" id="optionsRadios2" value="정보통신공학과">
                              정보통신공학과
                                </label>
                            </div>
                     <div class="radio-inline" style='margin: 10px 0px -7px 0px;'>
                                <label>
                                    <input type="radio" name="major" id="optionsRadios2" value="임베디드시스템공학부">
                              임베디드시스템공학부
                                </label>
                            </div>
                        </p>
                      </li>
                    </div>
                    <div class="list-group" style=' margin:20px 0px -7px 0px;'>
                      <a href="#" class="list-group-item">
                  <h4 class="list-group-item-heading">과목</h4>
                     <table class="table table-condensed ">
                        <thead>
                           <tr>
                              <td>
                                 <div class="checkbox" style='margin: 10px 0px 0px 0px;'>
                                 <label>
                                    <input type="checkbox" name="subnum" id="optionsRadios1" value="1">
                                    
                                       분산시스템
                                    </label>
                                 </div>
                              </td>
                              <td>
                                 <div class="checkbox" style='margin: 5px 0px 0px 0px;'>
                                    <label>
                                       <input type="checkbox" name="subnum" id="optionsRadios1" value="2">
                                          웹프로그래밍
                                    </label>
                                 </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                 <div class="checkbox" style='margin: 10px 0px 0px 0px;'>
                                 <label>
                                    <input type="checkbox" name="subnum" id="optionsRadios1" value="3">
                                       데이터 베이스
                                    </label>
                                 </div>
                              </td>
                              <td>
                                 <div class="checkbox" style='margin: 5px 0px 0px 0px;'>
                                    <label>
                                       <input type="checkbox" name="subnum" id="optionsRadios1" value="4">
                                          운영체제
                                    </label>
                                 </div>
                              </td>
                            </tr>
                            <tr>
                              <td>
                                 <div class="checkbox" style='margin: 10px 0px 0px 0px;'>
                                 <label>
                                    <input type="checkbox" name="subnum" id="optionsRadios1" value="5">
                                       이산수학
                                    </label>
                                 </div>
                              </td>
                              <td>
                                 <div class="checkbox" style='margin: 5px 0px 0px 0px;'>
                                    <label>
                                       <input type="checkbox" name="subnum" id="optionsRadios1" value="6">
                                          프로그래밍언어론
                                    </label>
                                 </div>
                              </td>
                            </tr>
                           
                        </thead>
                     </table>
                        <h4 class="list-group-item-heading">메일 주소</h4>
                        <p class="list-group-item-text">
                            <div class="input-group" style='width:100%; margin: 10px 0px 0px 0px;'>
                                <input type="text" name="email" class="form-control" placeholder="E-MAIL">
                                <span class="input-group-btn" >
                                </span>
                            </div>
                        </p>
                        <h4 class="list-group-item-heading">연락처</h4>
                        <p class="list-group-item-text">
                            <div class="input-group" style='width:100%; margin: 10px 0px 0px 0px;'>
                                <input type="text" name="phone" class="form-control" placeholder="PHONE NUMBER">
                                <span class="input-group-btn" >
                                </span>
                            </div>
                        </p>
                        <h4 class="list-group-item-heading">생일</h4>
                        <p class="list-group-item-text">
                            <div class="input-group" style='width:100%; margin: 10px 0px 0px 0px;'>
                                <input type="text" name="birth" class="form-control" placeholder="YYYY/MM/DD">
                                <span class="input-group-btn" >
                                </span>
                            </div>
                        </p>
                      </a>
                    </div>
                    <!--수정버튼-->
                    <div class='col-md-12'>
                        <div class='col-md-6'>
                        </div>
                        <div class='col-md-6'>
                            <button type="submit" class="btn btn-primary" style='width: 49%; margin:20px 0px 0px 0px;'>수정</button>
                            <button type="button" class="btn btn-default" style='width: 48%; margin:20px 0px 0px 0px;' 
                            href="main">취소</button></br>
                        </div>
                    </div>
                </div>
            </div>
			</div>
        </form>
        </div>
    </div>
	<div class='col-md-2'>
		</div>

</body>
<script>
$("#logout").click(function(){
	alert("이용해주셔서 감사합니다.")
	location.href= "/logout"
})
</script>
</html>