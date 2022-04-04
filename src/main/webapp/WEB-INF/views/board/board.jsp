<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>커뮤니티-${boardName }</title>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp"/>
<main class="container">
  <h3 class="text-center mt-5 mb-5">${boardName }</h3>
  <div class="row">
    <div class="col">
      <div class="float-end mb-2">
        <input type="hidden" id="searchType" value="${page.searchType }">
        <input type="hidden" id="searchWord" value="${page.searchWord }">
      	<script>
	      	function change() {
	      		let listSize = document.getElementById('listSize').value;
	      		let searchType = document.getElementById('searchType').value;
	      		let searchWord = document.getElementById('searchWord').value;

	      		if (searchType != null && searchWord != null) {
	      			location.href = '${path}/board/board?board_idx=${board_idx}&pageListCnt=' + listSize + '&searchType=' + searchType + '&searchWord=' + searchWord;
	      		} else {
	      			location.href = '${path}/board/board?board_idx=${board_idx}&pageListCnt=' + listSize;	      			
	      		}
	      	}
      	</script>
        <select class="form-select" id="listSize" onchange="change()" aria-label="Default select example">
          <%-- <option value="5" <c:if test="${page.pageListCnt == 5 }">selected</c:if>>5개씩 보기</option>
          <option value="10" <c:if test="${page.pageListCnt == 10 }">selected</c:if>>10개씩 보기</option>
          <option value="15" <c:if test="${page.pageListCnt == 15 }">selected</c:if>>15개씩 보기</option>
          <option value="20" <c:if test="${page.pageListCnt == 20 }">selected</c:if>>20개씩 보기</option> --%>      
          <c:forEach var="count" begin="5" end="20" step="5">
	          <option value="${count }" <c:if test="${page.pageListCnt == count }">selected</c:if>>${count }개씩 보기</option>
          </c:forEach>
        </select>
      </div>
      <table class="table table-<c:choose><c:when test="${boardName eq '자유 게시판' }">info</c:when><c:when test="${boardName eq '유머 게시판' }">warning</c:when><c:when test="${boardName eq '정치 게시판' }">danger</c:when><c:when test="${boardName eq '스포츠 게시판' }">success</c:when></c:choose> table-hover mt-3">
        <thead>
          <tr>
            <th scope="col" class="text-center" width="50px">No</th>
            <th scope="col" class="text-center" width="300px">제목</th>
            <th scope="col" class="text-center" width="200px">작성자</th>
            <th scope="col" class="text-center" width="100px">날짜</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="list" items="${boardList }">
	          <tr>
	            <th scope="row" class="text-center">${list.board_content_idx }</th>
	            <td class="text-center"><a href="${path }/board/board_content?board_idx=${board_idx}&board_content_idx=${list.board_content_idx}" class="link-dark">${list.board_content_title }</a></td>
	            <td class="text-center">${list.board_content_writer_name }</td>
	            <td class="text-center">${list.board_content_date }</td>
	          </tr>
          </c:forEach>       
        </tbody>
      </table>
      <div class="d-flex justify-content-md-end">
        <button type="button" class="btn btn-primary" onclick="location.href='${path}/board/board_write?board_idx=${board_idx }'">글쓰기</button>
      </div>
      <div class="d-grid gap-2 d-md-flex justify-content-md-center">
        <form class="d-flex" action="${path }/board/board">
          <input type="hidden" name="board_idx" value="${board_idx }">
          <select class="form-select me-2 w-75" name="searchType" aria-label="Default select example" required="required">
            <option value="" <c:if test="${page.searchType == null }">selected</c:if>>조건선택</option>
            <option value="title" <c:if test="${page.searchType == 'title' }">selected</c:if>>제목</option>
            <option value="content" <c:if test="${page.searchType == 'content' }">selected</c:if>>내용</option>
            <option value="writer" <c:if test="${page.searchType == 'writer' }">selected</c:if>>작성자</option>
            <option value="titleContent" <c:if test="${page.searchType == 'titleContent' }">selected</c:if>>제목 + 내용</option>
          </select>
          <input class="form-control me-2" type="search" name="searchWord" placeholder="Search" aria-label="Search" value="${page.searchWord }">
          <button class="btn btn-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </div>

    <nav aria-label="Page navigation example">
      <ul class="pagination justify-content-center mt-5 mb-5">
      	<c:if test="${page.currentPage > 1 }">
   		  <a class="page-link" href="${path }/board/board?board_idx=${board_idx}&currentPage=1<c:if test="${page.searchType != null && page.searchWord != null }">&searchType=${page.searchType }&searchWord=${page.searchWord }</c:if>" aria-label="Previous">
            <span aria-hidden="true">처음</span>
          </a>
      	</c:if>
        <li class="page-item">
          <c:choose>
          	<c:when test="${page.prevPage <= 0}">
          	</c:when>
          	<c:otherwise>
       		  <a class="page-link" href="${path }/board/board?board_idx=${board_idx}&currentPage=${page.prevPage}<c:if test="${page.searchType != null && page.searchWord != null }">&searchType=${page.searchType }&searchWord=${page.searchWord }</c:if>" aria-label="Previous">
	            <span aria-hidden="true">&laquo;</span>
	          </a>
          	</c:otherwise>
          </c:choose>
        </li>
        <c:forEach var="idx" begin="${page.paginationStart }" end="${page.paginationEnd }">
        	<c:choose>
        		<c:when test="${idx == page.currentPage }">
			        <li class="page-item active">
			        	<span class="page-link">${idx }</span>
			        </li>    
        		</c:when>
        		<c:otherwise>
        			<li class="page-item">
        				<a class="page-link" href="${path }/board/board?board_idx=${board_idx}&currentPage=${idx }<c:if test="${page.searchType != null && page.searchWord != null }">&searchType=${page.searchType }&searchWord=${page.searchWord }</c:if>">${idx }</a>
       				</li>
        		</c:otherwise>
        	</c:choose>
        </c:forEach>
        <li class="page-item">
          <c:choose>
          	<c:when test="${page.paginationEnd >= page.totalPage }">
          		
          	</c:when>
          	<c:otherwise>
  			  <a class="page-link" href="${path }/board/board?board_idx=${board_idx}&currentPage=${page.nextPage }<c:if test="${page.searchType != null && page.searchWord != null }">&searchType=${page.searchType }&searchWord=${page.searchWord }</c:if>" aria-label="Next">
	            <span aria-hidden="true">&raquo;</span>
	          </a>
          	</c:otherwise>
          </c:choose>
        </li>
        <c:if test="${page.currentPage < page.totalPage }">
   		  <a class="page-link" href="${path }/board/board?board_idx=${board_idx}&currentPage=${page.totalPage }<c:if test="${page.searchType != null && page.searchWord != null }">&searchType=${page.searchType }&searchWord=${page.searchWord }</c:if>" aria-label="Previous">
            <span aria-hidden="true">끝</span>
          </a>
        </c:if>
      </ul>
    </nav>
</main> 
<c:import url="/WEB-INF/views/include/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>