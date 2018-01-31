<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- pagination mode -->
<div id="page-pagination-mode" class="am-text-xs dataTables_paginate">
	<hr />
	<ul class="pagination">
		<li class="prev">
			<a href="personal/index?page=${page.firstPage}">
				<i class="fa fa-angle-double-left"></i>
				首页
			</a>
		</li>
		<li class="prev">
			<c:if test="${page.pageNum != page.firstPage}">
				<a href="personal/index?page=${page.prePage}">
				<i class="fa fa-angle-left"></i>
				上页
			</a>
			</c:if>
			
		</li>
		<li class="prev"  style="visibility: visible;">
			<span id="page-show-cno">${page.pageNum}</span>
		</li>
		<li class="pre">
			<c:if test="${page.pageNum != page.lastPage}">
			<a href="personal/index?page=${page.nextPage}">
				下页
				<i class="fa fa-angle-right"></i>
			</a>
			</c:if>
		</li>
		<li class="pre">
			<a href="personal/index?page=${page.lastPage}">
				末页
				<i class="fa fa-angle-double-right"></i>
			</a>
		</li>
	</ul>
	<ul class="pagination pull-right">
		<li class="next" >
			<span style="padding-right:2px;">
				共
				<span id="page-show-max">${page.pages}</span>
				页&nbsp;&nbsp;
			</span>
		</li>
	</ul>
</div>