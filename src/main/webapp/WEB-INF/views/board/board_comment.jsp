<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<form action="${path }/board/comment_write" onsubmit="return check()">
	<input type="hidden" name="board_comment_info_idx" value="${board_idx }">
	<input type="hidden" name="board_comment_content_idx" value="${dto.board_content_idx }">
	<input type="hidden" id="writer_idx" name="board_comment_writer_idx" value="${sessionScope.memberIdx }">
	<table class="table table-bordered border-<c:choose><c:when test="${board_idx == 1 }">info</c:when><c:when test="${board_idx == 2 }">warning</c:when><c:when test="${board_idx == 3 }">danger</c:when><c:when test="${board_idx == 4 }">success</c:when></c:choose> mt-3" style="margin: auto;">
  		<thead>
    		<tr>
      			<th colspan="4">댓글 작성</th>
    		</tr>
  		</thead>
  		<tbody>
    		<tr>
      			<td colspan="4"><textarea class="form-control" name="board_comment" style="height: 100px;"></textarea></td>
    		</tr>
  		</tbody>
  		<tfoot>
    		<tr>
      			<td class="text-end"><button class="btn btn-primary" type="submit">작성</button></td>
    		</tr>
  		</tfoot>
	</table>
</form>
<script src="${path }/js/board_content.js"></script>