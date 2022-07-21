<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="<spring:url value="resources/GroupProduct.css"/>"/>
      
</head>
<body>

   <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>

<div class="container cont">
    <div class="row">
     <c:forEach items="${groupProduct}" var="product">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid6">
                <div class="product-image6">
                   <c:url var="openLink" value="/showProductInfo">
                        <c:param name="productId" value="${product.id}"/>
                   </c:url>
                    <a href="${openLink}">
                        <img class="pic-1" src="<c:url value="resources/img/${product.productImage}"/>">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="${openLink}">${product.title}</a></h3>
                    <div class="price">$<fmt:formatNumber value="${product.price}" pattern=".00"/></div>
                </div>
                <ul class="social">
              		    <c:url var="openLink" value="/addProductFavorites">
                          <c:param name="productId" value="${product.id}"/>
                        </c:url>
                    <li><a href="${openLink}" data-tip="<spring:message code="local.productCart.addFavorites"/>"><i class="fa fa-heart"></i></a></li>
					
					<c:set var="avgRating" value="${0}" />
					<c:set var="cntRating" value="${0}" />
						<c:forEach items="${product.review}" var="elementReviews">
							<c:set var="cntReviews" value="${cntReviews + 1}" />
							<c:set var="avgRating" value="${(elementReviews.rating + avgRating) / cntReviews}" />
						</c:forEach>
					
					
					<div class="rating-mini">
					     <span <c:if test="${avgRating>=1}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=2}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=3}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=4}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=5}"> class="active"</c:if>></span>	
					</div>
                </ul>
            </div>
        </div>
	</c:forEach>	
    </div>
</div>

<footer>

   <jsp:include page="footer.jsp"/>

</footer>

</body>
</html>