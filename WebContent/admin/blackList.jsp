<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<title>黑名單</title>
<style>
.container{
	font-family:Microsoft JhengHei;
}
.nav-tabs{
	font-weight: bold;
}

.table-hover{

}
table {
    table-layout:fixed;
}
#idBlackTable td{
    word-break: break-all;
    text-overflow: ellipsis;
    padding:8px 1px 8px 5px;
    vertical-align:middle;
}
.table-adela-black{
	border-collapse: collapse;
}
.table-adela-black td{
	border:1px solid #E0E0E0;
}

</style>
</head>
<body>
<jsp:include page="/fragment/Top.jsp"/>

<div class="container">
<ul class="nav nav-tabs">
  <li class="active"><a href="#blackListWaiting" data-toggle="tab" >待處理</a></li>
  <li class="" id="idShiftToTempBlack"><a href="#idTempLockedList" data-toggle="tab">暫時停權名單</a></li>
  <li class="" id="idShiftToPermBlack"><a href="#frozenList" data-toggle="tab">永久停權名單</a></li>
</ul>

<div id="myTabContent" class="tab-content">
  <div class="tab-pane fade active in" id="blackListWaiting">
  	<table class="table table-striped table-hover table-adela-black" id="idBlackTable" style="width:100%">
	  <col style="width:3%"/>
	  <col style="width:10%"/>
	  <col style="width:10%"/>
	  <col style="width:8%"/>
	  <col style="width:10%"/>
	  <col style="width:20%"/>
	  <col style="width:20%"/>
	  <col style="width:13%"/>
	  <col style="width:6%"/>
	  <thead>
	    <tr>
	      <th>#</th>
	      <th>檢舉人</th>
	      <th>被檢舉人</th>
	      <th>身分</th>
	      <th>舉報日期</th>
	      <th>評論內容</th>
	      <th>檢舉理由</th>
	      <th>狀態</th>
	      <th>確認</th>
	    </tr>
	  </thead>
	  <tbody id="tbBlackList">
	  </tbody>
	</table> 
  </div>
  <div class="tab-pane fade" id="idTempLockedList">
  	<table class="table table-striped table-hover table-adela-black" id="idTempBlackTable" style="width:50%">
		 <col style="width:5%"/>
	  	 <col style="width:14%"/>
	  	 <col style="width:8%"/>
	 	 <col style="width:15%"/>
	 	 <col style="width:8%"/>
		 <thead>
		   <tr>
		     <th>#</th>
		     <th>帳號</th>
		     <th>身分</th>
		     <th>權限恢復日期</th>
		     <th>恢復權限</th>
		   </tr>
	 	</thead>
	 	<tbody id="tbTempBlackList">
	 	</tbody>
	</table> 
  </div>
  <div class="tab-pane fade" id="frozenList">
  	<table class="table table-striped table-hover table-adela-black" id="idPermBlackTable" style="width:35%">
		 <col style="width:5%"/>
	  	 <col style="width:14%"/>
	  	 <col style="width:8%"/>
	 	 <col style="width:8%"/>
		 <thead>
		   <tr>
		     <th>#</th>
		     <th>帳號</th>
		     <th>身分</th>
		     <th>恢復權限</th>
		   </tr>
	 	</thead>
	 	<tbody id="tbPermBlackList">
	 	</tbody>
	</table>
  </div>
</div>
</div>

<div id="idConfirmReinstateBlack" class="modal fade" style="margin-top:100px">
  <div class="modal-dialog modal-jumpout">
    <div class="modal-content">
    	<div class="adela-modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="adela-modal-title" id="myModalLabel" style="height:30px;padding-top:5px"><i class="fa fa-exclamation-circle fa-lg"></i></h4>
      </div>
      <!-- dialog body -->
      <div class="top-modal-body" style="color:red;font-size:14px;margin-left:20px"></i>
        	立刻恢復使用者權限？
      </div>
      <!-- dialog buttons -->
      <div class="modal-footer"><button type="button" class="btn btn-primary" id="btReinstateOK">確定</button></div>
    </div>
  </div>
</div>
<label id="idAccountIdPrepared" hidden></label>

<jsp:include page="/fragment/bottom.jsp"/>
<script>
jQuery(document).ready(	function() {
	var count = 1;
	jQuery.ajax({
		url : '<c:url value='/controller/GetInitialBlacklistServlet' />',
		type : "GET",
		contentType : "application/json; charset=utf-8",
		async : false,
		dataType : "json",	
		success : function(data) {									
			if(data.length!=0){
				jQuery.each(data,function(index,value) {				
					jQuery('#tbBlackList').append(
							"<tr><td name='count'>"+count+"</td><td name='reporter'>"
							+value.Reporter+"</td><td name='reported'>"+value.Reported+"</td><td>"+value.AccountLevel+"</td><td>"
							+value.ReportDate+"</td><td id='"+value.CommentId+"' name='comment'>"+value.Comment+"</td><td>"
							+value.Reason+"</td><td><select><option value='0'>不處分</option><option value='1'>停權一週</option><option value='2'>停權兩週</option><option value='4'>停權一個月</option><option value='9'>永久停權</option></select></td><td><input type='button' value='確定' name='btConfirmBlack'></td></tr>");
					count++;
					
				});
			}else{											
					jQuery('#tbBlackList').append("<tr><td colspan='3' style='font-size:14px;font-weight:bold;background:white;'>無待處理名單</td></tr>");	
					
			
			}
		}
		
		
		
	});
	jQuery('#tbBlackList ').on('click','[name="btConfirmBlack"]',function(){
		$(this).attr("id","idSelectTr");
		var punish = $(this).parents('tr').find('option:selected').val();
		var reporter = $(this).parents('tr').find('[name="reporter"]').text();
		var reported = $(this).parents('tr').find('[name="reported"]').text();
		var commentId = $(this).parents('tr').find('[name="comment"]').attr("id");
		jQuery.ajax({
			url : '<c:url value='/controller/ManageBlacklistServlet'/>',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "text",	
			data : {punish:punish, reporter:reporter, reported:reported, commentId:commentId},						
			success : function(data) {
				if (data == 'true') {
					$("#idSelectTr").val('完成');
					$("#idSelectTr").attr("disabled","disabled");
					$("#idSelectTr").removeAttr("id");
				} else {
					alert('Something Wrong!');
					
				}
			}				
		});	
		
     });
	
	jQuery("#idShiftToTempBlack").on('click', function(){
		jQuery('#tbTempBlackList').empty();
		var count = 1;
		jQuery.ajax({
			url : '<c:url value='/controller/GetTempBlacklistServlet' />',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "json",	
			success : function(data) {									
				if(data.length!=0){
					jQuery.each(data,function(index,value) {				
						jQuery('#tbTempBlackList').append(
								"<tr><td name='count'>"+count+"</td><td name='accountId'>"
								+value.AccountId+"</td><td>"+value.AccountLevel+"</td><td>"
								+value.Deadline+"</td><td><input type='button' value='恢復' id='"+value.AccountId+"' name='btReinstateBlack'></td></tr>");
								
						count++;
						
					});
				}else{											
						jQuery('#tbTempBlackList').append("<tr><td colspan='5' style='font-size:14px;font-weight:bold;background:white;'>無暫時停權名單</td></tr>");	
						
				
				}
			}
			
			
			
		});
	});
	
	jQuery("#idShiftToPermBlack").on('click', function(){
		jQuery('#tbPermBlackList').empty();
		var count = 1;
		jQuery.ajax({
			url : '<c:url value='/controller/GetPermBlacklistServlet' />',
			type : "GET",
			contentType : "application/json; charset=utf-8",
			async : false,
			dataType : "json",	
			success : function(data) {									
				if(data.length!=0){
					jQuery.each(data,function(index,value) {				
						jQuery('#tbPermBlackList').append(
								"<tr><td name='count'>"+count+"</td><td name='accountId'>"
								+value.AccountId+"</td><td>"+value.AccountLevel+"</td><td><input type='button' value='恢復' id='"+value.AccountId+"' name='btReinstateBlack'></td></tr>");
								
						count++;
					});
				}else{											
						jQuery('#tbPermBlackList').append("<tr><td colspan='4' style='font-size:14px;font-weight:bold;background:white;'>無永久停權名單</td></tr>");	
						
				
				}
			}
			
			
			
		});
	});
	
	

});
jQuery('#tbTempBlackList').on('click','[name="btReinstateBlack"]',function(){
	var aId = $(this).attr('id');
	$('#idAccountIdPrepared').html(aId);
	$("#idConfirmReinstateBlack").modal('show');
});
jQuery('#tbPermBlackList').on('click','[name="btReinstateBlack"]',function(){
	var aId = $(this).attr('id');
	$('#idAccountIdPrepared').html(aId);
	$("#idConfirmReinstateBlack").modal('show');
});
jQuery("#btReinstateOK").click(function(){
	jQuery("#idConfirmReinstateBlack").modal('hide');
	var accountIdPrepared = $('#idAccountIdPrepared').html();
	console.log(accountIdPrepared);
	jQuery.ajax({
		url : '<c:url value='/controller/ReinstateBlacklistServlet'/>',
		type : "GET",
		contentType : "application/json; charset=utf-8",
		async : false,
		dataType : "text",	
		data : {accountId:accountIdPrepared},						
		success : function(data) {
			console.log('Reinstate Finished= '+data);
			if (data == 'true') {
				$('#'+accountIdPrepared+'').val('完成');
				$('#'+accountIdPrepared+'').attr("disabled","disabled");
			} else {
				alert('Something Wrong!');
				
			}
		}				
	});	
});


</script>

</body>
</html>