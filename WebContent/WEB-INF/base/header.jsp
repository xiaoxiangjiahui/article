<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	a:hover{
		text-decoration: none;
	}
</style>

<div class="page-wrapper-row">
    <div class="page-wrapper-top">
        <!-- BEGIN HEADER -->
        <div class="page-header">
            <!-- BEGIN HEADER TOP -->
            <div class="page-header-top">
                <div class="container">
                    <!-- BEGIN LOGO -->
                    <div class="page-logo">
                        <a href="index.html" style="font-size:x-large;">
                            <img src="assets/layouts/layout3/img/csuLogo.png" alt="logo" class="logo-default" >
                            	<strong>文献共享系统</strong>
                        </a>
                    </div>
                    <!-- END LOGO -->
                    <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                    <a href="javascript:;" class="menu-toggler"></a>
                    <!-- END RESPONSIVE MENU TOGGLER -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                        <ul class="nav navbar-nav pull-right">
                            <!-- BEGIN NOTIFICATION DROPDOWN -->
                            <!-- DOC: Apply "dropdown-hoverable" class after "dropdown" and remove data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to enable hover dropdown mode -->
                            <!-- DOC: Remove "dropdown-hoverable" and add data-toggle="dropdown" data-hover="dropdown" data-close-others="true" attributes to the below A element with dropdown-toggle class -->
                            <!-- <li class="dropdown dropdown-extended dropdown-notification dropdown-dark" id="header_notification_bar">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="icon-bell"></i>
                                    <span class="badge badge-default">7</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li class="external">
                                        <h3>You have
                                            <strong>12 pending</strong> tasks</h3>
                                        <a href="app_todo.html">view all</a>
                                    </li>
                                    <li>
                                        <ul class="dropdown-menu-list scroller" style="height: 250px;" data-handle-color="#637283">
                                            <li>
                                                <a href="javascript:;">
                                                    <span class="time">just now</span>
                                                    <span class="details">
                                                        <span class="label label-sm label-icon label-success">
                                                            <i class="fa fa-plus"></i>
                                                        </span> New user registered. </span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </li> -->
                            <!-- END NOTIFICATION DROPDOWN -->
                
                            <!-- BEGIN USER LOGIN DROPDOWN -->
                            <li class="dropdown dropdown-user dropdown-dark">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <span class="username username-hide-mobile">Hi, ${sessionScope.userName}</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                    <li>
                                        <a href="personal/userinfo">
                                            <i class="icon-user"></i> 我的资料 </a>
                                    </li>
                                   <!--  <li>
                                        <a href="javascript:;">
                                            <i class="icon-rocket"></i> 我的任务
                                            <span class="badge badge-success"> 7 </span>
                                        </a>
                                    </li> -->
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="logout">
                                            <i class="icon-key"></i> 退出 </a>
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
            <!-- BEGIN HEADER MENU -->
            <div class="page-header-menu">
                <div class="container">
                    <!-- BEGIN MEGA MENU -->
                    <!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
                    <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
                    <div class="hor-menu  ">
                        <ul class="nav navbar-nav">
                           <li class="menu-dropdown classic-menu-dropdown active">
                               <a href="javascript:;">文献库
                                   <span class="arrow"></span>
                               </a>
                               <ul class="dropdown-menu pull-left">
                               		<!-- <li class=" ">
                                        <a href="" class="nav-link  "> 文献检索 </a>
                                    </li> -->
                                    <li class=" ">
                                        <a href="personal/index" class="nav-link  "> 我的文献 </a>
                                    </li>
                                   <!--  <li class=" ">
                                        <a href="jsp/nav_sharing.jsp" class="nav-link  "> 推荐的文献 </a>
                                    </li> -->
                                    <li class=" ">
                                        <a href="personal/shared" class="nav-link  "> 推荐文献 </a>
                                    </li>
                                </ul>
                           </li>
                           <li class="menu-dropdown classic-menu-dropdown ">
                                <a href="group/groups"> 小组管理
                                    <span class="arrow"></span>
                                </a>
                            </li>
                            <li class="menu-dropdown classic-menu-dropdown">
                               <a href="personal/nav_uploadfile">上传文献
                                   <span class="arrow"></span>
                               </a>
                           </li>
                        </ul>
                    </div>
                    <!-- END MEGA MENU -->
                </div>
            </div>
            <!-- END HEADER MENU -->
        </div>
        <!-- END HEADER -->
    </div>
</div>
<script type="text/javascript">
	if(!"${sessionScope}"){
		location.href="/login";
	}
</script>
