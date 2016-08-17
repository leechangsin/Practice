$(document).ready(function() {
	$(".bookmark_button").click(function() {
		$.ajax({
			type:"GET",							// GET or POST
			url:"/getList.baron",			// URL
			datatype:"xml",						// html, xml, json, jsonp, script, text
			timeout:10000,
			error:function() {					// Ajax error handler
				alert('ajax failed');
			},
			success:function(data, status) {	// Ajax complete handelr
				$('.listArea').empty().append(data).find('div').each(function(index) {
					$(this).click(function(e) {		
						var subjectCode = $(this).find('#subjectCode').val();
						$.ajax({
							type:"GET",							// GET or POST
							url:"/getLineEvaluation.baron",			// URL
							data:"subjectCode=" + subjectCode,
							datatype:"xml",
							timeout:10000,
							error:function() {					// Ajax error handler
								alert('ajax failed');
							},
							success:function(data, status) {
								$('#lineEvaluationArea').empty().append(data).show().css('top',e.pageX).css('left',e.pageY);		// 댓글창 뜨기 

							}
						});
					})

				})
			}
		});
	});

	$("#btnSearch").click(function(){
		searchSubject();
	});
	
	$("#searchBox").keydown(function(event) {
		if ( event.which == 13 ) {		//enter 누를 때
			event.preventDefault();
			searchSubject();
		}
	});
	
	//compus 선택
	/*$(".CampusSort").click(function(event) {
		$.ajax({
			type:"GET",
			url:"/getSearchResult.baron",
			data:"searchType=" + $('#CampusSort').val(),
			error:function() {
				alert('ajax failed');
			},
			success:function(data, status){
				
			}
		});
	});*/
	
	/*$.ajax({
	type:"GET",							// GET or POST
	url:"/getSearchResult.baron",				// 호출할 URL
	data:"searchType=" + $('#selectSearch').val()+"&searchKey=" + $('#searchBox').val(),
	error:function() {					// Ajax error handler
		alert('ajax failed');
	},
	success:function(data, status) {	// Ajax complete handelr
		$('.listArea').empty().append(data);
	}
});	*/
	
	$("#departmentList").click(function(event){
		
	});
	
	/*
	 * 교양 - 교양필수, 교양선택
	 * 교직 - 교직
	 * 일선 - 일선
	 * 전공 - 전공기초, 전공필수, 전공선택, 기초과학
	 * 군사학 - 군사학
	 */
	$("#departmentList").change(function(){
		$("#completionDivision").empty();
		$("#completionDivision").append("<option value=select id=select>선택</option>");
		if($("#departmentList option:selected").val() == "liberalArts"){
			//교양
			$("#completionDivision").append("<option value=liberalEssential id=liberalEssential>교양필수</option>");
			$("#completionDivision").append("<option value=liberalSelect id=liberalSelect>교양선택</option>");
		}else if($("#departmentList option:selected").val() == "department"){
			//전공 - 기초과학, 전공기초, 전공필수, 전공선택
			$("#completionDivision").append("<option value=basicScience id=basicScience>기초과학</option>");
			$("#completionDivision").append("<option value=basicMajor id=basicMajor>전공기초</option>");
			$("#completionDivision").append("<option value=requiredMajor id=requiredMajor>전공필수</option>");
			$("#completionDivision").append("<option value=choosedMajor id=choosedMajor>전공선택</option>");
		}else if($("#departmentList option:selected").val() == "teachingCourse"){
			//교직 - 교직
			$("#completionDivision").append("<option value=teachingSelect id=teachingSelect>교직</option>");
		}else if($("#departmentList option:selected").val() == "generalCourse"){
			//일선 - 일반선택
			$("#completionDivision").append("<option value=teachingSelect id=teachingSelect>교직</option>");
		}else if($("#departmentList option:selected").val() == "militaryCourse"){
			//군사학 - 군사학
			$("#completionDivision").append("<option value=militarySelect id=militarySelect>군사학</option>");
		}else if($("#departmentList option:selected").val() == "subjectAll"){
			//전체선택
			$("#completionDivision").append("<option value=liberalEssential id=liberalEssential>교양필수</option>");
			$("#completionDivision").append("<option value=liberalSelect id=liberalSelect>교양선택</option>");
			$("#completionDivision").append("<option value=basicScience id=basicScience>기초과학</option>");
			$("#completionDivision").append("<option value=basicMajor id=basicMajor>전공기초</option>");
			$("#completionDivision").append("<option value=requiredMajor id=requiredMajor>전공필수</option>");
			$("#completionDivision").append("<option value=choosedMajor id=choosedMajor>전공선택</option>");
			$("#completionDivision").append("<option value=teachingSelect id=teachingSelect>교직</option>");
			$("#completionDivision").append("<option value=teachingSelect id=teachingSelect>교직</option>");
			$("#completionDivision").append("<option value=militarySelect id=militarySelect>군사학</option>");
		}else{
			//그외에는 반응 안함
		}
		searchSubject();
	});
	
	//초기화버튼
	$("#btnReset").click(function() {

	});
});

function addOptions(){
	
}

function searchSubject() {
	$.ajax({
		type:"GET",							// GET or POST
		url:"/getSearchResult.baron",				// 호출할 URL
		data:"searchType=" + $('#selectSearch').val()+"&searchKey=" + $('#searchBox').val() +"&department=" +$('#departmentList option:selected').text(),
		error:function() {					// Ajax error handler
			alert('ajax failed search');
		},
		success:function(data, status) {	// Ajax complete handelr
			$('.listArea').empty().append(data).find('tr').each(function(index) {
				setEventSubject($(this));

			})
		}
	});
}


