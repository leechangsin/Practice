$('#search_subject').click(function(){
//	$.ajax({
//		type:"GET",
//		url:"/search_subject",
//		datatype:"xml",
//		error:function(){
//			alert('ajaxt failed');
//		},
//		success:function(data,status){
//			$('#subjectArea').empty().append(data);
//		}
//	});
	
	alert();
	
	
})

$('#write').click(function(){
	$.ajax({
		type:"GET",							// GET or POST
		url:"/writeBoard",						// URL
		datatype:"xml",						// html, xml, json, jsonp, script, text
		data:{keyword:$('#content').val()},			// parameters as plain object
		error:function() {						// Ajax error handler
			alert('ajax failed');
		},
		success:function(data, status) {	// Ajax complete handelr
			$('#boardResultArea').fadeOut();
			$('#boardResultArea').empty().append(data);
		}
	});
})