<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>커뮤니티-로그인</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<main class="container">
  <h3 class="text-center m-3">로그인</h3>
  <div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4 mt-3 mb-3">
      <form action="${path }/member/login" method="post">
        <div class="mb-3">
          <input type="text" class="form-control" name="member_id" value="${cookie.saveId.value }" placeholder="아이디" required="required">
        </div>
        <div class="mb-3">
          <input type="text" class="form-control" name="member_pw" placeholder="비밀번호" required="required">
        </div>
        <div class="mb-3">
        <div class="form-check form-switch">
          <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheck" ${cookie.saveId != null ? "checked" : ""} name="saveId">
          <label class="form-check-label" for="flexSwitchCheck">아이디 저장</label>
        </div>
        </div>
        <button type="submit" class="btn btn-dark w-100">Login</button>
      </form>
    </div>
    <div class="col-md-4"></div>
  </div>
</main>
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>