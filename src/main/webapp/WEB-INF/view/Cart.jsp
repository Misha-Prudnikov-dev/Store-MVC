<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="<spring:url value="resources/Cart.css"/>">
  
  
<title>Red Bear`s ${cart}</title>

</head>
<body>


   
    <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>
 
     <c:if test="${param.checkout=='success'}">
        <center><h4><h4><spring:message code="local.cart.checkout.success"/></h4></center>
     </c:if>
 
     <c:if test="${ empty groupProductCart}">
         <center><h4><spring:message code="local.cart.empty"/></h4></center>
     </c:if>
     
    <c:if test="${ ! empty groupProductCart}">
 
		 <div class="container px-4 py-5 mx-auto">
		    <div class="row d-flex justify-content-center">
		        <div class="col-5">
		            <h4 class="heading"><spring:message code="local.cart"/></h4>
		        </div>
		        <div class="col-7">
		            <div class="row text-right">
		                <div class="col-4">
		                    <h6 class="mt-2"><spring:message code="local.product.quantity"/></h6>
		                </div>
		                <div class="col-4">
		                    <h6 class="mt-2"><spring:message code="local.cart.priceUnitProduct"/></h6>
		                </div>
		                <div class="col-4">
		                    <h6 class="mt-2"><spring:message code="local.product.price"/></h6>
		                </div>
						
		            </div>
		        </div>
		    </div>
		    <c:set var="total" value="${0}"/>
		    <c:forEach items="${groupProductCart}"  var="orderDetail">
			    <div class="row d-flex justify-content-center border-top">
			        <div class="col-5">
			            <div class="row d-flex">
			                <div class="book"> <img src="<c:url value="resources/img/${orderDetail.product.productImage}"/>" class="book-img"> </div>
			                <div class="my-auto flex-column d-flex pad-left">
			                    <h6 class="mob-text">${orderDetail.product.title}</h6>
			                    <p class="mob-text"><spring:message code="local.orderInfo.size"/>: ${orderDetail.productSize}</p>
			                    <p class="mob-text"><spring:message code="local.productInfo.color"/>: ${orderDetail.product.color}</p>
			                    <c:set var="total" value="${total+orderDetail.product.price*orderDetail.quantity}"/>
			                    <c:if test="${orderDetail.product.id==checkoutResponce.productId && orderDetail.productSize==checkoutResponce.productSize}">
			                        <small class="form-text text-danger"><spring:message code="local.cart.producQuantityNoStock"/></small>
			                    </c:if>
			                </div>
			            </div>
			        </div>
			        <div class="my-auto col-7">
			            <div class="row text-right">
			                <div class="col-4">
			                    <p class="mob-text">${orderDetail.quantity}</p>
			                    
			                </div>
			                <div class="col-4">
			                  <div class="row d-flex justify-content-end px-3">
							     <div class="number">
			                        $<fmt:formatNumber value="${orderDetail.product.price}" pattern=".00"/> 				
			                    </div>                    
			                 </div>
			                </div>
			                <div class="col-4">
			                    <h6 class="mob-text">$<fmt:formatNumber value="${orderDetail.product.price*orderDetail.quantity}" pattern=".00"/></h6>
			                </div>
						    <div class="col row text-right">
					       
					    <c:url var="openLink" value="/deleteProductFromCart" >
				   
				        <c:param name="productId" value="${orderDetail.product.id}"/>
				        <c:param name="productSize" value="${orderDetail.productSize}"/>
				        
						</c:url>
						<a href="${openLink}"><i class="fas fa-times"> </i></a> 
	
					       
					       </div>
			            </div>		      	
			        </div> 
			    </div>
		   </c:forEach>
		
	  <form action="checkout" method="post">

		    <div class="row justify-content-center">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="row">
		                    <div class="col-lg-3 radio-group">
			                    <spring:message code="local.payment"/>
			                    <div class="row px-2">
							       <div class="form-check col-md-6">
								      <label class="form-check-label"><spring:message code="local.payment.cash"/>
									    <input type="radio" class="form-check-input"  name="typePayment" id="gridRadios2" value="cash" checked="checked" />
						              </label>
								  </div>
							   </div>
								<div class="row px-2">
								  <div class="form-check col-md-6 ">
								     <label class="form-check-label"><spring:message code="local.payment.card"/>
									    <input type="radio" class="form-check-input"   name="typePayment" id="gridRadios3" value="card" />
						             </label>
						          </div>
							  </div>
		                    </div>
		                    <div class="col-lg-5">
		                        <div class="row px-2">
		                            <div class="form-group col-md-6"> <label class="form-control-label"><spring:message code="local.address.city"/></label> <input   id="cname" name="city"/> </div>
		                            <div class="form-group col-md-6"> <label class="form-control-label"><spring:message code="local.address.street"/></label> <input   id="cnum" name="street"/> </div>
		                        </div>
		                        <div class="row px-2">
		                            <div class="form-group col-md-6"> <label class="form-control-label"><spring:message code="local.address.numberHouse"/></label> <input   id="exp" name="numberHouse"/> </div>
		                        </div>
		                    </div>
		                    <div class="col-lg-4 mt-2">
		                        <div class="row d-flex justify-content-between px-4">
		                            <p class="mb-1 text-left"><spring:message code="local.delivery"/></p>
		                            <h6 class="mb-1 text-right">${dateDelivery}</h6>
		                        </div>
		                        <div class="row d-flex justify-content-between px-4" id="tax">
		                            <p class="mb-1 text-left"><spring:message code="local.cart.total"/> </p>
		                            <h6 class="mb-1 text-right">$<fmt:formatNumber value="${total}" pattern=".00"/></h6>
		                        </div> 
		                        <button type="submit" class="btn-block btn-blue"> <span> <span id="checkout"><spring:message code="local.cart.checkout"/></span> <span id="check-amt"></span> </span> </button>
		                      
		                       <c:if test="${param.checkout=='v_empty'}">
		                            <small class="form-text text-danger"><spring:message code="local.field.empty"/></small>
		                        </c:if>
		                        <sec:csrfInput />
		                        
		                    </div>
		                </div>
		            </div>
		        </div>
		     </div>
		</form> 
	  </div>
  </c:if>
  
  <footer>
      <jsp:include page="footer.jsp"/>
  </footer>
  
</body>
</html>