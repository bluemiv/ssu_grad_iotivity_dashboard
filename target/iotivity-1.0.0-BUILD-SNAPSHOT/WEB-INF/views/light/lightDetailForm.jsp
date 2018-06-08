<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>IoTivity :: Light Detail Form</title>

	<style type="text/css">
		.padding-top {
			padding-top: 80px;
		}
		.padding-bottom {
			padding-bottom: 10px;
		}
	</style>
</head>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="container-fluid padding-top">
		<div class="row padding-bottom">
			<div class="col shadow-lg">
			
				<div class="card shadow">
					<h5 class="card-header">상세정보</h5>
					<div class="card-body">
						<c:if test="${hasData eq 1}">
							<h5 class="card-title">전원</h5>
							<c:choose>
								<c:when test="${lightDTO.state eq 0}">
									<p class="card-text text-danger">OFF</p>
								</c:when>
								<c:when test="${lightDTO.state eq 1}">
									<p class="card-text text-success">ON</p>
								</c:when>
							</c:choose>
							<hr>
							<h5 class="card-title">전력</h5>
							<p class="card-text text-primary">${lightDTO.power}</p>
							<hr>
							<h5 class="card-title">날짜</h5>
							<p class="card-text text-secondary">${lightDTO.date}</p>
						</c:if>
						<c:if test="${hasData eq 0}">
							<h5 class="card-title text-danger">데이터 없음</h5>
							<p class="card-text"></p>
						</c:if>
					</div>
				</div> <!-- end card -->
				
			</div>
		</div>
		<div class="row padding-top">
			<div class="col shadow-lg">
				<h4>최근 내역</h4s>
				<c:if test="${hasData2 eq 0}">
				<div class="alert alert-danger " role="alert">
					데이터 없음
				</div>
				</c:if>
				<c:if test="${hasData2 eq 1}">
				<table class="table shadow-lg">
					<thead class="thead-light">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Power</th>
							<th scope="col">State</th>
							<th scope="col">Date</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ lightList }" var="list">
						<tr>
							<th scope="row">${list.id}</th>
							<td>${list.power}</td>
							<td>
								<c:if test="${list.state eq 1}">
									<span class="text-success">ON</span>
								</c:if>
								<c:if test="${list.state eq 0}">
									<span class="text-danger">OFF</span>
								</c:if>
							</td>
							<td>${list.date}</td>
							<td>	
								<!-- Delete History -->
								<form action="lightDelete" method="POST">
									<input type="hidden" name="id" value="${list.id}"/>
									<input type="submit" class="btn btn-sm btn-primary" value="기록 삭제"/>
								</form>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				</c:if>
			</div><!-- end col -->
		</div><!-- end row -->
	</div><!-- end container-fluid -->
										
	<jsp:include page="../footer.jsp"></jsp:include>
</html>