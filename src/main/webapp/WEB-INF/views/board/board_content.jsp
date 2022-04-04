<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="${path }/js/board_content.js"></script>
<title>커뮤니티-${dto.board_content_title }</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<main class="container mt-5">
  <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="${path }/main">커뮤니티</a></li>
      <li class="breadcrumb-item"><a href="${path }/board/board?board_idx=${board_idx}">${boardName }</a></li>
      <li class="breadcrumb-item active" aria-current="page">${dto.board_content_idx }</li>
    </ol>
  </nav>
  <div class="row">
    <div class="col">
      <table class="table table-bordered border-<c:choose><c:when test="${board_idx == 1 }">info</c:when><c:when test="${board_idx == 2 }">warning</c:when><c:when test="${board_idx == 3 }">danger</c:when><c:when test="${board_idx == 4 }">success</c:when></c:choose> mt-3" style="margin: auto;">
        <thead>
          <tr>
            <th scope="col" class="text-center">제목</th>
            <th colspan="3" scope="col" class="text-center">${dto.board_content_title}</th>
          </tr>
          <tr>
            <th scope="col" class="text-center">작성자</th>
            <th colspan="3" scope="col" class="text-center">${dto.board_content_writer_name}</th>           
          </tr>
          <tr>
            <th scope="col" class="text-center">작성일</th>
            <th scope="col" class="text-center">${dto.board_content_date}</th>   
            <th scope="col" class="text-center">조회수</th>
            <th scope="col" class="text-center">2155</th>  
          </tr>
        </thead>
        <tbody>
          <tr>
            <td colspan="4"><pre>${dto.board_content }</pre></td>
          </tr>
          <c:if test="${dto.board_content_file != null }">
	          <tr>
	            <th colspan="4" class="text-center">첨부파일</th>
	          </tr>
	          <tr>
	            <td colspan="4"><img src="${path }/upload/${dto.board_content_file}" class="w-100" style="image-rendering: -webkit-optimize-contrast;"></td>
	          </tr>
          </c:if>
        </tbody>
        <tfoot>
        	<tr>
        		<th colspan="4">댓글</th>
        	</tr>
			<c:forEach var="list" items="${commentList }">
				<tr>
					<td class="text-center">${list.board_comment_writer_name }</td>
					<td colspan="2">${list.board_comment }</td>
					<td class="text-center">${list.board_comment_date }</td>
				</tr>
			</c:forEach>
        </tfoot>
      </table>
	  <c:import url="/WEB-INF/views/board/board_comment.jsp"/>
      <c:if test="${sessionScope.memberIdx == dto.board_content_writer_idx }">
	      <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-3">
	        <button class="btn btn-primary me-md-2" type="button" onclick="location.href='${path}/board/board_modify?board_idx=${board_idx }&board_content_idx=${dto.board_content_idx }'">수정</button>
	        <button class="btn btn-danger" onclick="location.href='${path}/board/board_delete?board_idx=${board_idx }&board_content_idx=${dto.board_content_idx }'" type="button">삭제</button>
	      </div>
      </c:if>
    </div>
  </div>
</main> 
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>