<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../layout/header.jsp"/>
<div class="container-md">
<h1>Board List Page...</h1>
<hr>
<!-- search line -->
<div class="container-fluid">
 	<form action="/board/list" method="get" class="d-flex" role="search">
 	<select class="form-select" name="type" id="inputGroupSelect01">
	    <option ${ph.pgvo.type == null ? 'selected' : '' }>Choose...</option>
	    <option value="t" ${ph.pgvo.type eq 't' ? 'selected' : '' }>title</option>
	    <option value="w" ${ph.pgvo.type eq 'w' ? 'selected' : '' }>writer</option>
	    <option value="c" ${ph.pgvo.type eq 'c' ? 'selected' : '' }>content</option>
	    <option value="tw" ${ph.pgvo.type eq 'tw' ? 'selected' : '' }>title + writer</option>
	    <option value="wc" ${ph.pgvo.type eq 'wc' ? 'selected' : '' }>writer + content</option>
	    <option value="tc" ${ph.pgvo.type eq 'tc' ? 'selected' : '' }>content + title</option>
	    <option value="twc">all</option>
 	</select>
       <input class="form-control me-2" name="keyword" type="search" placeholder="Search" value="${ph.pgvo.keyword}" aria-label="Search">
       <input type="hidden" name="pageNo" value="1">
       <input type="hidden" name="qty" value="${ph.pgvo.qty }">
      <button type="submit" class="btn btn-primary position-relative">
		  search
		  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
		    ${ph.totalCount }
		  </span>
	</button>
     </form>
     <%-- ${ph } --%>
</div>

<table class="table table-hover">
 <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">title</th>
      <th scope="col">writer</th>
      <th scope="col">regDate</th>
      <th scope="col">readCount</th>
      <th scope="col">
      	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-arrow-down-fill" viewBox="0 0 16 16">
			<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1m-1 4v3.793l1.146-1.147a.5.5 0 0 1 .708.708l-2 2a.5.5 0 0 1-.708 0l-2-2a.5.5 0 0 1 .708-.708L7.5 11.293V7.5a.5.5 0 0 1 1 0"/>
		</svg>
	</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${list}" var="bvo">
  	<tr>
	  	<td>${bvo.bno }</td>
	  	<td>
	  		<a href="/board/detail?bno=${bvo.bno }">${bvo.title }</a>
	  			<c:if test="${bvo.cmtQty > 0 }">
	  				<span class="fw-bold text-danger">[${bvo.cmtQty }]</span>
	  			</c:if>
	  	</td>
	  	<td>${bvo.writer }</td>
	  	<td>${bvo.regDate }</td>
	  	<td>${bvo.readCount }</td>
	  	<td>${bvo.hasFile }</td>
  	</tr>
  	</c:forEach>
  </tbody>
</table>

<!-- pagination line -->
<!-- << >> : 값이 false disabled -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item ${ph.prev eq false ? 'disabled' : ''}">
      <a class="page-link" href="/board/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
    <li class="page-item ${ph.pgvo.pageNo eq i ? 'active' : ''}"><a class="page-link" href="/board/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}">${i }</a></li>
    </c:forEach>
   <!--  <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
    <li class="page-item ${ph.next eq false ? 'disabled' : ''}" >
      <a class="page-link" href="/board/list?pageNo=${ph.endPage+1}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>

<a href="/"><button type="submit" class="btn btn-success">list</button></a>

</div>
<jsp:include page="../layout/footer.jsp"/>