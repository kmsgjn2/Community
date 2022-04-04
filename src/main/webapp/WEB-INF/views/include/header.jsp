<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
    <div class="container-fluid">
      <a class="navbar-brand" href="${path }/main">커뮤니티</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarText">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          	<c:forEach var="list" items="${boardNameList }">
	          <li class="nav-item">
	            <a href="${path }/board/board?board_idx=${list.board_idx}" class="nav-link">${list.board_name }</a>
	          </li>
          	</c:forEach>
        </ul>
        <c:choose>
        	<c:when test="${sessionScope.memberName != null }">
		        <ul class="nav justify-content-end">
		          <li class="nav-item">
		          	<a class="nav-link" style="color: #fff">${sessionScope.memberName }님</a>
		          </li>
				  <li class="nav-item">
				    <a class="nav-link" href="#" style="color: #fff">정보수정</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link" href="${path }/member/logout" style="color: #fff">로그아웃</a>
				  </li>
				</ul>
        	</c:when>
        	<c:otherwise>
		        <span class="navbar-text">
		          <a href="${path }/member/login" class="nav-link">로그인</a>
		        </span>
		        <span class="navbar-text">
		          <a href="${path }/member/join" class="nav-link">회원가입</a>
		        </span>
        	</c:otherwise>
        </c:choose>
      </div>
    </div>
  </nav>
</header>