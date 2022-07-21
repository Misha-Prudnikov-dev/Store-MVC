<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="container mt-5">
    
    <h3 class="font-weight-bold mb-4 pb-2"><spring:message code="local.favorites"/></h3>

<div class="container cont">
    <div class="row">

     <c:forEach items="${groupProductFavorites}" var="favorites">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid6">
                <div class="product-image6">
                		  <c:url var="openLink" value="/showProductInfo">
		                        <c:param name="productId" value="${favorites.product.id}"/>
		                   </c:url>
                    <a href="${openLink}">
                        <img class="pic-1" src="<c:url value="resources/img/${favorites.product.productImage}"/>">
                    </a>
                </div>
                <div class="product-content">
                    <h3 class="title"><a href="#">${favorites.product.title}</a></h3>
                    <div class="price">$<fmt:formatNumber value="${favorites.product.price}" pattern=".00"/></div>
                </div>
                <ul class="social">
                    <c:url var="openLink" value="/deleteProductFavorites">
                        <c:param name="productId" value="${favorites.product.id}"/>
                   </c:url>
                    <li><a href="${openLink}" data-tip="<spring:message code="local.favorites.delete"/>"><i class="fas fa-trash"></i></a></li>
					<div class="rating-mini">
 	
					</div>
                </ul>
            </div>
        </div>
    </c:forEach>
</div>
</div>
</div>

<footer>
   <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>