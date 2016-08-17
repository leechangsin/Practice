//list에서 과목 선택 이벤트 
function setEventSubject(subject) {
	var dbclick=false; 
	$(subject).click(function(e) {    
		setTimeout(function(){
			if(dbclick ==false){
				var subjectCode = $(subject).attr('subjectCode');

				$.ajax({
					type:"GET",
					url:"/getLineEvaluation.baron",
					data:"subjectCode=" + subjectCode,
					datatype:"xml",
					error:function() {
						alert('ajax failed');
					},
					success:function(data, status) {//해당 과목 댓글창 출력
						var current=$('#lineEvaluationArea').empty().append(data).show().css('top',e.pageY).css('left',e.pageX);

						setPersonalStarScore(current);
						reset(current,subjectCode);

					}
				})

			}
		},150)
	}).dblclick(function() {
		alert("double");
		dbclick = true;
		setTimeout(function(){
			dbclick = false
			var subjectCode = $(this).find("#subjectCode").val();
			$.ajax({
				type:"GET",
				url:"/registerSubject.baron",
				data:"subjectCode=" + subjectCode + "&timetableNo=" + 1,
				datatype:"xml",
				error:function() {
					alert('ajax failed');
				},
				success:function(data, status) {
					$("#cell0_0").empty().append(subjectCode);
				}
			});
		},500)
	});
}




//해당과목 메인별점 셋팅
function setMainStarScore(current){
	var mainStarScore = $(current).find('#main_star_area').attr('mainStarScore');
	$('input:hidden[name=main_star]').rating('select',parseInt(mainStarScore)-1).rating('readOnly',true); //고정별점

}


//각각 별점 셋팅
function setPersonalStarScore(current){
	
	var personalScore= $(current).find('#personalScore').attr('personalScore');
	alert(personalScore);
	$('input:hidden[name=saved_star0]').rating('select',parseInt(personalScore)-1).rating('readOnly',true); //고정별점
}


//해당과목에 한줄평가가 하나도 없을 경우
function isEmptyComment(current){
	if(	$(current).find('td#delete').attr('index')==null){
		$(current).find('tr#other_evaluation').html("입력 된 한줄평가가 없습니다.").css('line-height','150px').css('text-align','center');
	}
}


//새 댓글 등록 이벤트
function addComment(commentData,subjectCode) {
	$(commentData).find('form').submit(function(){ //엔터 했을 경우	
		var comment=$(input).val();
		var star_Score=$(commentData).find('input:hidden[name=personal_star]:checked').val();

		$.ajax({
			type:"GET",
			url:"/addLineEvaluation.baron",
			data:"comment=" + comment+"&subjectCode="+subjectCode+"&star_Score="+star_Score ,
			datatype:"xml",
			error:function() {
				alert('ajax failed');
			},
			success:
				function(data, status) {
				var current=$('#lineEvaluationArea').empty().append(data).show();
				reset(current,subjectCode);
			}
		});
		return false;
	});
}


//댓글 삭제 이벤트
function deleteComment(commentData,subjectCode){
	$(commentData).find('td#delete').each(function(index){
		$(this).click(function(){
			var indexNo=$(this).attr('index');		

			$.ajax({
				type:"GET",
				url:"/deleteLineEvaluation.baron",
				data:"subjectCode="+subjectCode+"&indexNo="+indexNo,
				datatype:"xml",
				error:function() {
					alert('ajax failed');
				},
				success:
					function(data, status) {
					var current=$('#lineEvaluationArea').empty().append(data).show();
					reset(current,subjectCode);
				}
			});

		});
	});
}


//댓글창 닫기 이벤트
function closeEvaluation(commentData){
	$(commentData).find($('#close')).click(function(){
		$(commentData).empty().css('display','none');
	});
}


//이벤트 리셋
function reset(current,subjectCode){
	setMainStarScore(current);
	isEmptyComment(current);
	addComment(current,subjectCode); 
	deleteComment(current,subjectCode);
	closeEvaluation(current);
}
