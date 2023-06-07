<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
	<style>
		.container {
			display: grid;
			grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
			grid-template-rows: masonry; /* this will do the magic */
			grid-gap: 10px;
		}
		
		img {
			width: 100%;
			border-radius: 10%;
	}
	</style>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.css">

</head>
<body>

	<my:navBar current="myFeed"></my:navBar>
	
	<h1>My Feed</h1>
	</br>
	
	<div class="container">

		<a href="/feedAdd">
		<img src="/images/feedAddIcon.PNG" alt="" />

	<c:forEach items="${fileList }" var="file">
		
    	<div class=item>
    		<a href="/feedId/${file.feedId }">
    		<img src="${bucketUrl }/${file.feedId }/${file.fileName }" alt="" />
    		</a>
    	</div> 
    
    </c:forEach>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.5.0/dist/semantic.min.js"></script>
	
	<c:if test="${param.remove eq 'remove' }">
		<script>
			alert("게시물이 삭제 되었습니다!")
		</script>
	</c:if>
</body>
</html>