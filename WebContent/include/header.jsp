<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html>
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <title>Welcome to Son's World</title>

    <!-- Bootstrap Core CSS -->
    <link href="/SonFanPage/css/bootstrap.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/SonFanPage/css/business-casual.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">
	
	 <!-- jQuery -->
    <script src="/SonFanPage/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/SonFanPage/js/bootstrap.min.js"></script>

</head>
<body>

<!-- header -->
	<div class="brand">Son's Fan Page</div>        
    <div class="address-bar">Welcome to Son's world</div>
		
    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
                <a class="navbar-brand">My First Web</a>
            </div>
           
           <!-- 게시판 카테고리 나타내는 부분, 카테고리를 누르면 해당 페이지로 이동 -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                	
                    <li>
                        <a href="/SonFanPage">HOME</a>
                    </li>
                    <li>
                        <a href="/SonFanPage/profile/profile.jsp">Profile</a>
                    </li>
                    <li>
                        <a href="/SonFanPage/board/list.board">BOARD</a>
                    </li>
                    
                    <c:choose>    
              		<c:when test="${sessionScope.user_id == null }">
                    <%-- if(session.getAttribute("user_id") == null) { --%>
                    <li>
                        <a href="/SonFanPage/user/user_login.jsp">LOGIN</a>
                    </li>
                    <li>
                        <a href="/SonFanPage/user/user_join.jsp" style="color:red">JOIN</a>
                    </li>
                    </c:when>
                    <c:otherwise>
                    <%-- } else { --%>
                     <li>
                        <a href="/SonFanPage/user/user_logout.jsp">LOGOUT</a>
                    </li>
                    <li>
                        <a href="/SonFanPage/user/user_mypage.jsp" style="color:red">MyPage</a>
                    </li>
                    <%-- } --%>
                    </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
 	<!-- end header -->
</body>
</html>