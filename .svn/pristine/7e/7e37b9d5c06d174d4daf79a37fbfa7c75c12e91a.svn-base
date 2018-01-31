<%@ page language="java" pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/base/headhtml.jsp" flush="true"/>

<link href="assets/global/plugins/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
<link href="assets/global/plugins/dropzone/basic.min.css" rel="stylesheet" type="text/css" />

<jsp:include page="/WEB-INF/base/header.jsp" flush="true"/>

<div class="page-wrapper-row full-height">
    <div class="page-wrapper-middle">
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN PAGE CONTENT BODY -->
                <div class="page-content">
                    <div class="container">
                        <!-- BEGIN PAGE BREADCRUMBS -->
                        <ul class="page-breadcrumb breadcrumb">
                            <li>
                                <a href="jsp/nav_uploadfile.jsp">上传文献</a>
                            </li>
                        </ul>
                        <!-- END PAGE BREADCRUMBS -->
                        <!-- BEGIN PAGE CONTENT INNER -->
                        <div class="page-content-inner">
                            <div class="mt-content-body">
                                <div class="row">
	                                <div class="col-md-12 col-sm-12">
		                                <div class="portlet light ">
		                                    <div class="portlet-body">
		                                    	<!-- BEGIN PAGE CONTENT INNER -->
			                                    <div class="page-content-inner">
			                                        <div class="row">
			                                            <form action="personal/uploadSubmit" class="dropzone dropzone-file-area" id="my-dropzone" style="width: 500px;" target="fileUpload">
			                                                <h3 class="sbold">Drop files here or click to upload</h3>
			                                            </form>
			                                        </div>
			                                    </div>
			                                    <!-- END PAGE CONTENT INNER -->
		                                    </div>
	                                    </div>
	                                </div>
	                            </div>
                            </div>
                        </div>
                        <!-- END PAGE CONTENT INNER -->
                        <div class="row" id="showDetailDiv" style="display:none">
                        	<div class="col-md-7 col-sm-7">
                                <div class="portlet light ">
                                    <div class="portlet-title">
                                        <div class="caption caption-md">
                                            <i class="icon-bar-chart font-dark hide"></i>
                                            <span class="caption-subject font-green-steel bold uppercase">文献预览</span>
                                        </div>
                                    </div>
                                    <div class="portlet-body" style="height:680px;padding-top:0;">
                                        <div class="row number-stats margin-bottom-30" style="margin:0;">
                                        	<a id="pdfPreview" class="pdf" href=""></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 col-sm-5">
                                <div class="portlet light ">
                                    <div class="portlet-title">
                                        <div class="caption caption-md">
                                            <i class="icon-bar-chart font-dark hide"></i>
                                            <span class="caption-subject font-green-steel bold uppercase">文献信息修改</span>
                                        </div>
                                        <div class="actions">
                                            <div class="btn-group btn-group-devided" data-toggle="buttons">
                                                <button class="btn btn-sm btn-success" id="detailSubmit">提交</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="portlet-body form" id="editDtail" style="height:680px;padding:0;">
                                        <form role="form" id="editForm">
                                            <div class="form-body" style="padding:0;">
                                            	<input id="path" name="path" type="hidden">
                                                <div class="form-group">
                                                    <label>Title<font style="color:red">*</font></label>
                                                    <div class="">
                                                        <input type="text" id="title" name="ptitle" class="form-control" placeholder="title"></div>
                                                </div>
                                                <div class="form-group">
                                                    <label>DOI</label>
                                                    <div class="">
                                                        <input type="text" id="doi" name="doi" class="form-control" placeholder="DOI"></div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Authors<font style="color:red">*</font></label>
                                                    <div class="">
                                                        <input type="text" id="authors" name="authors" class="form-control" placeholder="authors"> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Authors Address</label>
                                                    <div class="">
                                                        <input type="text" id="addr" name="addr" class="form-control" id="exampleInputPassword1" placeholder="address">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Publish</label>
                                                    <div class="">
                                                        <input type="text" id="publish" name="publish" class="form-control" placeholder="publish"> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Publish Date</label>
                                                    <div class="">
                                                        <input type="text" id="publishdate" name="publishdate"  class="form-control" placeholder="date"> </div>
                                                </div>
                                                <div class="form-group">
                                                    <label>Abstract<font style="color:red">*</font></label>
                                                    <div class="">
                                                         <textarea id="abstract" name="pabstract" class="form-control" rows="6"></textarea>
                                                	</div>
                                            	</div>
                                            	<div class="form-group">
                                                    <label>Category</label>
                                                    <div class="">
                                                         <select id="category" class="form-control" name="cid">
                                                         	<option value="0">请选择分类</option>
                                                         </select>
                                                	</div>
                                            	</div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
                <!-- END PAGE CONTENT BODY -->
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END CONTAINER -->
    </div>
</div>
 <script src="assets/global/plugins/dropzone/dropzone.min.js" type="text/javascript"></script>
 <script src="assets/pages/scripts/form-dropzone.js" type="text/javascript"></script>
 <script src="./srjs/jquery.media.js" type="text/javascript"></script>
 <script src="./srjs/category.js" type="text/javascript"></script>
<jsp:include page="/WEB-INF/base/footer.jsp" flush="true"/>

<script type="text/javascript">    


$("#detailSubmit").on("click",function(){
	var data = $("#editForm").serializeArray();
	var o={};
	$.each(data,function(){
		if(this.name=="cid"){
			o[this.name]=Number(this.value);
		}else
			o[this.name]=this.value;
	});
	if(o.ptitle!=''&&o.authors!=''&&o.pabstract!=''){
		o.unique_title = (o.ptitle+o.authors).replace(/[\ |\~|\`|\!|\@|\#|\$|\%|\^|\&|\*|\(|\)|\-|\_|\+|\=|\||\\|\[|\]|\{|\}|\;|\:|\"|\'|\,|\<|\.|\>|\/|\?|\s]/g,"");
		console.log(o.unique_title);
		console.log("form",o);
		$.ajax({
			url:"personal/saveArticle",
			type:"post",
			data:{article:JSON.stringify(o)},
			success: function(data){
				if(data){
					alert("上传成功");
					location.reload();
				}else{
					alert("文献库中已有该文献，若想继续上传，请修改文章标题")
				}
			},
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert("上传失败");
			}
		});
	}
});
</script>

<jsp:include page="/WEB-INF/base/tailhtml.jsp" flush="true"/>
