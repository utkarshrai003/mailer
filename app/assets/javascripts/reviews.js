
/*
// application/x-www-form-urlencoded format 

$(document).ready(function(){
	$('#new_review').submit(function(e){
		var data = $(this).serialize();
		console.log(data);
		$.ajax({
			url: '/reviews',
			data: data,
			type: 'POST',
			dataType: 'json' ,
			contentType: 'application/x-www-form-urlencoded' , 
			success: function(data)
			{
				console.log(data);
			}
		});
	    e.preventDefault();
		return false;
	});
});
*/

// multipart/form-data format

$(document).ready(function(){
	$('#new_review').submit(function(e){
		var data = new FormData($(this)[0]);
		data = data.serialize();
		console.log(data);
		$.ajax({
			url: '/reviews',
			data: data ,
			type: 'POST',
			dataType: 'json' ,
			contentType: 'multipart/form-data' , 
			success: function(data)
			{
				console.log(data);
			}
		});
	    e.preventDefault();
		return false;
	});
});
/*
// json format

$(document).ready(function(){
	$('#new_review').submit(function(e){
		var data;
		data = {review: {
						name: $('#review_name').val(),
						review: $('#review_review').val(),
						product: $('#review_product').val() 
					}
				}

		console.log(data);
		$.ajax({
			url: '/reviews',
			data: JSON.stringify(data) , 
			type: 'POST',
			dataType: 'json' ,
		    contentType: 'application/json' , 
			success: function(data)
			{
				console.log(data);
			}
		});
	    e.preventDefault();
		return false;
	});
});
*/