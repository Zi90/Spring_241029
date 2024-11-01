<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c "%>
<jsp:include page="../layout/header.jsp"/>
<body>
<div class="container-md">
	<h1>Board Modify Page...</h1>
	<form action="/board/update" method="post">
	<div class="mb-3">
	  <label for="n" class="form-label">no.</label>
	  <input type="hidden" name="bno" value="${bvo.bno }">
	  <input type="text" class="form-control" id="n" value="${bvo.bno}" readonly>
	</div>
	<div class="mb-3">
	  <label for="t" class="form-label">title</label>
	  <input type="text" class="form-control" id="t" name="title" value="${bvo.title}">
	</div>
	<div class="mb-3">
	  <label for="w" class="form-label">writer</label>
	  <input type="text" class="form-control" id="w" value="${bvo.writer}" readonly>
	  <span class="bodge text-bg-Info">${bvo.regDate}</span>
	</div>
	<div class="mb-3">
	  <label for="c" class="form-label">content</label>
	  <textarea class="form-control" id="c" rows="3" name="content">${bvo.content}</textarea>
	</div>
	
		<button type="submit" class="btn btn-success">modify</button>
		<a href="/board/list"><button type="button" class="btn btn-danger">list</button></a>
	</form>
	</div>
</body>
<jsp:include page="../layout/footer.jsp"/>