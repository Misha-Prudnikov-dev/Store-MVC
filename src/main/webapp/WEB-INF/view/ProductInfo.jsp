<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>${productInfo.title}</title>

         <link rel="stylesheet" type="text/css" href="<spring:url value="resources/ProductInfocss.css"/>"> 
</head>
<body>
    
   
		   <main>
		   
		   <jsp:include page="menu.jsp"/>
		   
		   </main>   
    

	<div class="content">
		<section class="mb-5">
			
		  <div class="row">
		     <div class="col-md-6 mb-4 mb-md-0">
		       	<div id="mdb-lightbox-ui"></div>
		           <div class="mdb-lightbox">
		              <div class="row product-gallery mx-1">
				         <div class=" my-5" id="margin-top">
		
		  					<section class="text-center dark-grey-text mb-5">
		    
								<div class="row">
								   <div class="col-md-12 ">
			
				                         <div id="carousel-example-1z" class="carousel slide" data-ride="carousel" data-interval="false">
				         					<div class="carousel-inner" role="listbox">
				            
									            <div class="carousel-item active">
									               <img class="d-block w-100" src="<c:url value="resources/img/${productInfo.image}"/>">
									            </div>
				           
									          <c:forEach items="${productInfo.productImages}" var="element">    
									            <div class="carousel-item">
									              <img class="d-block w-100" src="<c:url value="resources/img/${element.image}"/>">
									            </div>
									         </c:forEach>     
				
				                          </div>
	
									        <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
									           <span class="" aria-hidden="true"><i class="fas fa-arrow-left fa-lg"></i></span>
									        </a>
									        <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
									           <span class="" aria-hidden="true"><i class="fas fa-arrow-right fa-lg"></i></span>
									        </a>
								       </div>
			
			                   </div>
			               </div>
			
			           </section>
	
					</div>
	       		  </div>
	           </div>
	        </div>
     
           <div class="col-md-6 product-info">
     
	      		 <h5>${productInfo.manufacturer.title}</h5>
	      		   <c:url var="openLink" value="/groupProductBySubcategory">
                        <c:param name="subcategory" value="${productInfo.subcategory.id}"/>
                   </c:url>
			      <a href="${openLink}">
			        <p class="mb-2 text-muted text-uppercase small">${productInfo.subcategory.title}</p>
			      </a>
					<c:set var="avgRating" value="${0}" />
					<c:set var="cntRating" value="${0}" />
						<c:forEach items="${reviews}" var="elementReviews">
							<c:set var="cntReviews" value="${cntReviews + 1}" />
							<c:set var="avgRating" value="${(elementReviews.rating + avgRating) / cntReviews}" />
						</c:forEach>
			      
			      <div class="rating-mini">
					     <span <c:if test="${avgRating>=1}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=2}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=3}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=4}"> class="active"</c:if>></span>	
					     <span <c:if test="${avgRating>=5}"> class="active"</c:if>></span>	
			    </div> ${fn:length(reviews)}      
      			<p><span class="mr-1"><strong>$<fmt:formatNumber value="${productInfo.price}" pattern=".00"/></strong></span></p>
      			<p class="pt-1">${productInfo.description}</p>
			    <div class="table-responsive">
			        <table class="table table-sm table-borderless mb-0">
			          <tbody>
			            <tr>
			              <th class="pl-0 w-25" scope="row"><strong><spring:message code="local.productInfo.vendorCode"/></strong></th>
			              <td>${productInfo.id}</td>
			            </tr>
			            <tr>
			              <th class="pl-0 w-25" scope="row"><strong><spring:message code="local.productInfo.color"/></strong></th>
			              <td>${productInfo.color}</td>
			            </tr>
						<tr>
			              <th class="pl-0 w-25" scope="row"><strong><spring:message code="local.productInfo.manufacturer.brand"/></strong></th>
			              	<c:url var="openLink" value="/GroupProductByManufacturer">
		                        <c:param name="manufacturerId" value="${productInfo.manufacturer.id}"/>
		                   </c:url>
			              <td><a href="${openLink}">${productInfo.manufacturer.title}</a></td>
			            </tr>
						<tr>
			              <th class="pl-0 w-25" scope="row"><strong><spring:message code="local.productInfo.brandCountry"/></strong></th>
			              <td>${productInfo.manufacturer.country}</td>
			            </tr>
			
			          </tbody>
			        </table>
			    </div>
      			<hr>
      	<form action="addToCart" method="post">
	 	   <input type="hidden" name="productId" value="${productInfo.id}" /> 
		      <div class="table-responsive mb-2">
		        <table class="table table-sm table-borderless">
		           <tbody>
		              <tr>
		          <c:if test="${productInfo.quantity>0}">
			            <td class="pl-0 pb-0 w-25"><spring:message code="local.product.quantity"/></td>
			            <td class="pb-0">
 			               <input type="number" class="form-control text-center" name="quantityProduct" min="1" max="${productInfo.quantity}" value=1>
 						</td>
						<td class="pb-0"><spring:message code="local.productInfo.size"/></td>
			              <td>
			                <div class="mt-1">
 			                <c:forEach items="${productInfo.productSize}" var="size"> 
			                  <div class="form-check form-check-inline pl-0">
			                    <c:if test="${size.quantity>0}">
			                         <input type="radio" class="form-check-input" id="small" name="productSize" value="${size.size}" checked>
 			                    	 <label class="form-check-label small text-uppercase card-link-secondary" for="small">${size.size}</label>			                    
			                    </c:if>
			                    <c:if test="${size.quantity==0}">
			                    	 <input type="radio"  class="form-check-input" id="small" name="productSize" value="${size.size}" disabled />
			                    	 <label class="form-check-label small text-uppercase card-link-secondary" for="small">${size.size}</label>
			                    </c:if>
			                  </div>
 							</c:forEach>
			             </div>
			              </td>
				 </c:if>
		             </tr>
		          </tbody>
		       </table>
		    </div>
		    <div class="btn-cart-favorites">
		    
			    <c:if test="${resultFavorites=='false' || resultFavorites==null}">
			    		   <c:url var="openLink" value="/addProductFavorites">
		                        <c:param name="productId" value="${productInfo.id}"/>
		                   </c:url>
		           <a href="${openLink}" class="btn btn-outline-danger" id="button-add-to-favorites"><i class="far fa-heart fa-lg"></i></a>
		        </c:if>
		     
			   <c:if test="${resultFavorites=='true'}">
			   			   <c:url var="openLink" value="/deleteProductFavorites">
		                        <c:param name="productId" value="${productInfo.id}"/>
		                   </c:url>
		          <a href="#" class="btn btn-outline-danger" id="button-add-to-favorites"><i class="fas fa-heart"></i></a>
		      </c:if>
		      
		      <c:if test="${! empty productInfo.productSize}">
		          <input type="submit" class="btn btn-light btn-md mr-1 mb-2 " id="button-add-to-cart" value="<spring:message code="local.productCard.addCart"/>" ></>
		      </c:if>
		      
		      <c:if test="${empty productInfo.productSize}">
		         <p class="btn btn-light btn-md mr-1 mb-2 " id="button-add-to-cart"><spring:message code="local.product.stock"/></>
		      </c:if>
		 </div>
		 <sec:csrfInput/>
	</form>		 
     </div>
  </div>

</section>

	<div class="content-review">
	  <div class=" mt-5">
	    <div class="d-flex justify-content-center row">
	       <div class="col-md-10">
	          <div class="d-flex flex-column comment-section">
      
      						<c:if test="${userShort==null}">
      						
      							<div class="bg-light p-2">
				                  <div class="d-flex flex-row align-items-start">
      									<p><a href="<c:url value="/showSignIn"/>"> <spring:message code="local.productInfo.review.signIn"/></a><spring:message code="local.productInfo.review.leaveReview"/></p>
							      </div>
							   </div>

      					  </c:if>
      
				                 <c:if test="${userShort!=null}">
				     				 <form action="addReview" method="post" >
							            <div class="bg-white">
											<div class="rating-area">
												<input type="radio" id="star-5" name="rating" value="5">
												<label for="star-5" title="Оценка «5»"></label>	
												<input type="radio" id="star-4" name="rating" value="4">
												<label for="star-4" title="Оценка «4»"></label>    
												<input type="radio" id="star-3" name="rating" value="3">
												<label for="star-3" title="Оценка «3»"></label>  
												<input type="radio" id="star-2" name="rating" value="2">
												<label for="star-2" title="Оценка «2»"></label>    
												<input type="radio" id="star-1" name="rating" value="1">
												<label for="star-1" title="Оценка «1»"></label>
												<input type="hidden" name="rating" value="0">
												
											</div>
				                	   </div>
				                	   <div class="bg-light p-2">
				                          <div class="d-flex flex-row align-items-start">
									         <img class="rounded-circle" src="<c:url value="resources/img/ac2.png"/>" width="40">
				                                <input type="hidden" name="productId" value="${productInfo.id}" />
				                                <p><textarea id="textarea" name="text" class="textarea"></textarea></p>
										  </div>
										  
											<c:if test="${param.add_review =='v_empty'}">
												<small class="form-text text-danger"><spring:message code="local.productInfo.review"/></small>
											</c:if>
								
						                    <div class="mt-2 text-right">
						                        <input type="submit" class="btn btn-primary btn-sm shadow-none" id="button-review" value="Send">
											</div>
				                	 </div>
							    </form>
							 </c:if>
							 
							<c:forEach items="${reviews}" var="review">
				                <div class="bg-white p-2">
				                    <div class="d-flex flex-row user-info">
				                        <img class="rounded-circle" src="<c:url value="resources/img/ac2.png"/>" width="40">
				                        <div class="d-flex flex-column justify-content-start ml-2">
										   <span class="d-block font-weight-bold name">${review.userShort.name} 
										      <div class="rating-mini">
											     <span <c:if test="${review.rating>=1}"> class="active"</c:if>></span>	
											     <span <c:if test="${review.rating>=2}"> class="active"</c:if>></span>	
											     <span <c:if test="${review.rating>=3}"> class="active"</c:if>></span>	
											     <span <c:if test="${review.rating>=4}"> class="active"</c:if>></span>	
											     <span <c:if test="${review.rating>=5}"> class="active"</c:if>></span>	
										     </div>      
				                          </span> 
										  <span class="date text-black-50">${review.dateAddReview}</span>
									 </div>
									 
 										<c:if test="${userShort.role.role == 'ADMIN'}">
										  <a href="delete_review_product&userId=${review.userId}&productId=${productInfo.id}"><i class="fas fa-times"></i></a>
										</c:if>
 				               </div>
				               <div class="mt-2">
				                   <p class="comment-text">${review.text}</p>
				              </div>
				           </div>
				       </c:forEach>
       
		           </div>
		       </div>
		   </div>
       </div>
    </div>
</div>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>