<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>IoTivity :: Home</title>
	<style type="text/css">
		.padding-top {
			padding-top: 20px;
		}
		.padding-bottom {
			padding-bottom: 10px;
		}	
		#wrap {
		  display: -webkit-box;
		  display: -webkit-flex;
		  display: -ms-flexbox;
		  display: flex;
		  -webkit-box-align: center;
		  -webkit-align-items: center;
		      -ms-flex-align: center;
		          align-items: center;
		  -webkit-box-pack: center;
		  -webkit-justify-content: center;
		      -ms-flex-pack: center;
		          justify-content: center;
		  height: 10vh;
		}
		
		#app {
		  letter-spacing: 0.25em;
		  text-transform: uppercase;
		}
				
	</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- content -->
	<img src="${pageContext.request.contextPath}/resources/images/house-banner-cut-final.jpg" class="img-fluid" alt="Error image">
	<div class="container-fluid padding-top">
		<div class="row">
			<div class="col">
				
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>