<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Button trigger modal -->
	<div class="container">

		<ul class="nav nav-tabs">
			<li class="active"><a href="#Myadvert" data-toggle="tab">廣告</a></li>
			<li class=""><a href="#Mycoupon" data-toggle="tab">coupon</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="Myadvert">
				<p>廣告</p>
				<div class="container">
					<div class="container">
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#ADModal">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>


				</div>

			</div>
			<div class="tab-pane fade" id="Mycoupon">
				<p>coupon</p>
				<div class="container">
					<div class="container">
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#CouponModal">
							<span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>


				</div>
			</div>


		</div>




	</div>

	<!-- upload ADModal -->
	<div class="modal fade" id="ADModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myADModalLabel">上傳廣告</h4>
				</div>
				<div class="modal-body">
					<div class="row">						
						<div class="col-sm-4">
							<div id="example">									
								<div>
									<div class="demo-section k-header">
										<input name="files" id="files" type="file" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetBtn" type="button" class="btn btn-default"
						data-dismiss="modal">放棄</button>					
				</div>
			</div>			
		</div>
	</div>
	
	<!-- upload CouponModal -->
	<div class="modal fade" id="CouponModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myCouponModalLabel">上傳Coupon</h4>
				</div>
				<div class="modal-body">
					<div class="row">						
						<div class="col-sm-4">
							<div id="example">									
								<div>
									<div class="demo-section k-header">
										<input name="files" id="files" type="file" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- <div class="modal-body"> -->

				<div class="modal-footer">
					<button id="resetBtn" type="button" class="btn btn-default"
						data-dismiss="modal">放棄</button>					
				</div>
			</div>			
		</div>
	</div>
	
	
	
	<jsp:include page="/fragment/bottom.jsp" />
</body>
</html>