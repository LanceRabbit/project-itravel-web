<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

<style type="text/css">
body {
	padding: 20px;
}
#myCarousel .carousel-caption {
    left:0;
	right:0;
	bottom:0;
	text-align:left;
	padding:10px;
	background:rgba(0,0,0,0.6);
	text-shadow:none;
}

#myCarousel .list-group {
	position:absolute;
	top:0;
	right:0;
}
#myCarousel .list-group-item {
	border-radius:0px;
	cursor:pointer;
}
#myCarousel .list-group .active {
	background-color:#eee;	
}

@media (min-width: 992px) { 
	#myCarousel {padding-right:33.3333%;}
	#myCarousel .carousel-controls {display:none;} 	
}
@media (max-width: 991px) { 
	.carousel-caption p,
	#myCarousel .list-group {display:none;} 
}
</style>

</head>
<body>
	<!-- Page Content -->
	<jsp:include page="/fragment/Top.jsp" />
	<!-- Page Content -->
	<div class="container">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
      
        <div class="item active">
          <img src="http://placehold.it/760x400/cccccc/ffffff">
           <div class="carousel-caption">
            <h4><a href="#">Lorem ipsum dolor sit amet consetetur sadipscing</a></h4>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div>
        </div><!-- End Item -->
 
         <div class="item">
          <img src="http://placehold.it/760x400/999999/cccccc">
           <div class="carousel-caption">
            <h4><a href="#">consetetur sadipscing elitr, sed diam nonumy eirmod</a></h4>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div>
        </div><!-- End Item -->
        
        <div class="item">
          <img src="http://placehold.it/760x400/dddddd/333333">
           <div class="carousel-caption">
            <h4><a href="#">tempor invidunt ut labore et dolore</a></h4>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div>
        </div><!-- End Item -->
        
        <div class="item">
          <img src="http://placehold.it/760x400/999999/cccccc">
           <div class="carousel-caption">
            <h4><a href="#">magna aliquyam erat, sed diam voluptua</a></h4>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div>
        </div><!-- End Item -->

        <div class="item">
          <img src="http://placehold.it/760x400/dddddd/333333">
           <div class="carousel-caption">
            <h4><a href="#">tempor invidunt ut labore et dolore magna aliquyam erat</a></h4>
            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat. <a class="label label-primary" href="http://sevenx.de/demo/bootstrap-carousel/" target="_blank">Free Bootstrap Carousel Collection</a></p>
          </div>
        </div><!-- End Item -->
                
      </div><!-- End Carousel Inner -->


    <ul class="list-group col-sm-4">
      <li data-target="#myCarousel" data-slide-to="0" class="list-group-item active"><h4>Lorem ipsum dolor sit amet consetetur sadipscing</h4></li>
      <li data-target="#myCarousel" data-slide-to="1" class="list-group-item"><h4>consetetur sadipscing elitr, sed diam nonumy eirmod</h4></li>
      <li data-target="#myCarousel" data-slide-to="2" class="list-group-item"><h4>tempor invidunt ut labore et dolore</h4></li>
      <li data-target="#myCarousel" data-slide-to="3" class="list-group-item"><h4>magna aliquyam erat, sed diam voluptua</h4></li>
      <li data-target="#myCarousel" data-slide-to="4" class="list-group-item"><h4>tempor invidunt ut labore et dolore magna aliquyam erat</h4></li>
    </ul>

      <!-- Controls -->
      <div class="carousel-controls">
          <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
          </a>
          <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
          </a>
      </div>

    </div><!-- End Carousel -->
</div>

<script type="text/javascript">
		$(document).ready(function(){
		    
			var clickEvent = false;
			$('#myCarousel').carousel({
				interval:   4000	
			}).on('click', '.list-group li', function() {
					clickEvent = true;
					$('.list-group li').removeClass('active');
					$(this).addClass('active');		
			}).on('slid.bs.carousel', function(e) {
				if(!clickEvent) {
					var count = $('.list-group').children().length -1;
					var current = $('.list-group li.active');
					current.removeClass('active').next().addClass('active');
					var id = parseInt(current.data('slide-to'));
					if(count == id) {
						$('.list-group li').first().addClass('active');	
					}
				}
				clickEvent = false;
			});
		})
		
		$(window).load(function() {
		    var boxheight = $('#myCarousel .carousel-inner').innerHeight();
		    var itemlength = $('#myCarousel .item').length;
		    var triggerheight = Math.round(boxheight/itemlength+1);
			$('#myCarousel .list-group-item').outerHeight(triggerheight);
		});
</script>
</body>
</html>