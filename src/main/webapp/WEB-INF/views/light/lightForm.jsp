<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<title>IoTivity :: Light Form</title>

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
	
	<div class="container-fluid padding-top">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-4">

				<div class="card shadow">
					<h5 class="card-header">Light 현재 상태</h5>
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
							<h5 class="card-title">전력</h5>
							<p class="card-text text-primary">${lightDTO.power}</p>
							<hr>
							<form action="lightDetailForm" method="GET">
								<!-- <input type="hidden" value="${lightDTO.id}" name="id"/> -->
								<input type="submit" class="btn btn-primary" value="상세정보" />
							</form>
						</c:if>
						<c:if test="${hasData eq 0}">
							<h5 class="card-title text-danger">데이터 없음</h5>
							<p class="card-text"></p>
						</c:if>
					</div>
				</div> <!-- end card -->
			
			</div><!-- end col -->
		</div><!-- end row -->
	</div>
										
<jsp:include page="../footer.jsp"></jsp:include>
</html>