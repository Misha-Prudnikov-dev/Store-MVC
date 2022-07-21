<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Subcategory</title>

      <link rel="stylesheet" type="text/css" href="<spring:url value="resources/GroupProduct.css"/>">

</head>
<body>

   <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>
      
<div class="container cont">
    <h3 class="h3"> </h3>
    <div class="row">
   
   <c:forEach items="${groupSubcategory}" var="subcategory">
        <div class="col-md-3 col-sm-6">
            <div class="product-grid6">
                <div class="product-image6">
                  <c:url var="openLink" value="/groupProductBySubcategory">
                     <c:param name="subcategory" value="${subcategory.id}"/>
                  </c:url>
                    <a href="${openLink}">
                        <img class="pic-1" src="<c:url value="resources/img/subcategory/${subcategory.image}"/>">
                    </a>
                 
                </div>
                <div class="product-content ">
                    <h3 class="title"><a href="${openLink}">${subcategory.title}</a></h3>
                </div>
                <div class="social">
                    <h3 class="title"><a href="${openLink}">${subcategory.title}</a></h3>
                </div>
				
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