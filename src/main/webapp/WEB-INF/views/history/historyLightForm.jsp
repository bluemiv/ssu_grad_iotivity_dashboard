<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>IoTivity :: Light History</title>	
	
	<!-- Resources -->
	<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	
	<style type="text/css">
		.padding-top {
			padding-top: 80px;
		}
		.padding-bottom {
			padding-bottom: 30px;
		}
		
	</style>
	
	<!-- Chart code -->
	<script>
	window.onload = function () {

	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		title: {
			text: "전등 사용량"
		},
		axisX: {
			minimum: new Date("${lightList.get(lightList.size()-1).date}"),
			maximum: new Date("${lightList.get(0).date}"),
			valueFormatString: "DD일 hh시"
		},
		axisY: {
			title: "전 력",
			titleFontColor: "#4F81BC",
			suffix: "W"
		},
		data: [{
			indexLabelFontColor: "darkSlateGray",
			name: "views",
			type: "area",
			yValueFormatString: "#,##0.0W",
			dataPoints: [
				<c:forEach items="${lightList}" var="item">
				{ x: new Date("${item.date}"),
					y: parseInt("${item.power}"),
					<c:if test="${item.state eq 1}">
					label: "ON" },
					</c:if>
					<c:if test="${item.state eq 0}">
					label: "OFF" },
					</c:if>
				</c:forEach>
			]
		}]
	});
	chart.render();
	
	}
	</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- content -->
	<div class="container-fluid padding-top">
		<div class="row padding-bottom">
			<div class="col shadow-lg">
				<!-- chart -->
				<div id="chartContainer" style="height: 300px; width: 100%;"></div>

			</div>
		</div>
		<div class="row">
			<div class="col shadow-lg">
				<c:if test="${hasData eq 0}">
				<div class="alert alert-danger " role="alert">
					데이터 없음
				</div>
				</c:if>
				<c:if test="${hasData eq 1}">
				<table class="table shadow-lg">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Power(W)</th>
							<th scope="col">Status(ON/OFF)</th>
							<th scope="col">Date</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ lightList }" var="list">
						<tr>
							<th scope="row">${list.id}</th>
							<td><span class="text-primary">${list.power}</span></td>
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
								<form action="../light/lightDelete" method="POST">
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
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>