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
      <form action="${path }/board/board_write" method="post" enctype="multipart/form-data">
        <div class="mb-3">
          <select class="form-select" name="board_content_info_idx" aria-label="Default select example">
          	<c:forEach var="list" items="${boardNameList }">
          		<c:set var="idx" value="${list.board_idx }"/>
	            <option value="${idx }"<c:if test="${board_idx == idx }">selected</c:if>>${list.board_name }</option>
          	</c:forEach>
          </select>
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" name="board_content_title" placeholder="제목" required="required">
        </div>
        <div class="mb-3">
          <textarea class="form-control" name="board_content" placeholder="본문" style="height: 200px;" required="required"></textarea>
        </div>
        <div class="mb-3">
          <label for="formFile" class="form-label">첨부파일</label>
          <input class="form-control" type="file" name="file" id="formFile">
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="submit" class="btn btn-primary">글쓰기</button>
          <button type="button" class="btn btn-danger" onclick="location.href='${path}/board/board?board_idx=${board_idx}'">취소</button>
        </div>
      </form>
    </div>
  </div>
</main> 
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>