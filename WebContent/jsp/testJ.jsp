<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>jquery library is loaded or not</title>
</head>
<body>
<h1>jquery library is loaded or not </h1>
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript">
if(typeof jQuery!='undefined'){
alert("jQuery library is loaded!");
} else{
alert("jQuery library is not found");

}

if(jQuery){  
 
   alert("jQuery library is loaded!");
 
    }else{
 
   alert("jQuery library is not found!");
 
   }
</script>
</body>
</html>