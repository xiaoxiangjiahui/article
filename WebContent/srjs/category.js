$(function(){
	$.ajax({
		url:"personal/getCategory",
		success: function(data){
			var categoryHtml = "";
			for(var i=0;i<data.length;i++){
				categoryHtml += "<option value="+data[i].cid+">"+data[i].cname+"</option>";
			}
			//console.log(categoryHtml);
			$("#category").append(categoryHtml);
			if($("#categorySearch").length!=0){
				$("#categorySearch").append(categoryHtml);
			}
			
		}
	});
});
