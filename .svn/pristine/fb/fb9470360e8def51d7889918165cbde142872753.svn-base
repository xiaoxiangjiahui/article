<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" import="java.util.*"%> 

<html>
<head>
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="testuploadSubmit" method="post" enctype="multipart/form-data">
  选择文件:<input type="file" name="pdfFile"/> <br> 
  <input type="submit" value="上传">
</form>
<form action="testdownload" method="post">
    <input type="submit" value="下载"/>
</form>
<form action="testMysql" method="post">
    <input type="submit" value="testMysql"/>
</form>
<form action="testEs" method="post">
    <input type="submit" value="testES"/>
</form>
<form action="testComment" method="post">
    <input type="submit" value="testComment"/>
</form>
<form action="testGroupId" method="post">
    <input type="submit" value="testGroupId"/>
</form>
<form action="testEmail" method="post">
    <input type="submit" value="testEmail"/>
</form>

<form action="testShowArticle" method="post">
    <input type="submit" value="testShowArticle"/>
</form>
<form action="testDownloadArticles" method="post">
    <input type="submit" value="testDownloadArticles"/>
</form>
<input type="submit" onclick="ajax_array()" value="testajax"/>
<input type="submit" onclick="sendAjax()" value="copyFromWeb" id="GetData"/>
<form action="searchSubmit">
	query:
	<input type="text" id="queryText" value="" name="keywords"><br>
	<input type="submit" value="Go">
</form>
<form action="testShowGroupArticle" method="post">
    <input type="submit" value="testShowGroupArticle"/>
</form>
<script type="text/javascript">
	function ajax_array(){
		var userName = "alice";
		//var array = [];
		//array.push(1);
		//array.push(2);
		//alert(2);
		$.ajax({
			type:'POST',
			dataType:"json",
			//data:{"array":array},
			data:{"userName":userName},
			url:"testAjax",
			success:function(data){
				alert(data);
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {
           	 alert(XMLHttpRequest.status);
           	 alert(XMLHttpRequest.readyState);
           	 alert(textStatus);
           }
		});
	}
	
	function sendAjax()
	{
		var username = "alice";
		var userId = "1234";
		//alert("2");
	    $.ajax(
	    {
	        url:"CheckUsername",
	        data:{'userName':username,'userId':userId},
	        type:'POST',
	        dataType:"json",
	        msg:"test",
	        success:function(data,msg)
	        {
	            var jsons = data;
	            for(var i = 0; i < jsons.length; i++)
	            {
	                alert(json[i].userName);
	            }
	            alert(msg);
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	           	 alert(XMLHttpRequest.status);
	           	 alert(XMLHttpRequest.readyState);
	           	 alert(textStatus);
	           }
	    });
	}
</script>
</body>
</html>