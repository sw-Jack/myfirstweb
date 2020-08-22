<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!--자동 슬라이드 기능인 Carousel 활성화-->
    <script>
  	// 슬라이드 전환 속도 변경
    $('.carousel').carousel({
        interval: 2000 
    })
    </script>
</head>

<body>
 	<jsp:include page="include/header.jsp"/>
    <div class="container"> 
        <div class="row">
            <div class="box">
              <div class="col-lg-6 text-center">
             	   <!-- data-ride="carousel" 자동 슬라이드 기능 -->
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                       
                        <ol class="carousel-indicators hidden-xs">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive img-full" src="img/1.jpg">
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/2.jpg"> <!-- img-full 옵션 class -->
                            </div>
                            <div class="item">
                                <img class="img-responsive img-full" src="img/3.jpg">
                            </div>
                        </div>
                       	
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="icon-prev"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="icon-next"></span>
                        </a>
                    </div>
                </div>
            
                <div class="col-lg-6 text-center" >    
						<h2> 환영합니다 </h2>
						<p>
							축구 선수 손흥민의 팬클럽 페이지입니다 ^^
						</p>
						<hr>
						<h3>스페셜 영상</h3>
						<iframe width="100%" height="372px" src="https://www.youtube.com/embed/ZufBjcxgY0s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>></iframe>
                 </div>   
            </div> 
        </div>

        <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>런던 현지 토트넘 경기 원정 응원단 모집</strong>
                    </h2>
                    <hr>
		                <div class="inner" align="center">
		                    <img class="img-responsive img-center" src="img/intro.jpg" alt=""><!-- img-border --> 
		                    <hr class="visible-xs">
		                    <p>* 손흥민 선수를 위해 런던 현지로 원정 응원을 떠날 팬 분들을 모집하고 있습니다. <br> 
		                    * 원정 응원을 희망하시는 분들은 게시판에 신청 글을 남겨주세요. <br> 
		                    * 추첨을 통해 당첨되신 5명의 팬 분들은 원정 응원 경비를 지원해드립니다. 
		                    </p>
	                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="include/footer.jsp"/>
</body>
</html>






