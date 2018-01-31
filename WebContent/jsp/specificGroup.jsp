<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/base/headhtml.jsp" flush="true"/>
<link href="./assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
<link href="./assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
<style>
 .invite {
        position: absolute;
        right: 15px;
        bottom: 25px;
    }
    .publication large with-abstract {}

    .publications-list .publication {
        margin-bottom: 1rem;
        padding-bottom: 1rem;
    }
    .card {

        background: #fff;
        color: #474747;
        margin-bottom: 8px;
        padding: 1rem;
        width: 100%;
    }
    .authors {
        display: block;
        list-style-type: none;
        margin: 0 0 1.5rem 0;
        padding: 0;
        -webkit-margin-before: 1em;
        -webkit-margin-after: 1em;
        -webkit-margin-start: 0px;
        -webkit-margin-end: 0px;
        -webkit-padding-start: 40px;
    }
    .authors li {
        margin: 0 0 0 10px;
        padding: 0;
        display: inline-block;
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
    a.basic-link {
        padding-top: 1rem;
    }
    .basic-link {
        font-family: NexusSans, Arial, sans-serif;
        font-size: 1.8rem;
        line-height: 1.5;
        font-weight: 400;
        font-style: normal;
        transition: 111ms ease-out;
        transition-property: color;
        -webkit-font-smoothing: antialiased;
        background: 0 0;
        border: none;
        color: #007398;
        cursor: pointer;
        display: inline-block;
        height: 2rem;
        line-height: 0;
        margin: 0;
        outline: 0;
        padding: 0;
        text-decoration: none;
        vertical-align: middle;
        white-space: nowrap;
    }

    .publication.large h3 {
        font-family: NexusSans, Arial, sans-serif;
        font-size: 1.75rem;
        line-height: 1.5;
        font-weight: 700;
        font-style: normal;
    }

    .card community-list-container {
        height: 100%;
        min-height: 300px;
        width: 1130px;
        background-color: white;
    }

    .page-content {
        min-height: 1000px;
        height: 100%;
    }

    #document_header {
        font-size: 16px;
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
</style>
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
                                <a href="group/groups">小组管理</a>
                            </li>
                        </ul>
                        <!-- END PAGE BREADCRUMBS -->
                        <div class="row" id="showDroupDiv">
                        	<div class="col-md-12 col-sm-12">
                                <div class="portlet light ">
                                    <div class="portlet-title">
                                    	<div class="caption" id="showDiv">
                                            <span class="caption-subject" style="font-size: 30px;">${groupName}</span>
                                            <input type="button" value="${groupId}" id="getGroupId" style="display:none">
                                            <a class="btn btn-lg" href="javascript:editGroup();"><i class="fa fa-edit"></i></a>
                                        </div>
                                        <div class="caption" id="editDiv" style="display:none;">
                                            <div>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" id="gname">
                                                    <span class="input-group-btn">
                                                        <button id="saveGname" class="btn btn-success" type="button">保存</button>
                                                    </span>
                                                </div>
                                                <!-- /input-group -->
                                            </div>
                                        </div>
                                        <div class="actions">
                                        	<c:if test="${sessionScope.role!=1}">
                                             <button id="inviteMember" type="button" class="btn btn-success" data-toggle="modal" data-target="#add_group" style="height: 36px;">
                                                   <span class="glyphicon glyphicon-plus"></span> 邀请组员
                                            </button>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="portlet-body" id="all_group" style="min-height:680px;padding-top:0;">
                                    	 <div data-always-visible="1" data-rail-visible1="1">
                                            <div class="tabbable-custom ">
                                                <ul class="nav nav-tabs ">
                                                    <li class="active">
                                                        <a href="#documents" data-toggle="tab">documents</a>
                                                    </li>
                                                    <li>
                                                        <a href="#members" data-toggle="tab">members </a>
                                                    </li>
                                                    
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="documents" style="min-height:500px">
                                                        <div id="showArticleFeild">
		                                            	<c:forEach items="${articles}" var="result" varStatus="status">
		                                            		<form id="form${result.pid}">
		                                               		 	<div class="publications-list">
		                                                   		 	<div class="publication large with-abstract" id="XX">
		                                                        		<div class="publication-details">
		                                                            		<section>
		                                                                		<h3>${result.ptitle}</h3>
		                                                                	<ul class="authors">
		                                                                    	<li>${result.authors}. </li><li class="publisher">Publish: ${result.publish}</li>
		                                                                	</ul>
		                                                                	<div class="publication-abstract">${result.pabstract}</div>
		                                                                	<div class="pull-right">
		                                                                		<a class="btn  btn-xs btn-default" onclick="downloadFile(${result.pid})"><i class="fa fa-download"></i></a>&nbsp &nbsp
		                                                                		<c:if test="${manager.account==sessionScope.account || sessionScope.role==3}">
		                                                                			<button class="btn btn-xs btn-default" id="${result.pid}"><i class="fa fa-trash-o"></i></button>
		                                                                		</c:if>
		                                                                	</div>
		                                                            		</section>
		                                                        		</div>
		                                                    	 	</div>
		                                                	 	</div>
		                                                	 </form>
		                                            	 </c:forEach>
		                                            	 <jsp:include page="../jspex/group-pagination.jsp" flush="true"/>
		                                            	 </div>
                                                    </div>
                                                    <div class="tab-pane" id="members" style="min-height:500px">
                                                        <div id="showUsers">
                                                        <ul class="feeds">	
                                                        	<li>
				                                               <div class="col1">
				                                                   <div class="cont">
				                                                       <div class="cont-col2">
				                                                           <h4>${manager.username}
				                                                              <span class="label label-sm label-default ">管理员</span>
				                                                           </h4>
				                                                       </div>
				                                                   </div>
				                                               </div>
				                                           </li>																
														<c:forEach items="${users}" var="result" varStatus="status">
													   		<li>
				                                               <div class="col1">
				                                                   <div class="cont">
				                                                       <div class="cont-col2">
				                                                           <h5>${result.username}
				                                                              <span class="label label-sm label-default ">组员</span>
				                                                              <c:if test="${manager.account==sessionScope.account}">
			                                                              	  <a href="group/deleteUserSubmit?account=${result.account}&groupId=${groupId}">
																			  	<i class="fa fa-trash-o"></i>
																		      </a>
				                                                              </c:if>
				                                                           </h5>
				                                                       </div>
				                                                   </div>
				                                               </div>
				                                           </li>
														</c:forEach>
														</ul>
														</div>		
                                                    </div>
                                                </div>
                                            </div>
                                         </div>
                                    </div>
                               		
                               		<div id="add_group" class="modal fade" tabindex="-1" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <a href="javascript:;" class="close" data-dismiss="modal" aria-hidden="true"></a>
                                                    <h4 class="modal-title">Invite members</h4>
                                                </div>
                                                <div class="modal-body">
                                                	<div class="scroller" style="height:300px" data-always-visible="1" data-rail-visible1="1">
	                                                   <div class="input-group select2-bootstrap-append">
	                                                       <select id="multi-users" class="form-control select2" multiple>
	                                                           <option></option>
	                                                           <option v-for="item in users" :value="item.account">{{item.username}}</option>                                                                       
	                                                       </select>
	                                                   </div>
	                                               </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="javascript:;" class="btn grey-salsa btn-outline" data-dismiss="modal">Close</a>
                                                    <button id="inviteSubmit" value="" class="btn green" >invite</button>
                                                        
                                                </div>
                                            </div>
                                        </div>
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
<jsp:include page="/WEB-INF/base/footer.jsp" flush="true"/>
<script src="./assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="./assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
<script type="text/javascript">   
	
	
	var userVm = new Vue({
		el:"#multi-users",
		data:{
			users:[]
		}
	});
	
	$("#inviteMember").on("click",function(){
		$.ajax({
			url:"personal/getUserAndGroup",
			success: function(data){
				console.log(data);
				userVm.$data.users = data.users;
			},
			error:function(data){
				
			}
		})
	});
	$("#inviteSubmit").click(function(){
		var groupId = $("#getGroupId").val();
		console.log("groupid",groupId);
		var userId = $("#multi-users").val();
		console.log("userId",userId);
		$.ajax({
			url:"group/addUser",
			type:"post",
			data:{groupId:groupId,userId:userId},
			success:function(){
				alert("邀请成功");
				location.reload();
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){   
				alert("邀请失败");
       		}
		}); 	
	});
	
	$("#showArticleFeild").find("button").click(function(){
		var articleId = $(this).attr("id");
		var formId = $(this).parents("form:first").remove();
		var groupId = ${groupId};
		$.ajax({
			url:"group/deleteArticle",
			data:{articleId:articleId,groupId:groupId},
			type:"post",
			success:function(result){
				if(result){
					alert("删除成功!");
					//window.location.reload();s
				}
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){  
	   	 		alert("删除失败");
  	 		}
		});
	})
	
	function editGroup(){
		var groupId = $("#getGroupId").val();
		$.ajax({
			url:"group/getGroupName",
			data:{groupId:groupId},
			type:"post",
			success:function(result){
				console.log(result);
				$("#showDiv").hide();
				$("#gname").val(result.gname);
				$("#editDiv").show();
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){  
	   	 		alert("加载失败");
  	 		}
		});
	}
	
	$("#saveGname").on("click",function(){
		var groupId = $("#getGroupId").val();
		var gname=$("#gname").val();
		$.ajax({
			url:"group/editGroup",
			data:{groupId:groupId,gname:gname},
			type:"post",
			success:function(result){
				console.log(result);
				$("#editDiv").hide();
				$(".caption-subject").text(result.gname);
				$("#showDiv").show();
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){  
	   	 		alert("修改失败");
  	 		}
		});
		
	});
	
	function downloadFile(pid){
		$.ajax({
			url:"group/downloadFile",
			type:"POST",
			data:{articleId:pid},
			success:function(data){
				console.log(data);
				window.open("/file/"+data.path);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){  
	   	 		alert("下载失败");
  	 		}
		})
	}

</script>

<jsp:include page="/WEB-INF/base/tailhtml.jsp" flush="true"/>
