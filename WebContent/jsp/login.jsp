<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
   <base href="<%=basePath%>"> 
    <meta charset="utf-8" />
    <title>文献</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="article"
        name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->


    <body class=" login">
        <!-- BEGIN LOGO -->
        <div class="logo">
            <a href="#">
                <img src="" alt="" /> </a>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <div class="login-form">
                <h3 class="form-title font-green">Sign In</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span> Enter any username and password. </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">Account</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" id="laccount" autocomplete="off" placeholder="Account" name="account"
                    /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Password</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" id="lpasswd" autocomplete="off" placeholder="Password"
                        name="password" /> </div>
                <div class="form-actions">
                    <button type="submit" id="loginbtn" class="btn green uppercase" style="text-align: center">Login</button>

                </div>

                <div class="create-account">
                    <p>
                        <a href="javascript:;" id="register-btn" class="uppercase">Create an account</a>
                    </p>
                </div>
            </div>
            <!-- END LOGIN FORM -->
            <!-- BEGIN FORGOT PASSWORD FORM -->

            <!-- END FORGOT PASSWORD FORM -->
            <!-- BEGIN REGISTRATION FORM -->
            <form class="register-form" id="register-form" >
                <h3 class="font-green">Sign Up</h3>
                <p class="hint"> Enter your personal details below: </p>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">Username</label>
                    <input class="form-control placeholder-no-fix" type="text" placeholder="Username" id="username" name="username"/>
                </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9"></label>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="account" name="account" />                    </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Password</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" id="register_password" placeholder="Password"
                        name="passwd" /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Re-type Your Password</label>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="Re-type Your Password" name="rpasswd"
                    /> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Email</label>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"
                    /> </div>
				<div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">Role</label>
                    <select id="category" class="form-control" name="role">
                    	<option value="">Choose an identity</option>
                    	<option value="1">学生</option>
                    	<option value="2">老师</option>
                    </select>
                </div>
                <div class="form-actions">
                    <button type="button" id="register-back-btn" class="btn green btn-outline">Back</button>
                    <button type="button" id="register-submit-btn" class="btn btn-success uppercase pull-right">Submit</button>
                </div>
            </form>
            <!-- END REGISTRATION FORM -->
        </div>
        <div class="copyright"> 2017 ©CSU. </div>
        <!--[if lt IE 9]>
<script src="../assets/global/plugins/respond.min.js"></script>
<script src="../assets/global/plugins/excanvas.min.js"></script> 
<script src="../assets/global/plugins/ie8.fix.min.js"></script> 
<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
      
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/pages/scripts/login.min.js" type="text/javascript"></script>
        <script src="srjs/md5.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <!-- END THEME LAYOUT SCRIPTS -->
        
        <script type="text/javascript">
	       	
        	$("#loginbtn").on("click",function(){
        		var account=$("#laccount").val();
        		var passwd=$("#lpasswd").val();
        		if(username=="" || passwd==""){
        			alert("用户名或密码为空");
        			return;
        		}
        		passwd = md5(passwd);
        		//alert(md5(passwd));
        		$.ajax({
        			url:"loginSubmit",
        			type:"POST",
        			data:{account:account,passwd:passwd},
        			success: function(data){
	    				 if(data.rel){
	    					 location.href="personal/index";
	    				 }else{
	    					 alert("用户名或密码错误");
	    				 }
	    			},
	    			error: function(XMLHttpRequest, textStatus, errorThrown){     
		           	 	alert("服务器错误");
		           }
        		});
        	});
        	$('#register-submit-btn').on("click",function(){
        		var data = $("#register-form").serializeArray();
     	    	var o={};
     	    	$.each(data,function(){
     	    		o[this.name]=this.value;
     	    	});
     	    	for(var k in o){
     	    		if(o[k]==""||o[k]== null){
     	    			alert("缺少必要的参数，请补充");
     	    			return;
     	    		}
     	    	}
     	    	if(o.passwd != o.rpasswd){
     	    		alert("两次密码不一致，请重新输入");
     	    		return;
     	    	}
     	    	o.passwd=md5(o.passwd);
     	    	delete o.rpasswd;
     	    	o.role=parseInt(o.role);
     	    	console.log("user",JSON.stringify(o));
        		$.ajax({
        			url:"registerSubmit",
        			type:"POST",
        			data:{user:JSON.stringify(o)},
        			success: function(data){
	    				 if(data.rel=="exist"){
	    					 alert("该用户名已存在");
	    				 }else{
	    					 alert("注册成功，请登录");
	    					 location.reload();
	    				 }
	    			},
	    			error: function(XMLHttpRequest, textStatus, errorThrown){     
		           	 	alert("注册失败");
		           }
        		});
        	})
        </script>
    </body>

</html>