<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>Metronic | The Ultimate Multi-purpose Bootstrap Admin Dashboard Theme | Theme #3 | Bootstrap Switch</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="paper" name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="../assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="../assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="../assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="../assets/layouts/layout3/css/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/layouts/layout3/css/themes/default.min.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="../assets/layouts/layout3/css/custom.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />

    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico" /> </head>
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

    p {
        padding: 0px;
        margin: 0px;
    }

    .authors {
        color: #2319DB;
    }

    hr {
        margin: 0px;
    }

    .check {
        width: 15px;
        height: 15px;
    }

    section {
        padding: 15px;
    }

    .document-title {
        font-size: 18px;
        line-height: 1.33333;
        font-weight: normal;
        padding-left: 10px;

        word-wrap: break-word;
        margin: 0;
        color: #555;
    }

    .document-authors {
        margin-bottom: 2px;
        padding-left: 10px;
        font-size: 13px;
        line-height: 1.23077;
        margin-top: 16px;
    }

    .document-source {
        margin-top: 16px;
        margin-bottom: 2px;
        padding-left: 10px;
        font-size: 13px;
        line-height: 1.23077;
        font-weight: bold;
        color: #555;
    }

    .document-type {
        font-size: 11px;
        padding-left: 10px;
        line-height: 1.45455;
        margin-bottom: 8px;
        color: #7e7e7e;
    }

    #wrap {
        position: relative;
        padding: 10px;
        overflow: hidden;
    }

    #gradient {
        width: 100%;
        height: 35px;
        background: url() repeat-x;
        position: absolute;
        bottom: 0;
        left: 0;
    }

    #read-more {
        padding: 5px;
        background: #fff;
        color: #333;
    }

    #read-more a {
        padding-right: 22px;
        background: url() no-repeat 100% 50%;
        font-weight: bold;
        text-decoration: none;
    }

    #read-more a:hover {
        color: #000;
    }

    textarea {
        border: 0;
        background-color: transparent;
        /*scrollbar-arrow-color:yellow;  
    scrollbar-base-color:lightsalmon;  
    overflow: hidden;*/
        color: #666464;
        height: auto;
    }

    .document-abstract {
        font-size: 13px;
        line-height: 1.47692;
        padding: 8px 0;
        word-wrap: break-word;
    }

    .document-info {
        padding: 8px 0 16px;
    }

    #edit {
        margin-top: 10px;
        margin-right: 3px;
    }

    #components {
        padding-right: 10px;
        min-height: 484px;
        background-color: white;
    }
</style>
<!-- END HEAD -->

<body class="page-container-bg-solid">
    <div class="page-wrapper">
        <div class="page-wrapper-row">
            <div class="page-wrapper-top">
                <!-- BEGIN HEADER -->
                <div class="page-header" style="height: 63px;">
                    <!-- BEGIN HEADER TOP -->
                    <div class="page-header-top">
                        <div class="container">
                            <div class="page-logo" style="margin-left: -140px;">
                                <a href="#">
                                        <img src="csuLogo (2).png" alt="logo" class="logo-default" style="margin-top:9px; ">
                                    </a>
                            </div>

                            <a href="javascript:;" class="menu-toggler"></a>

                            <!-- BEGIN TOP NAVIGATION MENU -->
                            <div class="top-menu">
                                <ul class="nav navbar-nav" style="font-size: 17px;">
                                    <li>
                                        <a href="personalLibrary">Library
                                </a>
                                    </li>
                                    <li>
                                        <a href="../group/showGroup">Group
                                </a>
                                    </li>
                                    <li>
                                        <a href="../public/publicLibrary">Public
                                </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;">PaperAssit
                                </a>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav pull-right" style="margin-left: 180px;">
                                    <li style="margin-top: 9px;margin-left: -10px;">
                                        <!--查询-->
                                        <form class="search-form" action="searchSubmit" method="POST">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search" name="keywords" id="queryItem" style="width:200px"">                                                                                                                                              
                                                	<input type="submit" value="Go" class="btn btn-primary">                                               
                                            </div>
                                        </form>
                                    </li>

                                    <!-- BEGIN USER LOGIN DROPDOWN -->
                                    <li class="dropdown dropdown-user dropdown-dark">
                                        <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                            <!--<img alt="" class="img-circle" src="../assets/layouts/layout3/img/avatar9.jpg">-->
                                            <span class="glyphicon glyphicon-user"></span> <span class="username username-hide-mobile">User</span>
                                        </a>
                                        <ul class="dropdown-menu dropdown-menu-default">
                                           <!--   <li>
                                                <a href="">
                                                        <i class="icon-user"></i> My Profile </a>
                                            </li>-->
                                            <li>
                                                <a href="../login">
                                                        <i class="icon-calendar"></i> login out </a>
                                            </li>

                                        </ul>
                                    </li>
                                    <!-- END USER LOGIN DROPDOWN -->

                                </ul>
                            </div>
                            <!-- END TOP NAVIGATION MENU -->
                        </div>
                    </div>
                    <!-- END HEADER TOP -->
                </div>
                <!-- END HEADER -->
            </div>
        </div>
        <div class="page-wrapper-row full-height">
            <div class="page-wrapper-middle">
                <!-- BEGIN CONTAINER -->
                <div class="page-container">
                    <!-- BEGIN CONTENT -->
                    <div class="page-content-wrapper">
                        <!-- BEGIN PAGE CONTENT BODY -->
                        <div class="page-content" style="margin-top:0px;">
                            <div class="row" style="height: 100%;">


                                <div class="col-md-8 col-sm-8 col-lg-8" style="height: 100%; padding-left: 40px;">
                                    <div class="portlet light" style="height: 100%;min-height:484px;">
                                        <div class="portlet-body" style="height: 100%;">
                                            <div class="row" style="height: 500px;">
                                                <!-- BEGIN TICKET LIST CONTENT -->
                                                <div class="app-ticket app-ticket-list">
                                                    <div class="portlet light ">
                                                        <div class="portlet-body">
                                                            <div class="table-toolbar">
                                                                <div class="row">
                                                                    <div class="btn-group" style="margin-left: 35px;">
                                                                        <input type="checkbox" id="allcheck" style="height:16px;width: 16px;" />
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button id="add" class="btn sbold green" data-toggle="modal" data-target="#myModal"> Add article
                                                                                        <i class="fa fa-plus"></i>
                                                                                     </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button id="delete" class="btn sbold green" onclick="deleteitem()"> Remove
                                                                                        <i class="fa fa-remove"></i>
                                                                                    </button>
                                                                    </div>
                                                                    <div class="btn-group">
                                                                        <button id="download" class="btn sbold green" onclick="download()">Download
                                                                                        <i class="fa fa-download"></i>s
                                                                                    </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%-- <% 
                                                               
                                                               List  article= (List)request.getAttribute(""); 
                                                            %> --%>
                                                                <table class="table  table-condensed" id="table_article">
                                                                    <c:forEach items="${articles}" var="result" varStatus="status">
                                                                        <tr id="${result.articleId}">
                                                                            <td><input type="hidden" name="titleid" value="${result.articleId}"/>
                                                                                <label class="col-sm-1 control-label">
                                                                                <input type="checkbox" class="check" name="check">
                                                                                </label>
                                                                            </td>
                                                                            <td>
                                                                                <div>
                                                                                    <h4 class="title" name="title">${result.title}</h4>
                                                                                    <p class="metadata" name="metadata">
                                                                                        <span class="authors" name="authors">${result.author}</span>                                                                                        in 2015 53rd Annual Allerton Conference
                                                                                        ${result.address}
                                                                                    </p>
                                                                                </div>
                                                                            </td>
                                                                        </tr>

                                                                         
                                                                    </c:forEach>
                                                                </table>


                                                                <!--文件上传模态框-->
                                                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                                    <div class="modal-dialog modal-lg" role="document">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                                <h4 class="modal-title">请选择文件上传</h4>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <form id="uploadForm" action="uploadSubmit" method="post" enctype="multipart/form-data">

                                                                                    <input type="file" name="file_upload" multiple="multiple"/>
                                                                                    <br/>
                                                                                    <input type="submit" class="btn btn-success" value="上传" />
                                                                                    <input type="button" class="btn btn-default" value="取消" data-dismiss="modal" />
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- END PROFILE CONTENT -->
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <!--右边布局-->
                                <div class="col-md-4 col-sm-4 col-lg-4" style="min-height:600px;padding-left:0px; ">
                                    <!--编辑文章信息的模态框-->
                                    <  class="modal fade" id="add_team" tabindex="-1" role="dialog" onclick="editInfo()">
                                        <div class="modal-dialog" style="margin:100px auto;">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">
                                                        <span>x</span>
                                                    </button>
                                                    <h3 class="modal-title">编辑文章信息</h3>
                                                </div>

                                                <div class="modal-body">
                                                    <form method="POST" id="add_team_form" class="form-horizontal">
                                                        <div class="form-group">

                                                            <input type="hidden" id="id" name="id">

                                                            <label for="title" class="col-sm-2 control-label">Title</label>
                                                            <div class="col-sm-10" style="margin-bottom: 3px">
                                                                <input id="edit_title" type="text" name="title" class="form-control">
                                                            </div>

                                                            <label for="author" class="col-sm-2 control-label">Author</label>
                                                            <div class="col-sm-10" style="margin-bottom: 3px">
                                                                <textarea id="edit_author" name="author" class="form-control"></textarea>
                                                            </div>

                                                            <label for="abstracts" class="col-sm-2 control-label">Abstract</label>
                                                            <div class="col-sm-10" style="margin-bottom: 3px;height: 350px; ">
                                                                <textarea id="edit_abstract" cols="30" ;rows="10" class="form-control" name="abstracts" style="height: 350px;"></textarea>
                                                            </div>

                                                            <label for="address" class="col-sm-2 control-label">address</label>
                                                            <div class="col-sm-10" style="margin-bottom: 3px">
                                                                <input id="edit_source" type="text" class="form-control" name="address">
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <div class="col-sm-3"></div>
                                                            <div class="col-sm-4">
                                                                <button type="submit" id="submit" class="btn btn-success">save</button>
                                                            </div>
                                                            <div class="col-sm-5">
                                                                <button type="button" class="btn btn-default" data-dismiss="modal">cancle</button>
                                                            </div>

                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--<div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">-->
                                    <div class="page-quick-sidebar">
                                        <ul class="nav nav-tabs">
                                            <li class="active">
                                                <a href="javascript:;" data-target="#quick_sidebar_tab_1" data-toggle="tab"> Details
                                            
                                        </a>
                                            </li>
                                            <li>
                                                <a href="javascript:;" data-target="#quick_sidebar_tab_2" data-toggle="tab"> Notes
                                        </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane active page-quick-sidebar-chat" id="quick_sidebar_tab_1">
                                                <div class="panel-components" id="components">
                                                    <div class="panel scrollable view">
                                                        <button class="btn-edit pull-right" id="edit_button" data-toggle="modal" data-target="#add_team">Edit  <span class="fa fa-edit"></span></button>
                                                        <div id="document-details-view" class="document-metadata-extended">

                                                            <!--右边栏的details的内容-->
                                                            <section class="document-info">
                                                                <h2 class="document-title">
                                                                	<!--  +result.title  -->
                                                                </h2>
                                                                <div class="document-authors">
                                                                    <!--  +result.author+  -->
                                                                </div>
                                                                <div class="document-source"> 
                                                                	<!--  +result.source+  -->
                                                                </div>
                                                            </section>
                                                            <!--new-->

                                                            <div class="document-abstract document-abstract-expandable">
                                                                <div class="document-abstract-content" id="wrap">
                                                                    <!--  +result.abstract+  -->
                                                                </div>
                                                                <div id="gradient"></div>
                                                                <div id="read-more"></div>

                                                            </div>
                                                            <!--new-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!--details-->
                                            <div class="tab-pane page-quick-sidebar-alerts" id="quick_sidebar_tab_2">
                                                <div class="page-quick-sidebar-alerts-list">
                                                    <div id="document-details-notes" data-rel="notes" class="panel scrollable notes">
                                                    <br>
                                                        <h4 class="document-title" data-id="b56fd64a-609a-377b-97fc-aa9c29a7213e">
                                                            please enter the userId,and separated by ";"
                                                        </h4>
                                                        <br><br>
                                                        <form role="form">
                                                        	&nbsp title:
                                                        	<center>
                                                        		<input type="text" id="recommendTitle" class="form-control" style="width:400px">
                                                        	</center>
                                                        	<input type="text" id="recommendId" style="display:none"><br><br>
                                                        	&nbsp userIds:
                                                        	<center>
                                                        		<!--  <input type="text" id="recommendUserIds"  style="width:400px;height:100px" class="form-control">-->
                                                        		<textarea rows="3" cols="3" class="form-control" style="width:400px" id="recommendUserIds"></textarea>
                                                        	</center>
                                                        	<br><br>
                                                        	<center>                                                     	
                                                        		<input type="button" value="submit" onclick="addRecommend()" class="btn btn-primary">
                                                        	</center>
                                                        	<br><br><br>
                                                        </form>
                                                        <!--new

                                                        <div class="pad-container">

                                                            <div class="pad" contenteditable="" style="min-height:435px; width:98%;margin-left:10px;box-sizing: border-box;border: 1px solid lightgrey">

                                                            </div>
                                                        </div>
                                                        new-->
                                                    </div>
                                                </div>
                                            </div>

                                            <!--note-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- BEGIN CORE PLUGINS -->
            <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
            <script src="..\assets\global\plugins\bootstrap-fileinput\bootstrap-fileinput.js" type="text/javascript"></script>

            <!-- END CORE PLUGINS -->
            <!-- BEGIN THEME GLOBAL SCRIPTS -->
            <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
            <!-- END THEME GLOBAL SCRIPTS -->
            <!-- BEGIN THEME LAYOUT SCRIPTS -->
            <script src="../assets/layouts/layout3/scripts/layout.min.js" type="text/javascript"></script>
            <script src="../assets/layouts/layout3/scripts/demo.min.js" type="text/javascript"></script>


            <script>
                                 
                //初始化
                $(function () {
                    
                    var slideHeight = 144; // px
                    var defHeight = $('#wrap').height();
                    if (defHeight >= slideHeight) {
                        $('#wrap').css('height', slideHeight + 'px');
                        $('#read-more').append('<a href="#">查看全部</a>');
                        $('#read-more a').click(function () {
                            var curHeight = $('#wrap').height() + 20;
                            console.log(curHeight);
                            if (curHeight == slideHeight) {
                                $('#wrap').animate({
                                    height: defHeight + 20
                                }, "normal");
                                $('#read-more a').html('隐藏');
                                $('#gradient').fadeOut();
                            } else {
                                $('#wrap').animate({
                                    height: slideHeight
                                }, "normal");
                                $('#read-more a').html('查看全部');
                                $('#gradient').fadeIn();
                            }
                            return false;
                        });
                    }

                });
                
                function init(){
                	   $('input[name="edit_title"]').val("${article.title}");
                	   $('textarea[name="edit_author"]').val("${article.author}");
                	   $('textarea[name="edit_abstract"]').val("${article.abstracts}");
                	   $('input[name="edit_source"]').val("${article.address}");
                }

                //全选，反选
                $("#allcheck").click(function () {
                    if (this.checked) {
                        $("#table_article  :checkbox").prop("checked", this.checked);
                    } else {
                        $("#table_article  :checkbox").removeProp("checked", this.checked);
                    }
                });

                //删除操作
                function deleteitem() {
                	 var selectedData=[];  
                	
                    $("input[name='check']:checked").each(function () { // 遍历选中的checkbox
                      
                    	// page delete
                    	n = $(this).parents("tr").index(); // 获取checkbox所在行的顺序
                        $("table#table_article").find("tr:eq(" + n + ")").remove();
                    	
                      	// deal with data
                        var tablerow = $(this).parents("tr");
                        var id = tablerow.find("[name='titleid']").val();
                        selectedData.push(id);
                        
                        //window.self.location = "deleteUser?info=" + selectedData;  
                     });
                    
                    console.log(selectedData);
                    
                    $.ajax({
                        url: "personalDeleteSubmit",
                        type: 'POST',
                        data:{selectedData:selectedData},
                        async: false,
                        dataType:"json",
                        success: function () {
                            alert("success delete");
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown){
                        	
                        	 //alert(XMLHttpRequest.status);
                        	 //alert(XMLHttpRequest.readyState);
                        	 //alert(textStatus);
                        }
                    });
                   // alert(selectedData);
                   // alert(typeof(selectedData));
                }

                //下载文章          
                function download() {
                	var selectedData=[];
                    $("input[name='check']:checked").each(function () { // 遍历选中的checkbox
                    	
                        var tablerow = $(this).parents("tr");
                        var code = tablerow.find("[name='titleid']").val();

                        selectedData.push(code);
                    });
                    console.log(selectedData);
                    $.ajax({
                        url: "downloadArticles",
                        type: 'POST',
                        data: {selectedData:selectedData},
                        async: false,
                        success: function (e) {
                            alert("success download");
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown){                        	
                       	 	alert(XMLHttpRequest.status);
                       	    alert(XMLHttpRequest.readyState);
                       	 	alert(textStatus);
                       }
                    });
                }


                //判断单个复选框是否被选中以及选中的值
             /*    if ($("#check_xx").is(":checked")) { //选中  
                    alert($("#id").val()); //打印选中的值  
                } */


                //点击tr获取id
                $("#table_article tr").click( function () {
                    var article_id;
                    article_id = $(this).attr("id");
                    console.log(article_id);
                    $.ajax({
                        url: "showDetails",
                        type: 'POST',
                        async: true,
                        data: {article_id:article_id},
                        success: function (result) {
                        	//alert(result.abstracts);
                     		//alert(result.title);
                     		//alert(result.address);
                            if (result == undefined || result.length == 0) {
                            	$("#components").children().remove();
                                $("#components").append("文章无返回结果");
                                
                            } else {
                            	//详细信息展示
                            	$("#components").children().remove();
                                $("#components").append(
                                    '<div class="panel scrollable view">' +
                                    '<button class="btn-edit pull-right"  id="edit"  data-toggle="modal" data-target="#add_team">Edit  <span class="fa fa-edit"></span></button>' +
                                    '<div id="document-details-view"  class="document-metadata-extended">' +
                                    '<section class="document-info">' +
                                   
                                    '<h2 class="document-title">' + result.title + '</h2>' +
                                    '<div class="document-authors">' +
                                    result.author +
                                    '</div>' 
                                    +'<div class="document-source">' + result.address + '</div>' 
                                    +'</section>' 
                                    //+'<div id="wrap">'+result.abstracts+'</div>'
                                    
                                    +'<div class="document-abstract document-abstract-expandable">'
                                    +'<div class="document-abstract-content" id="wrap">' 
                                    +result.abstracts 
                                    +'</div>' 
                                    +'<div id="gradient"></div>' 
                                    +'<div id="read-more"></div>' 
                                    +'</div>' 
                                    +'</div>' 
                                    +'</div>'
                                )
                                //文本框填充
                                $("#edit_title").val(result.title);
                                $('#edit_author').val(result.author);
                                $('#edit_abstract').val(result.abstracts);
                                $('#edit_source').val(result.address);
                                //文献推荐
                                $("#recommendTitle").val(result.title);
                                $("#recommendId").val(result.articleId);
                            }
                        }
                    });                   
                })
                	                               	
                    $('#submit').click(function () {
                    	var article_id;
                        article_id = $("#table_article tr").attr("id");
                        $.ajax({
                            url: "editDetails",
                            type: "POST",
                            cache: false,
                            data: {
		                            articleId: article_id,
		                                title: $("#edit_title").val(),
		                               author: $('#edit_author').val(),
		                            abstracts: $('#edit_abstract').val(),
		                              address: $('#edit_source').val()
                            },
                            success: function () {
                                alert("编辑成功");

                            },
                            error: function(XMLHttpRequest, textStatus, errorThrown){                        	
                           	 	alert(XMLHttpRequest.status);
                           	    alert(XMLHttpRequest.readyState);
                           	 	alert(textStatus);
                           }
                        });
                    });

			function searchArticle(){
				var queryItem = $('#queryItem').val();
				//alert(queryItem);
				$.ajax({
					url:"searchSubmit",
					data:{keywords:queryItem},
					type:"post",
					success:function(){
						
					}
				});
			}
            
			function addRecommend(){
				var userIds = $("#recommendUserIds").val();
				var articleId = $("#recommendId").val();
				$.ajax({
					url:"recommendArticle",
					data:{userIds:userIds,articleId:articleId},
					type:"post",
					success:function(data){
						if(data)
							alert("recomment article success!");
						else
							alert("Sorry,the userIds is wrong,please check again");
					},
					error: function(XMLHttpRequest, textStatus, errorThrown){                        	
                   	 	alert("the mail server has a wrong");
                   }
				});
			}
            </script>
            <!-- END THEME LAYOUT SCRIPTS -->
</body>

</html>