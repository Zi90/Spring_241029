<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		
		<!-- comment line -->
		<!-- comment post -->
		<div class="input-group mb-3">
		  <span class="input-group-text" id="cmtWriter">tester1@tester.com</span>
		  <input type="text" id="cmtText" class="form-control" placeholder="Add Comment" aria-label="Username" aria-describedby="basic-addon1">
		  <button type="button" id="cmtAddBtn" class="btn btn-success">post</button>
		</div>
		<br>
		<hr>
		<!-- comment  print-->
		<ul class="list-group list-group-flush" id="cmtListArea">
		  <li class="list-group-item">
		   <div class="me-2 me-auto">
		      <div class="fw-bold">writer</div>
		      Content
		    </div>
		    <span class="badge text-bg-primary rounded-pill">regDate</span>
		  </li>
		</ul>
		
		<!-- 댓글 더보기 버튼 -->
		<div>
		  <button type="button" id="moreBtn" data-page="1" class="btn btn-dark" style="visibility:hidden">More +</button>
		</div>
		
		<!-- model line -->
		<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="cmtWriterMod">Writer</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <input type="text" id="cmtTextMod" class="form-control">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="cmtModBtn" class="btn btn-primary">changes</button>
      </div>
    </div>
  </div>
</div>
		
		<script type="text/javascript">
		let bnoVal = `<c:out value="${bvo.bno}" />`;
		console.log(bnoVal);
		</script>
		
		<script type="text/javascript" src="/resources/js/boardDetailComment.js"></script>
		
		<script type="text/javascript">
			spreadCommendList(bnoVal);
		</script>
		
	</div>
</body>
<jsp:include page="../layout/footer.jsp"/>