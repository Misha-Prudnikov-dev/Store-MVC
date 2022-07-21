<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
      <link rel="stylesheet" type="text/css"  href="<spring:url value="resources/GroupProduct.css"/>"/>

</head>
<body>

   <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>

 <section>

  <!--Carousel Wrapper-->
  <div id="carousel-example-2" class="carousel slide carousel-fade" data-ride="carousel">
    <!--Indicators-->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-2" data-slide-to="1"></li>
      <li data-target="#carousel-example-2" data-slide-to="2"></li>
    </ol>
    <!--/Indicators-->
    <!--Slides-->
    <div class="carousel-inner" role="listbox">
      <div class="carousel-item active">
        <div class="view">
          <img class="d-block w-100" src="././resources/img/banner/b1.jpg"
            alt="First slide">
          <a href="#!">
            <div class="mask rgba-black-light"></div>
          </a>
        </div>
        <div class="carousel-caption">
          <h3 class="h3-responsive">First shop item</h3>
          <p>First text</p>
        </div>
      </div>
      <div class="carousel-item">
        <!--Mask color-->
        <div class="view">
          <img class="d-block w-100" src="././resources/img/banner/b2.jpg"
            alt="Second slide">
          <a href="#!">
            <div class="mask rgba-black-light"></div>
          </a>
        </div>
        <div class="carousel-caption">
          <h3 class="h3-responsive">Second shop item</h3>
          <p>Secondary text</p>
        </div>
      </div>
      <div class="carousel-item">
        <!--Mask color-->
        <div class="view">
          <img class="d-block w-100" src=" "
            alt="Third slide">
          <a href="#!">
            <div class="mask rgba-black-light"></div>
          </a>
        </div>
        <div class="carousel-caption">
          <h3 class="h3-responsive">Third shop item</h3>
          <p>Third text</p>
        </div>
      </div>
    </div>
    <!--/Slides-->
    <!--Controls-->
    <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    <!--/Controls-->
  </div>
  <!--/Carousel Wrapper-->

</section>
 
 <div class="container cont">
		
		
</div>
 
  
   
   <footer>
   
   <jsp:include page="footer.jsp"/>
   
   </footer>
   

</body>
</html>