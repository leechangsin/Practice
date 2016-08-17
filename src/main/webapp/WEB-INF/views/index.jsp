<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html"; charset=utf-8">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body{background-color:#EAEAEA; font-family: 'Nanum Gothic', sans-serif; }
</style>
</head>

<body>
    <script src="http://code.jquery.com/jquery.js"></script>
    <div class='col-md-12'><!--상단바-->
       <p class="bg-primary" style="margin 0% 0% 0% 0%;">
      <img src='/resources/navbar.jpg' style="width:66px; height:35px; margin:3px 10px 3px 5px;">
		<B>CAMPUSBOOK</B>
   </p>
    </div>
    <div class='col-md-2'>
		</div>
    <div class='col-md-8'>
        <div class='col-md-7'><!--그림사진-->
            <center>
                <img src='/resources/inumain.jpg' style='height:170px; margin:110px 0px 0px 0px;'>
                </br></br></br></br></br>
                <p style="font-size:20px;font-family:TD씨_씨고딕">인천대학교 Campusbook에 오신것을 환영합니다.</p>
                <p style="font-size:20px;font-family:씨고딕">Campusbook에서 나와 같은 수업을 듣는 친구들을 만나보세요.</p>
            </center>
        </div>
        
        <div class='col-md-5' style='padding:0px;' ><!--로그인div-->
            <form action="/login" method="post">
                <div class='col-md-9'><!--로그인-->
                    <input type='text' class='form-control' name="id" id="id" style='width:100%; margin: 100px 0px 0px 0px;' placeholder='학번'>
                    <input type='password' class='form-control' name="passwd" id="password" style='width:100%; margin: 2% 0% 3% 0%' placeholder='비밀번호'>
                    <div class="checkbox" style='margin:0% 0% 5% 0%'>
                        <label><input type="checkbox" value="">아이디 기억</label>
                    </div>
                </div>
                <div class='col-md-3'>
                    <button type="submit" class="btn btn-primary" style="width:90px; height:70px; margin: 100px 0px 0px -20px;">로그인</button>
                </div>              
            </form>
            
            <form action="/join" method="post">
            <!--회원가입-->
            <!-- TODO 시간되면 비밀번호 구현하기  -->
                <div class='col-md-9'>
                    <input type='text' class='form-control' name="name" id="id" style='width:100%; margin: 80px 0px 0px 0px;' placeholder='이름'>
                    <input type='text' class='form-control' name="id" id="id" style='width:100%; margin: 2% 0% 0% 0%;' placeholder='학번'>
                    <input type='password' class='form-control' name="passwd" id="password" style='width:100%; margin: 2% 0% 0% 0%' placeholder='비밀번호'>
                    <input type='password' class='form-control' id="password" style='width:100%; margin: 2% 0% 0% 0%' placeholder='비밀번호 확인'>
                </div>
                <div class='col-md-3'>
                    <button type="submit" class="btn btn-primary" style="width:90px; height:70px; margin: 80px 0px 0px -20px;">회원가입</button>
                </div>
            </form>
        </div>
    </div>
	<div class='col-md-2'>
		</div>


    <script>
    
    </script>
    </body>
</html>