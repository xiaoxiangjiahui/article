<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="portlet-body" id="article-body">
 <table class="table  table-condensed" id="table_article">
    <c:forEach items="${articles}" var="result" varStatus="status">
        <tr id="${result.pid}" class="searchtr">
            <td style="vertical-align: middle;"><input type="hidden" name="titleid" value="${result.pid}"/>
                <label class="col-sm-1 control-label">
                <input type="checkbox" class="check" name="check">
                </label>
            </td>
            <td>
                <div>
                    <h4 class="title" name="title">${result.ptitle}</h4>
                    <p class="metadata" name="metadata" style="margin:0;">
                        <span class="authors" name="authors">${result.authors}</span>
                        ${result.addr},&nbsp;
                        in ${result.publish},&nbsp;${result.publishdate}  
                    </p>
                </div>
            </td>
        </tr>
        <tr>
        	<td></td>
        	<td><div class="pull-right doscore" data-score="${result.stars}"></div></td>
        </tr>
        
    </c:forEach>
</table>
</div>
<jsp:include page="../jspex/search-pagination.jsp" flush="true"/>
<script src="./srjs//jquery.raty.js"></script>

<script>
$.fn.raty.defaults.path = './srcss/images';
	$('.doscore').raty({
		click: function(score, evt) {
			console.log($(this).parents("tr").prev().attr("id"));
			var id = $(this).parents("tr").prev().attr("id");
			$.ajax({
				url:"personal/createStars",
				data:{pid:Number(id),score:score},
				success: function(data){
					console.log(data);
					showDetail(selected_id);
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					alert("评分失败");
				}
			});
		    //alert("\nscore: " + score + "\nevent: " + evt);
		}
	});

	$("#table_article tr").click( function () {
	    var article_id;
	    article_id = $(this).attr("id");
	    if(!article_id) return;
	    selected_id = article_id;
	   // $("#"+article_id+" :checkbox").prop("checked","checked");
	    //console.log(article_id);
	    showDetail(article_id);          
	})
	
	function searchpage(pno){
		var keyw = $("#titleSearch").val();
		var auth = $("#auth").val();
		var abst = $("#abst").val();
		var cid = $("#categorySearch").val();
		console.log(keyw,auth);
		$.ajax({
			url:"personal/attachSearch",
			type:"POST",
			data:{keyw:keyw,auth:auth,abst:abst,cid:Number(cid),page:pno},
			dataType: "html",  
            cache:false,  
			success: function(data){
				detailVM.$data.docObj = [];
            	detailVM.$data.stars = [];
				$('#article-body').html(data);  
			},
			error: function(XMLHttpRequest, textStatus, errorThrown){     
          	 	alert("查询失败");
          }
		}); 
	}
</script>