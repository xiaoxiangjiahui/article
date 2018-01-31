var FormDropzone = function () {
    return {
        //main function to initiate the module
        init: function () {  

            Dropzone.options.myDropzone = {
                dictDefaultMessage: "",
                paramName:"file_upload",
                acceptedFiles:".pdf",
                uploadMultipl:false,
                url:"personal/uploadSubmit",
                init: function() {
                    this.on("addedfile", function(file) {
                        // Create the remove button
                        var removeButton = Dropzone.createElement("<a href='javascript:;'' class='btn red btn-sm btn-block'>移除</a>");
                        
                        // Capture the Dropzone instance as closure.
                        var _this = this;

                        // Listen to the click event
                        removeButton.addEventListener("click", function(e) {
                          // Make sure the button click doesn't submit the form:
                          e.preventDefault();
                          e.stopPropagation();

                          // Remove the file preview.
                          _this.removeFile(file);
                          // If you want to the delete the file on the server as well,
                          // you can do the AJAX request here.
                          var path = $("#path").val();
                          console.log(path);
                          $.ajax({
                      		url: "personal/removeArticle",
                      		type: 'POST',
                      		data:{path:path},
                      		success: function(data){
                      			console.log(data);
                      			if(data){
                      				alert("移除成功");
                      				location.reload();
                      			}else{
                      				alert("移除失败");
                      				location.reload();
                      			}
                      		}
                      	  })
                        });

                        // Add the button to the file preview element.
                        file.previewElement.appendChild(removeButton);
                    });
                    this.on("success",function(file,data){
                    	$("#pdfPreview").attr("href","/file/"+data.path);
                    	console.log($("#pdfPreview").attr("href"));
                    	$('a.pdf').media({height:600});    
                    	$("#showDetailDiv").show();
                    	$("#path").val(data.path);
                    	$("#title").val(data.ptitle);
                    	$("#doi").val(data.doi);
                    	$("#abstract").val(data.pabstract);
                    	$("#authors").val(data.authors);
                    	$("#addr").val(data.addr);
                    	$("#publish").val(data.publish);
                    	$("#publishdate").val(data.publishdate);
                    	console.log(data);
                    });
                } 
            }
        }
    };
}();

jQuery(document).ready(function() {    
   FormDropzone.init();
});