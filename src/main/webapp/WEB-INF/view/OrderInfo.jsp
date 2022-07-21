<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Red Bear`s <spring:message code="local.orderHistory.order"/></title>

<link rel="stylesheet"  href="<spring:url value="resources/Cart.css"/>">

   <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>


</head>
<body>

 <div class="container px-4 py-5 mx-auto">
    <div class="row d-flex justify-content-center">
        <div class="col-5">
            <h4 class="heading"><spring:message code="local.orderHistory.order"/> №${order.id}</h4>
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
	 <c:forEach items="${order.orderDetails}"  var="orderDetail">
	    <div class="row d-flex justify-content-center border-top">
	        <div class="col-5">
	            <div class="row d-flex">
	                <div class="book"> <img src="<c:url value="resources/img/${orderDetail.product.productImage}"/>"  class="book-img"> </div>
	                <div class="my-auto flex-column d-flex pad-left">
	                    <h6 class="mob-text">${orderDetail.product.title}</h6>
	                    <p class="mob-text"><spring:message code="local.orderInfo.size"/>: ${orderDetail.productSize}</p>
	                    <p class="mob-text"><spring:message code="local.productInfo.color"/>: ${orderDetail.product.color}</p>
	                    <c:set var="total" value="${total+orderDetail.product.price*orderDetail.quantity}"/>
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
	                        <p>$<fmt:formatNumber value="${orderDetail.product.price}" pattern=".00"/> </p> 				
	                    </div>                    
	                 </div>
	                </div>
	                <div class="col-4">
	                    <h6 class="mob-text">$<fmt:formatNumber value="${orderDetail.product.price*orderDetail.quantity}" pattern=".00"/></h6>
	                </div>
				    <div class="col row text-right">
			       </div>
	            </div>		      	
	        </div> 
	    </div>
	 </c:forEach>
	
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="row px-2">
                            <div class="form-group col-md-10"> <label class="form-control-label"><spring:message code="local.payment"/>:</label>
		                        
		                        <c:forEach items="${order.payment}" var="payment">
		                        
		                        ${payment.typePayment}
		                        
		                        </c:forEach>
		                        
		                          <spring:message code="local.payment.cash"/> 
		                          <spring:message code="local.payment.card"/> 
                                 
                                 <label class="form-control-label"><spring:message code="local.orderHistory.status"/>:</label>
			                     <c:if test="${order.status=='ORDER'}"><spring:message code="local.orderHistory.status.order"/></c:if>
			                     <c:if test="${order.status=='BOUGHT'}"><spring:message code="local.orderHistory.status.bought"/></c:if>
                            </div>                            
						</div>
                    </div>
                    <div class="col-lg-5">
                        <div class="row px-2">
                            <div class="form-group col-md-6"> <label class="form-control-label"><spring:message code="local.address.city"/>:</label>  ${order.delivery.address.city} </div>
                            <div class="form-group col-md-6"> <label class="form-control-label"><spring:message code="local.address.street"/>:</label>  ${order.delivery.address.street} </div>
                        </div>
                        <div class="row px-2">
                            <div class="form-group col-md-6"> <label class="form-control-label"><spring:message code="local.address.numberHouse"/>:</label>  ${order.delivery.address.numberHouse}</div>
                        </div>
                    </div>
                    <div class="col-lg-4 mt-2">
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left"><spring:message code="local.orderHistory.checkoutDate"/></p>
                            <h6 class="mb-1 text-right">${order.dateOrder}</h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4">
                            <p class="mb-1 text-left"><spring:message code="local.orderHistory.deliveryDate"/></p>
                            <h6 class="mb-1 text-right">${order.delivery.dateDelivery}</h6>
                        </div>
                        <div class="row d-flex justify-content-between px-4" id="tax">
                            <p class="mb-1 text-left"><spring:message code="local.cart.total"/></p>
                            <h6 class="mb-1 text-right">$<fmt:formatNumber value="${total}" pattern=".00"/></h6>
                        </div> 
                        <button type="submit" class="btn-block btn-blue"><span id="checkout"><spring:message code="local.orderInfo.cancel"/></span></button>
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