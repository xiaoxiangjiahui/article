<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/base/headhtml.jsp" flush="true"/>

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
                                    	<div class="caption">
                                            <span class="caption-subject" style="font-size: 30px;">My Groups</span>
                                        </div>
                                        <div class="actions">
                                        	<c:if test="${sessionScope.role!=1}">
                                        	<button type="button" class="btn btn-success" data-toggle="modal" data-target="#add_group" style="height: 36px;">
                                                <span class="glyphicon glyphicon-plus"></span> 创建组
                                            </button>
                                        	</c:if>
                                             
                                        </div>
                                    </div>
                                    <div class="portlet-body" id="all_group" style="height:680px;padding-top:0;">
                                        <ul class="feeds">
                                           <li v-for="item in listGroup">
                                               <div class="col1">
                                                   <div class="cont">
                                                       <div class="cont-col1">
                                                           <div class="label label-sm label-success">
                                                               <i class="fa fa-group"></i>
                                                           </div>
                                                       </div>
                                                       <div class="cont-col2">
                                                           <a class="desc" :href="'group/specificGroup?groupId='+item.groupId">{{item.gname}}
                                                              <span v-if="item.account==${sessionScope.account}" class="label label-sm label-default "> Owner 创建于 {{moment(item.createtime).format("YYYY-MM-DD")}} </span>
                                                              <span v-else class="label label-sm label-default "> 由 {{item.username}} 创建于 {{moment(item.createtime).format("YYYY-MM-DD")}} </span>
                                                           </a>
                                                       </div>
                                                   </div>
                                               </div>
                                               <div class="col2">
                                                   <div class="date"> Members:{{item.count}}</div>
                                               </div>
                                           </li>
                                        </ul>
                                    </div>
                                    
                                    <div id="add_group" class="modal fade" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <a href="javascript:;" class="close" data-dismiss="modal" aria-hidden="true"></a>
                                                    <h4 class="modal-title">Create new group</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="#" class="form-horizontal">

                                                        <div class="form-group">

                                                            <!--<div class="input-wrap js-animated-labels">-->
                                                            <label class="control-label col-md-3">Group name</label>
                                                            <div class="col-md-9">
                                                                <input type="text" class="form-control" name="groupName" id="group-name">
                                                            </div>
                                                            <!--</div>-->
                                                        </div>
                                                        <div class="form-group" style="display:none">
                                                            <label class="control-label col-md-3">Group describe</label>
                                                            <div class="col-md-9">
                                                                <input type="text" class="form-control" name="description" id="description" data-pattern="^[\s\S]{0,512}$">
                                                            </div>
                                                            <div class="error-message hidden" data-for="description" data-error-invalid="Your group description must contain fewer than 512 characters">
                                                            </div>

                                                        </div>


                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <a href="javascript:;" class="btn grey-salsa btn-outline" data-dismiss="modal">Close</a>
                                                    <button type="button" id="create" class="btn green">
                                                                Create</botton>
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

<script type="text/javascript">   
var groupVm = new Vue({
	el:"#all_group",
	data:{listGroup:{}}
});
$(function(){
	$.ajax({
		url:"group/listGroup",
		//async:false,
		type:"POST",
		success:function(data){
		    
		if(data == null || data == undefined ||data == '') {
			$("#all_group").append("");
		}
		console.log(data);
	/* 	 var result=data;
		 for(var i in data)
		 $("#all_group").append(
	      ' <div class="community col-md-12" id="'+data[i].groupId+'">'+
	                   ' <div class="community-detail">'+
	                          '<h3><a href="specificGroup?groupId='+data[i].groupId+'">'+data[i].gname+'</a></h3>'+
	                            
	                   '</div>'+
	                   '<div class="state-container">'+
	                         '<p>'+data[i].count+'members'+'</p>'+
	                   '</div>'+
	      '</div>'
		  ); */
		 groupVm.$data.listGroup=data;
		}	
	});    
});

$("#create").click(function(){
	//alert("2");
	//var show = $("#group-name").val();
	//alert(show);
	$.ajax({
		 url:"group/newGroupSubmit",
     	 type:"POST",
     	 data:{groupName:$("#group-name").val()},
     	 success:function(){
         	 alert("Create success");
     	 },
     	 error: function(XMLHttpRequest, textStatus, errorThrown){                        	
             alert(XMLHttpRequest.status);
             alert(XMLHttpRequest.readyState);
             alert(textStatus);
      }
	});	
});

</script>

<jsp:include page="/WEB-INF/base/tailhtml.jsp" flush="true"/>
