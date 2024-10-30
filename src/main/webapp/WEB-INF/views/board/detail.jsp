<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c "%>
<jsp:include page="../layout/header.jsp"/>
<body>
<div class="container-md">
	<h1>Board Detail Page...</h1>
	<div class="mb-3">
		  <label for="t" class="form-label">title</label>
		  <input type="text" class="form-control" id="t" value="${bvo.title}" readonly>
		</div>
		<div class="mb-3">
		  <label for="w" class="form-label">writer</label>
		  <input type="text" class="form-control" id="w" value="${bvo.writer}" readonly>
		  <span class="bodge text-bg-Info">${bvo.regDate}</span>
		</div>
		<div class="mb-3">
		  <label for="c" class="form-label">content</label>
		  <textarea class="form-control" id="c" rows="3" readonly>${bvo.content}</textarea>
		</div>
		
		<a href="/board/modify?bno=${bvo.bno }"><button type="button" class="btn btn-success">modify</button></a>
		<a href="/board/delete?bno=${bvo.bno }"><button type="button" class="btn btn-danger">delete</button></a>
	</div>
</body>
<jsp:include page="../layout/footer.jsp"/>