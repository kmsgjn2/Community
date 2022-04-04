<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>커뮤니티</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<main class="container">
  <h3 class="text-center m-3">커뮤니티</h3>
  <div class="row">
  	<c:forEach var="main_list" items="${list }" varStatus="idx">
	    <div class="col-lg-6">
	      <h5 class="text-center m-3">${board[idx.index].board_name }</h5>
		  <table class="table table-<c:choose><c:when test="${board[idx.index].board_idx == 1 }">info</c:when><c:when test="${board[idx.index].board_idx == 2 }">warning</c:when><c:when test="${board[idx.index].board_idx == 3 }">danger</c:when><c:when test="${board[idx.index].board_idx == 4 }">success</c:when></c:choose> table-hover">
	        <thead>
	          <tr>
	            <th scope="col" class="text-center" width="50px">No</th>
	            <th scope="col" class="text-center" width="200px">제목</th>
	            <th scope="col" class="text-center" width="200px">작성자</th>
	            <th scope="col" class="text-center" width="150px">날짜</th>
	          </tr>
	        </thead>
	        <tbody>
	        	<c:forEach var="sub_list" items="${main_list}">
		          <tr>
		            <th scope="row" class="text-center">${sub_list.board_content_idx }</th>
		            <td class="text-center"><a href="${path }/board/board_content?board_idx=${board[idx.index].board_idx }&board_content_idx=${sub_list.board_content_idx}" class="link-dark">${sub_list.board_content_title }</a></td>
		            <td class="text-center">${sub_list.board_content_writer_name }</td>
		            <td class="text-center">${sub_list.board_content_date }</td>
		          </tr>
	        	</c:forEach>
	        </tbody>
	      </table>
	    </div>
  	</c:forEach>
  </div>
</main>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>