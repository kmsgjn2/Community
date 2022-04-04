<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>커뮤니티-글쓰기</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<main class="container mt-5">
  <div class="row">
    <div class="col mt-3 mb-3 ps-5 pe-5">
      <form action="${path }/board/board_modify" method="post" enctype="multipart/form-data">
      	<input type="hidden" name="board_idx" value="${board_idx }">
      	<input type="hidden" name="board_content_idx" value="${dto.board_content_idx }">
        <div class="mb-3">
		  <input class="form-control" type="text" value="${boardName }" aria-label="readonly input example" disabled readonly>	
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" name="board_content_title" value="${dto.board_content_title }" placeholder="제목">
        </div>
        <div class="mb-3">
          <textarea class="form-control" name="board_content" placeholder="본문" style="height: 200px;">${dto.board_content }</textarea>
        </div>
        <div class="mb-3">
          <label for="formFile" class="form-label">첨부파일</label>
          <input class="form-control" type="file" name="file" id="formFile">
        </div>
        <c:if test="${dto.board_content_file != null }">
	        <div class="mb-3">
	          <input type="hidden" name="board_content_file" value="${dto.board_content_file }">
	          <img src="${path }/upload/${dto.board_content_file}" class="w-100" style="image-rendering: -webkit-optimize-contrast;">
	        </div>
        </c:if>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="submit" class="btn btn-primary">수정</button>
          <button type="button" class="btn btn-danger" onclick="location.href='${path}/board/board_content?board_idx=${board_idx}&board_content_idx=${dto.board_content_idx }'">취소</button>
        </div>
      </form>
    </div>
  </div>
</main> 
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>