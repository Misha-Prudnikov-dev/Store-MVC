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
<title>Red Bear`s </title>

<link rel="stylesheet" href="<spring:url value="resources/SignIn.css"/>">

              


</head>
<body>


   <main>
   
       <jsp:include page="menu.jsp"/>
   
   </main>


<div class="signup-form">
     <form:form action="registration" modelAttribute="userInfo" method="post">
      	<div class="row">
        	<div class="col-8 offset-4">
				<h2><spring:message code="local.registration"/></h2>
			</div>	
      	</div>			
        <div class="form-group row">
			<label class="col-form-label col-4"><spring:message code="local.userInfo.name"/></label>
			<div class="col-8">
                <form:input   class="form-control" path="name" name="name"/>
                 <c:if test="${param.registration=='invalid_input'}">
			       <small class="form-text text-danger"><spring:message code="local.registration.fail.name"/></small>
			    </c:if>        	
                
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4"><spring:message code="local.userInfo.surname"/></label>
			<div class="col-8">
                <form:input  class="form-control" path="surname" name="surname"/>
                 <c:if test="${param.registration=='invalid_input'}">
			       <small class="form-text text-danger"><spring:message code="local.registration.fail.surname"/></small>
			    </c:if>     	
                
            </div>        	
        </div>		
		<div class="form-group row">
			<label class="col-form-label col-4"><spring:message code="local.userInfo.email"/></label>
			<div class="col-8">
                <form:input type="email" class="form-control" path="email" name="email" />
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4"><spring:message code="local.userInfo.phone"/></label>
			<div class="col-8">
                <form:input   class="form-control" path="phone" name="phone"/>
            </div>        	
        </div>		
		<div class="form-group row">
			<label class="col-form-label col-4"><spring:message code="local.userInfo.password"/></label>
			<div class="col-8">
                <form:password class="form-control" path="password" name="password"/>
                 <c:if test="${param.registration=='invalid_input'}">
			       <small class="form-text text-danger"><spring:message code="local.registration.fail.password"/></small>
			    </c:if>
                 <c:if test="${param.registration=='duplicate'}">
			       <small class="form-text text-danger"><spring:message code="local.registration.fail.duplicate"/></small>
			    </c:if>       	
			          	
            </div>        	
        </div>
		<div class="form-group row">
		  <label for="example-date-input" class="col-4 col-form-label"> </label>
		  <div class="col-8">
			<form:input class="form-control" type="date" path="dateOfBirth"    id="example-date-input"/>
			 <c:if test="${param.registration=='wrong_date'}">
			       <small class="form-text text-danger"><spring:message code="local.registration.fail.date"/></small>
			 </c:if>  			
		  </div>
		</div>
		<div class="form-check form-check-inline">
		  <label class="form-check-label">
			<form:radiobutton class="form-check-input"   path="gender" id="inlineRadio1" value="male"/><spring:message code="local.userInfo.gender.male"/>
		  </label>
		</div>
		<div class="form-check form-check-inline">
		  <label class="form-check-label">
			<form:radiobutton class="form-check-input"   path="gender" id="inlineRadio2" value="female"/><spring:message code="local.userInfo.gender.female"/>
		  </label>
		</div>
		<div class="form-check form-check-inline">
		  <label class="form-check-label">
			<form:radiobutton class="form-check-input"   path="gender" id="inlineRadio3" value="none"  /><spring:message code="local.userInfo.gender.none"/>
		  </label>
		</div>		
				
		<div class="form-group row">
			<div class="col-8 offset-4">
				<button type="submit"   id="btn" class="btn btn-primary btn-lg" ><spring:message code="local.button.registration"/></button>
			</div>  
		</div>		
		    <sec:csrfInput/>  
    </form:form>
	<div class="text-center"><spring:message code="local.registration.haveAccount"/><a href="<c:url value="/showSignIn"/>"><spring:message code="local.signIn"/></a></div>
</div>


<footer>
    <jsp:include page="footer.jsp"/>
</footer>


</body>
</html>