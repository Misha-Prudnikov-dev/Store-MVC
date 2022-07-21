<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Red Bear`s</title>

      <link rel="stylesheet" type="text/css" href="<spring:url value="resources/UserProfile.css"/>">
      <link rel="stylesheet" type="text/css" href="<spring:url value="resources/SignIn.css"/>">


</head>
<body>


   <main>
   
   <jsp:include page="menu.jsp"/>
   
   </main>

<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
               <img class="rounded-0 mt-5" src="<c:url value="resources/img/account.png"/>">
                 <span class="font-weight-bold">${userInfo.name}</span>
                 <span class="text-black-50">${userInfo.email}</span>
           </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right"><spring:message code="local.userInfo.personal"/></h4>
                </div>
                <form:form action="updateUser" modelAttribute="userInfo" method="post">
	                <div class="row mt-2">
	                    <div class="col-md-6"><label class="labels"><spring:message code="local.userInfo.name"/></label>
	                       <form:input   class="form-control" path="name" value="${userInfo.name}"/>
			                 <c:if test="${param.change=='fail'}">
						       <small class="form-text text-danger"><spring:message code="local.registration.fail.name"/></small>
						    </c:if>      	
	                    </div>
	                    <div class="col-md-6"><label class="labels"><spring:message code="local.userInfo.surname"/></label>
	                       <form:input   class="form-control" path="surname" value="${userInfo.surname}"/>
			                 <c:if test="${param.change=='fail'}">
						       <small class="form-text text-danger"><spring:message code="local.registration.fail.surname"/></small>
						    </c:if>      	
	                    </div>
	                </div>
	                <div class="row mt-3">
	                    <div class="col-md-12"><label class="labels"><spring:message code="local.userInfo.phone"/></label><form:input class="form-control" path="phone" value="${userInfo.phone}"/></div>
	                    <div class="col-md-12"><label class="labels"><spring:message code="local.userInfo.email"/></label><form:input type="email" class="form-control" path="email" value="${userInfo.email}"/></div>
	                    <div class="col-md-12"><label class="labels"><spring:message code="local.userInfo.dateOfBirth"/></label>
 	                     	<c:if test="${param.change=='wrong_date'}">
						       <small class="form-text text-danger"><spring:message code="local.registration.fail.date"/></small>
						    </c:if>      	
	                   </div>
	                 <div class="form-check form-check-inline">
					  <label class="form-check-label">
						<form:radiobutton class="form-check-input"  path="gender" id="inlineRadio1" value="male"/><spring:message code="local.userInfo.gender.male"/> ${male}
					  </label>
					</div>
					<div class="form-check form-check-inline">
					  <label class="form-check-label">
						<form:radiobutton class="form-check-input"  path="gender" id="inlineRadio2" value="female"/><spring:message code="local.userInfo.gender.female"/> ${female}
					  </label>
					</div>		
	                   
	                </div>
	
	                <div class="mt-5 text-center">
	                   <button class="btn btn-primary " name="updateUser" id="profile-button" type="submit"><spring:message code="local.userInfo.personal.save"/></button>
	               </div>
	               <sec:csrfInput/>
            </form:form>
         </div>
     </div>
    </div>
</div>
		
	<footer>
	    <jsp:include page="footer.jsp"/>
	</footer>											  

</body>
</html>