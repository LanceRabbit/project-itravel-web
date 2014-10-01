<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- 如果從Google下載失敗，我們就從自己的Server上下載jQuery.js檔 -->
<script>!window.jQuery && document.write("<script src='${pageContext.request.contextPath}/js/jquery-1.11.1.min.js'><\/script>")</script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="<c:url value="/css/bootstrap.min.css"/>" rel="stylesheet">
<link href="<c:url value="/css/jquery.datetimepicker.css"/>" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/jquery.datetimepicker.js"></script>
<style>
#myModalLabel {
	text-align: center;
	font-family: 微軟正黑體;
	font-weight: bold;
}

#createtrip {
	margin: 5px;
	padding: 5px;
}

.form-control {
	font-size: 20px;
}

.modal-body {
	font-size: 20px;
	font-family: 微軟正黑體;
}
</style>


</head>
<body>
	<div class="row text-center">
		<h3>The Large Modal</h3>
		<a href="#" class="btn btn-lg btn-primary" data-toggle="modal"
			data-target="#addTripModal">Click to open Modal</a>
	</div>

	<div class="modal fade" id="addTripModal" tabindex="-1" role="dialog"
		aria-labelledby="addTripModal" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="myModalLabel">新增行程</h3>
				</div>
				<div class="modal-body">
					<form action="#"
						method="POST">
						<table>
							<tr>
								<td style="font-weight: bold; width: 100px">行程名稱：</td>
								<td><input type="text" name="email" class="form-control"
									required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">起始日期：</td>
								<td><input id="date_timepicker_start" type="text"
									class="form-control" required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td style="font-weight: bold;">結束日期：</td>
								<td><input id="date_timepicker_end" type="text"
									class="form-control" required></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td><input id="total_day" type="text" ></td>
							</tr>
						</table>
				</div>
				<div class="modal-footer">
					<button id="test" type="button" class="btn btn-default" id="idClickSignup"
						data-dismiss="modal">取消</button>
					<input type="submit" class="btn btn-info" value="繼續" />
				</div>
				</form>
			</div>
		</div>
	</div>

<script>
(function($) {
		$("#date_timepicker_end").change(function(){
			var date1 = new Date($('#date_timepicker_start').val());
			var date2 = new Date($('#date_timepicker_end').val());

			$("#total_day").val(Date.daysBetween(date1, date2));
			
		})
		 $('#date_timepicker_start').datetimepicker({
			  format:'Y/m/d',
			  startDate:0,
			  closeOnDateSelect:true,
			  onShow:function( ct ){
			   this.setOptions({
				minDate:jQuery('#date_timepicker_end').val()?new Date(Date.reduceDay(new Date($('#date_timepicker_end').val()))):0,
			    maxDate:jQuery('#date_timepicker_end').val()?jQuery('#date_timepicker_end').val():false
			    		
			   })
			  },
			  timepicker:false
		 });
		 
		 
		 $('#date_timepicker_end').datetimepicker({
			  format:'Y/m/d',
			  startDate:0,
			  
			 
			  closeOnDateSelect:true,
			  onShow:function( ct ){
				  console.log($('#date_timepicker_start').val());
				  console.log(Date.addFiveDay(new Date($('#date_timepicker_start').val())));
				  console.log($('#date_timepicker_start').val().length);
				  this.setOptions({
					    minDate:(jQuery('#date_timepicker_start').val().length!=0)?jQuery('#date_timepicker_start').val():0,
					    maxDate:(jQuery('#date_timepicker_start').val().length!=0)?new Date(Date.addFiveDay(new Date($('#date_timepicker_start').val()))):false,
				  })
			  },
			  timepicker:false
		 });
			
		
	$('#addTripModal').on('hidden.bs.modal', function (e) {
		console.log($('#date_timepicker_start').val());
		console.log($('#date_timepicker_end').val());
		var date1 = new Date($('#date_timepicker_start').val());
		var date2 = new Date($('#date_timepicker_end').val());

		console.log( 'Days since ' 
		           + date1 + ': ' 
		           + Date.daysBetween(date1, date2));	
		


		});
		Date.addFiveDay = function(day) {
			  var one_day=1000*60*60*24;
			  var day_ms = day.getTime();
			  return day_ms + (one_day*4); 
		};
		Date.reduceDay = function(day) {
			  var one_day=1000*60*60*24;
			  var day_ms = day.getTime();
			  return day_ms - (one_day*4); 
		};
	
		Date.daysBetween = function( date1, date2 ) {
		  //Get 1 day in milliseconds
		  var one_day=1000*60*60*24;

		  // Convert both dates to milliseconds
		  var date1_ms = date1.getTime();
		  var date2_ms = date2.getTime();

		  // Calculate the difference in milliseconds
		  var difference_ms = date2_ms - date1_ms;
		    
		  // Convert back to days and return
		  return Math.round(difference_ms/one_day)+1; 
		}


		
})(jQuery);
</script>
</body>
</html>