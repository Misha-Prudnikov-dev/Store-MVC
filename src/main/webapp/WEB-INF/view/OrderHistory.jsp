<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Red Bear`s <spring:message code="local.orderHistory.orderDetail"/></title>
      <link rel="stylesheet" type="text/css" href="<spring:url value="resources/Cart.css"/>"/>
      
</head>
<body>


   <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>


 <div class="container px-4 py-5 mx-auto">
	    <div class="row d-flex justify-content-center">
	        <div class="col-5">
	            <h4 class="heading"><spring:message code="local.orderHistory.order"/></h4>
	        </div>
	    </div>

		<c:forEach items="${groupOrder}" var="order">
	
			    <div class="row justify-content-center">
			        <div class="col-lg-12">
			            <div class="card">
			                <div class="row">
			                    <div class="col-lg-4 ">
			
			                        <div class="row d-flex justify-content-between px-4">
			                            <p class="mb-1 text-left"><spring:message code="local.orderHistory.order"/></p>
			                            <h6 class="mb-1 text-right">№${order.id}</h6>
			                        </div>
									<div class="row d-flex justify-content-between px-4">
			                            <p class="mb-1 text-left"><spring:message code="local.orderHistory.checkoutDate"/></p>
			                            <h6 class="mb-1 text-right">${order.dateOrder}</h6>
			                        </div>
									<div class="row d-flex justify-content-between px-4">
			                            <p class="mb-1 text-left"><spring:message code="local.orderHistory.deliveryDate"/></p>
			                            <h6 class="mb-1 text-right">${order.delivery.dateDelivery}</h6>
			                        </div>
			
			                    </div>
			                    <div class="col-lg-4 mt-2">
									<div class="row d-flex justify-content-between px-4">
			
			                        </div>
			                    </div>
			                    <div class="col-lg-4 mt-2">
			                        <div class="row d-flex justify-content-between px-4">
			                            <p class="mb-1 text-left"><spring:message code="local.orderHistory.status"/></p>
			                            <c:if test="${order.status=='ORDER'}">
			                               <h6 class="mb-1 text-right"><spring:message code="local.orderHistory.status.order"/></h6>
			                            </c:if>
			                            <c:if test="${order.status=='BOUGHT'}">
			                               <h6 class="mb-1 text-right"><spring:message code="local.orderHistory.status.bought"/></h6>
			                           </c:if>
			                            
			                       </div>
			                        <div class="row d-flex justify-content-between px-4" id="tax"></div>
				                      <form action="showOrderHistoryInfo" method="post">
				                        <input type="hidden" name="id_order" value="${order.id}">
										<button type="submit" class="btn-block btn-blue" > <span> <span id="checkout"><spring:message code="local.orderHistory.orderDetail"/></span> <span id="check-amt"></span> </span> </button>
				                    <sec:csrfInput/>
				                    </form>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
 		</c:forEach>   
	</div>

	<footer>
	  <jsp:include page="footer.jsp"/>
	</footer>

</body>
</html>