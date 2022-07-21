<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" 
              content="text/html; charset=UTF-8">

        <script src="http://code.jquery.com/jquery-2.2.4.js" 
                type="text/javascript"></script>
 
<link rel="stylesheet" href="<spring:url value="resources/SignIn.css"/>">


<title>Red Bear`s </title>

                         
</head>
<body>


   <main>
   
       <jsp:include page="menu.jsp"/>
   
   </main>
 
	  <div class="signup-form">
	    <form  action="<c:url value="/login"/>" method="post"   class="form-horizontal">
	      	<div class="row">
	        	<div class="col-8 offset-4">
					<h2><spring:message code="local.signIn"/></h2>
				</div>	
	      	</div>			
	
			<div class="form-group row">
				<label class="col-form-label col-4"><spring:message code="local.userInfo.email"/></label>
				<div class="col-8">
	                <input type="text"   class="form-control" id="email" name="email"  />
	            </div>        	
	        </div>
			<div class="form-group row">
				<label class="col-form-label col-4"><spring:message code="local.userInfo.password"/></label>
				<div class="col-8">
	                <input type="password"   class="form-control" name="password"  />

	                <c:if test="${param.signIn=='fail'}">
			           <small class="form-text text-danger"><spring:message code="local.signIn.fail.notFound"/></small>
				   </c:if>      	
	                
	            </div>  
	        </div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
			<div class="form-group row">
				<div class="col-8 offset-4">
					<button type="submit" class="btn btn-primary btn-lg" id="btn" ><spring:message code="local.signIn"/></button>
				</div>  
			</div>		      
	  </form>
	
		<div class="text-center"><spring:message code="local.signIn.noAccountMessage"/><a href="<c:url value="/showRegistration"/>"><spring:message code="local.signIn.createAccount"/></a></div>
	</div>

<footer>
	<jsp:include page="footer.jsp"/>
</footer>


</body>
</html>