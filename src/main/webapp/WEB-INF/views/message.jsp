<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title"><B>메시지 보내기<B></h4>
            </div>
            <form action="/sendMessage2" method="post" class="form-inline" role="form">
            <div class="modal-body">
            <!-- 여기가 제목이랑 내용쓰는거 여기 배치잘해주셈 -->
                     <h3  style='margin:-3px 0px 0px 0px;'><B>제목 </B></h3>
                     <input type="text" name ="title" class="form-control" placeholder="Text input" style='width:100%;'>
                     <h3><B>내용</B></h3>
                     <textarea class="form-control" name="content" rows="3" style='width:100%; height:20%'></textarea>
                     <!-- hidden -->
                     <input type="hidden" name="receiver_id" id="modalId">
                     <input type="hidden" name="name" id="modalName">
            </div>
            <td align=right><button type="submit" class="btn btn-primary" style='margin: -10px 0px 7px 520px;'>Send</button></td>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
   <div class='col-md-12'><!--상단바-->
   <p class="bg-primary" style="margin 0% 0% 0% 0%;">
      <img src='/resources/navbar.jpg' style="width:66px; height:35px; margin:3px 10px 3px 5px;">
      <b>CAMPUSBOOK</b>
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
                        <li role="presentation"  style='margin:20px 0px 0px 0px;'><a href="/search"><center>친 구  찾 기</center></a></li>
                        <center><li role="presentation" style='margin:20px 0px 0px 0px;'><a href="/friend">친 구  목 록</a></li></center>
                        <li role="presentation" class="active" style='margin:20px 0px 0px 0px;'><a href="/message"><center>메 세 지</center></a></li>
                        <li role="presentation" style='margin:20px 0px 0px 0px;' ><a href="/profile"><center>환 경 설 정</center></a></li>
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
                        <li role="presentation" class="active"><a href="/message"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span></a></li>
                        <li role="presentation" ><a href="/profile"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a></li>
                      </ul>
                      </div>
                  </div>
               </div>
           </div>
           <div class='col-md-9'> <!--고정틀말고-->
           <form action="/search_Friend" method ="post">
             <div class="panel panel-default" style='margin: 10px 0px 0px 0px;'>
               <div class="panel-heading">메세지</div>
                  <div class="panel-body" style='height:90%;'>
                  <c:forEach items="${message_List}" var="list">
                    <div class='col-md-12' style='margin:0px 0px 5px 0px;'>
                    <div class='col-md-2'>
                      <table width="100%">
                          <tbody>
                           <tr>
                           <td class="goods_img"><sapn class="goods_cnt"></sapn> 
                          <span class="image"><img src="${list.image}" style="height:100px; width:100px; margin: 0px 0px 0px -10px;" class="img-rounded"></span>
                          </td> 
                             </tr>
                             </tbody>
                             </table>
                             </div>
                             <div class='col-md-3'>
                      <table width="100%">
                             <tbody>
                           <tr>
                              <td class="goods_infogrp">                              
                              <h5 style='margin:10px 0px 0px -35px;'>송신자 : <span class="name">${list.sender_name}</span></h5>
                              <h5 style='margin:10px 0px 0px -35px;'>학과        : <span class="major">${list.major}</span></h5>                              
                              </td>
                           </tr>
                          </tbody>
                        </table>                     
                     
                    </div>
                     <div class='col-md-6'>
                      <table width="100%">
                             <tbody>
                           <tr>
                              <td>
                              <h5 style='margin:5px 0px 7px 0px;'>제목        : <span class="title">${list.title}</span></h5>
                              <p>${list.content}<p>
                              </td>
                           </tr>
                          </tbody>
                        </table>                     
                     
                    </div>
                    <div class='col-md-1'>
                    	<button type="button" class="btn btn-primary popbutton" style="height:100%;">답장</button>
                    </div>
                    
                  </div>
                  </c:forEach>
             </div>         
             </form>
           </div>
         </div>
      <div class='col-md-2'>
      </div>
</body>
<script>
<!-- 다중선택 방법 알아내기 -->
$('#search_member').click(function() {
    $.ajax({
        type : "GET", // GET or POST
        url : '/search_Friend', // URL
        datatype : "xml", // html, xml, json, jsonp, script, text
        data:{subject:$('#subject').val(),
              major:$('#major').val(),
        error : function(XMLHttpRequest, textStatus, thrownError) {
            alert(textStatus);
        },
        success : function(data,status) { // Ajax complete handelr
           alert();
        }
        }
    });
})
$("#logout").click(function(){
		alert("이용해주셔서 감사합니다.")
		location.href= "/logout"
	})
	
$('.popbutton').click(function(){

	var name =
$(this).parent().parent().find('.name').text();
		
	$('div.modal').modal();
	$('#modalName').val(name);
})

	
</script>

</html>