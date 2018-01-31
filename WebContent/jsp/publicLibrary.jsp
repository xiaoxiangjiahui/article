<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->

<head>
    <meta charset="utf-8" />
    <title>Metronic | The Ultimate Multi-purpose Bootstrap Admin Dashboard Theme | Theme #3 | Bootstrap Switch</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="#1 selling multi-purpose bootstrap admin theme sold in themeforest marketplace packed with angularjs, material design, rtl support with over thausands of templates and ui elements and plugins to power any type of web applications including saas and admin dashboards. Preview page of Theme #3 for bootstrap switch"
        name="description" />
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
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />

    <!-- BEGIN CORE PLUGINS -->
    <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>

    <!-- END CORE PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->

    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <script src="../assets/layouts/layout3/scripts/layout.min.js" type="text/javascript"></script>
    <script src="../assets/layouts/layout3/scripts/demo.min.js" type="text/javascript"></script>


</head>

<style>
    .radio-row {
        display: table-row;
    }

    .radio-wrapper {
        cursor: pointer;
        display: inline-block;
        margin-bottom: 1rem;
        padding: 0 0 0 1.75rem;
        position: relative;
    }

    wrapper label {
        cursor: pointer;
        display: inline-block;
        line-height: 1.5rem;
    }

    .state-container {
        position: absolute;
        right: 120px;
        bottom: 2px;
    }

    .community-detail {
        margin-left: 30px;
    }

    .community {
        display: inline-block;
    }
    
    .publication large with-abstract {}

    .publications-list .publication {
        margin-bottom: 1rem;
        padding-bottom: 1rem;
    }
    
    .publication .authors,
    .publication .authors-expanded,
    .publication .publisher {
        font-family: NexusSans, Arial, sans-serif;
        font-size: 1.4rem;
        line-height: 1.5;
        font-style: normal;
    }

    .publication.with-abstract .publication-abstract {
        font-family: NexusSans, Arial, sans-serif;
        font-size: 1.4rem;
        line-height: 1.5;
        font-style: normal;
        margin-bottom: 1rem;
        margin-top: 1rem;
    }
    
    .publication.large h3 {
        font-family: NexusSans, Arial, sans-serif;
        font-size: 1.75rem;
        line-height: 1.5;
        font-weight: 700;
        font-style: normal;
    }
</style>
<!-- END HEAD -->

<body class="page-container-bg-solid">
    <div class="page-wrapper">
        <div class="page-wrapper-row">
            <div class="page-wrapper-top">
                <!-- BEGIN HEADER -->
                <div class="page-header" style="height:64px;">
                    <!-- BEGIN HEADER TOP -->
                    <div class="page-header-top">
                        <div class="container">

                            <div class="page-logo" style="margin-left: -140px;">
                                <a href="#">
                                        <img src="csuLogo (2).png" alt="logo" class="logo-default" style="margin-top:9px; ">
                                    </a>
                            </div>

                            <a href="javascript:;" class="menu-toggler"></a>
                            <div class="top-menu" style="margin-right: 100px;">
                                <ul class="nav navbar-nav" style="font-size: 17px;">
                                    <li>
                                        <a href="../personal/personalLibrary"> Library
                                </a>
                                    </li>
                                    <li>
                                        <a href="../group/showGroup"> Group
                                </a>
                                    </li>
                                    <li>
                                        <a href="../public/publicLibrary"> Public
                                </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;"> PaperAssit
                                </a>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav pull-right" style="margin-left: 200px;">
                                    <li style="margin-top: 9px;margin-left: -20px;">
                                        <!--查询-->
                                        <form class="search-form" action="searchArticles" method="GET">
                                            <div class="input-group">
                                                <input type="text" class="form-control" placeholder="Search" name="keywords" style="width:200px">
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
                                            <!--  <li>
                                                <a href="">
                                                        <i class="icon-user"></i> My Profile </a>
                                            </li>-->
                                            <li>
                                                <a href="../login">
                                                        <i class="icon-calendar"></i> login out </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
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
                        <!-- END PAGE HEAD-->
                        <!-- BEGIN PAGE CONTENT BODY -->
                        <div class="page-content" style="margin-top:0px;padding-bottom: 0px;">
                            <div class="container">
                                <!-- BEGIN PAGE CONTENT INNER -->
                                <div class="page-content-inner">

                                    
                                    <div class="row">
                                        <div class="col-md-12" style="background-color: white;">
                                            <!-- BEGIN PORTLET-->
                                            <div class="portlet light form-fit" style="min-height: 500px;height: 100%;padding: 0;">
                                                <div class="portlet-title">

                                                    <div class="caption col-xs-2">
                                                        <!--<i class="icon-settings font-red"></i>-->
                                                        <span class="caption-subject" style="font-size: 30px;">Public</span>
                                                    </div>
                                                    <div class=" col-xs-3">
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add_article" style="height: 36px;">
                                                                    <span class="glyphicon glyphicon-plus"></span> Add a new article
                                                           </button>
                                                    </div>
                                                </div>
                                                <div class="portlet-body form" id="all_group" style="min-height:400px;">
                                                    <!-- BEGIN FORM-->


                                                    
                                                    <div id="showArticleFeild">
                                                        <c:forEach items="${articles}" var="result" varStatus="status">
                                                            <form id="form${result.articleId}">
                                                                <div class="publications-list">
                                                                    <div class="publication large with-abstract" id="XX">
                                                                        <div class="publication-details">
                                                                            <section>
                                                                                <h3>${result.title}</h3>
                                                                                <ul class="authors">
                                                                                    <li>${result.author}</li>
                                                                                </ul>
                                                                                <div class="publisher">${result.address}</div>
                                                                                <div class="publication-abstract">${result.abstracts}<span class="see-more" style="visibility: visible;">... </span></div>
                                                                                <div>
                                                                                
                                                                                	<a class="btn btn-primary btn-xs" href="downloadFile?articleId=${result.articleId}">download</a>&nbsp &nbsp &nbsp &nbsp
                                                                                	<button type="button" class="btn btn-primary btn-xs" id="${result.articleId}">delete</button>
                                                                                </div>
                                                                            </section>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                        </c:forEach>
                                                    </div>
									



                                                </div>






                                                <div class="modal fade" id="add_article" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                                       <div class="modal-dialog modal-lg" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                    <h4 class="modal-title">请选择文件上传</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form id="uploadfiles" method="post" enctype="multipart/form-data" action="uploadBatchSubmit">
                                                                        <input type="file" multiple="multiple" name="file_upload"/>
                                                                        <br/>
                                                                        <input type="submit" class="btn btn-success" value="上传" id="uploadButton"/>
                                                                        <input type="button" class="btn btn-default" value="取消" data-dismiss="modal" />
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                   </div>
                                                        <!-- END FORM-->
                                                    </div>
                                                </div>
                                                <!-- END PORTLET-->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END PAGE CONTENT INNER -->
                                </div>
                            </div>
                        </div>
                     </div>
                    <!-- END CONTAINER -->
                </div>
            </div>
            <div class="page-wrapper-row">
                <div class="page-wrapper-bottom">
                    <div class="page-footer">
                        <div class="container"> 2017 &copy;
                            <a target="_blank" href=""></a> &nbsp;|&nbsp;
                            <a href="#" title="Purchase Metronic just for 27$ and get lifetime updates for free" target="_blank"></a>
                        </div>
                    </div>
                    <div class="scroll-to-top">
                        <i class="icon-arrow-up"></i>
                    </div>
                    <!-- END INNER FOOTER -->
                    <!-- END FOOTER -->
                </div>
            </div>
        </div>
        

      

        <script>
$(function(){    
	var deleteVisible = ${deleteVisible};
	if(deleteVisible)
		$("#showArticleFeild").find("button").show();
	else
		$("#showArticleFeild").find("button").hide();
});

$("#showArticleFeild").find("button").click(function(){
		var articleId = $(this).attr("id");
		var formId = $(this).parents("form:first").remove();
		$.ajax({
			url:"deleteArticle",
			data:{articleId:articleId},
			type:"post",
			success:function(){
				alert("delete success!");
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){                        	
   	 		alert(XMLHttpRequest.status);
   	    	alert(XMLHttpRequest.readyState);
   	 		alert(textStatus);
  	 	}
		});
	})
                  
        </script>
        <!-- END THEME LAYOUT SCRIPTS -->
    </body>

</html>