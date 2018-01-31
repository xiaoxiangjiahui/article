<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="/WEB-INF/base/headhtml.jsp" flush="true"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/base/header.jsp" flush="true"/>
<link href="./assets/global/plugins/icheck/skins/all.css" rel="stylesheet" type="text/css" />
<link href="./assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="./assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="./srcss/jquery.raty.css" rel="stylesheet"/>
<link href="./assets/pages/css/search.min.css" rel="stylesheet" type="text/css" />
<style>
    #center {
        height: 200px;
        width: 73%;
        margin: auto;
        position: absolute;
        top: 0;
        left: 0;
        bottom: 0;
        right: 0;
    }
   
</style>

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
                                <a href="personal/userinfo">个人信息</a>
                                <i class="fa fa-circle"></i>
                            </li>
                        </ul>
                        <!-- END PAGE BREADCRUMBS -->
                        <!-- BEGIN PAGE CONTENT INNER -->
                            <div class="mt-content-body">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12" style="padding-right: 0;">
                                        <div class="portlet light ">
                                            <div class="portlet-title">
                                                 <div class="caption caption-md">
                                                    <label class="btn btn-noborder btn-lg" style="padding:0;">个人信息</label>
                                                </div>
		                                        <div class="actions">
		                                            <div class="btn-group btn-group-devided" data-toggle="buttons">
		                                                <button class="btn btn-sm" id="userBtn">个人信息</button>
		                                                <button class="btn btn-sm" id="passwdBtn">修改密码</button>
		                                            </div>
		                                        </div> 
                                            </div>
                                           	<div class="portlet-body form" id="editDetail">
                                                <form role="form" id="editForm">
		                                            <div class="form-horizontal">
		                                                <div class="form-group">
		                                                    <label class="col-md-2 control-label">账号</label>
		                                                    <div class="col-md-4">
		                                                        <input type="text" id="account" name="account" class="form-control" value="${user.account}" readOnly></div>
		                                                </div>
		                                                <div class="form-group">
		                                                    <label class="col-md-2 control-label">用户名<font style="color:red">*</font></label>
		                                                    <div class="col-md-4">
		                                                        <input type="text" id="username" name="username" class="form-control" value="${user.username}"> </div>
		                                                </div>
		                                                <div class="form-group">
		                                                    <label class="col-md-2 control-label">邮箱<font style="color:red">*</font></label>
		                                                    <div class="col-md-4">
		                                                        <input type="text" id="email" name="email" class="form-control"  value="${user.email}">
		                                                    </div>
		                                                </div>
		                                                <div class="form-group">
		                                                    <label class="col-md-2 control-label"></label>
		                                                    <div class="col-md-4">
		                                                        <button type="button" class="btn btn-sm" id="editBtn">提交</button>
		                                                    </div>
		                                                </div>
		                                            </div>
		                                        </form>
		                                        <form id="editpasswd" style="display:none;">
		                                        	<div class="form-horizontal">
		                                        		<div class="form-group">
		                                                    <label class="col-md-2 control-label">原密码</label>
		                                                    <div class="col-md-4">
		                                                        <input type="password" id="oldpasswd" name="oldpasswd" class="form-control"></div>
	                                                	</div>
	                                                	<div class="form-group">
		                                                    <label class="col-md-2 control-label">新密码</label>
		                                                    <div class="col-md-4">
		                                                        <input type="password" id="newpasswd" name="newpasswd" class="form-control"></div>
	                                                	</div>
	                                                	<div class="form-group">
		                                                    <label class="col-md-2 control-label">确认密码</label>
		                                                    <div class="col-md-4">
		                                                        <input type="password" id="rpasswd" name="rpasswd" class="form-control"></div>
	                                                	</div>
	                                                	<div class="form-group">
		                                                    <label class="col-md-2 control-label"></label>
		                                                    <div class="col-md-4">
		                                                        <button type="button" class="btn btn-sm" id="submitBtn">提交</button>		                                                    </div>
	                                                	</div>
		                                   	    	</div>
		                                        </form>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                             </div>
                        </div>
                        <!-- END PAGE CONTENT INNER -->
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
<jsp:include page="/WEB-INF/base/footer.jsp" flush="true"/>
<script src="srjs/md5.min.js" type="text/javascript"></script>
<script>
	//修改信息
	$("#editBtn").on("click",function(){
		var data = $("#editForm").serializeArray();
    	var o={};
    	$.each(data,function(){
    		o[this.name]=this.value;
    	});
    	console.log("form",o);
    	if(o.email!=''&&o.username!=''){
    		$.ajax({
    			url:"personal/editUser",
    			type:"POST",
    			data:{user:JSON.stringify(o)},
    			success: function(data){
    				if(data.rel){
    					alert("修改成功");
    					location.reload();
    				}else
    					alert("修改失败");
    			},
    			error: function(XMLHttpRequest, textStatus, errorThrown){     
	           	 	alert("修改失败");
	           }
    		});
    	}else{
    		alert("缺少必要参数");
    	} 
	});
	$("#passwdBtn").on("click",function(){
		$("#editForm").hide();
		$("#editpasswd").show();
		
	});
	$("#userBtn").on("click",function(){
		$("#editpasswd").hide();
		$("#editForm").show();
	});
	
	$("#submitBtn").on("click",function(){
		var oldpasswd = $("#oldpasswd").val();
		var newpasswd = $("#newpasswd").val();
		var rpasswd = $("#rpasswd").val();
		console.log("${user.passwd}");
		if(md5(oldpasswd) != "${user.passwd}"){
			alert("原密码错误，请重新输入");
			return;
		}
		if(newpasswd != rpasswd){
			alert("新密码和确认密码不一致，请重新输入");
			return;
		}
		if(newpasswd!=""&&rpasswd!=""){
			$.ajax({
    			url:"personal/editPasswd",
    			type:"POST",
    			data:{passwd:md5(newpasswd)},
    			success: function(data){
    				if(data.rel){
    					alert("修改成功");
    					location.href="login";
    				}else
    					alert("修改失败");
    			},
    			error: function(XMLHttpRequest, textStatus, errorThrown){     
	           	 	alert("修改失败");
	           }
    		});
		}else{
			alert("缺少必要参数");
		}
	});
</script>
<jsp:include page="/WEB-INF/base/tailhtml.jsp" flush="true"/>
