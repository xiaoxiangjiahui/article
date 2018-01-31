<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table align='center' border='1' cellspacing='0'>
    <tr>
        <td>id</td>
        <td>name</td>
    </tr>
    <c:forEach items="${articles}" var="c" varStatus="st">
        <tr>
            <td>${c.articleId}</td>
            <td>${c.title}</td>
               
        </tr>
    </c:forEach>
</table>
<script type="text/javascript">
	$('tr').click(function(event)){
		alert("hello");
	}
</script>
</body>
</html>