<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title></title>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Raleway">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="<spring:url value="resources/menucss.css"/>">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" crossorigin="anonymous"> 
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/all.js" integrity="sha384-SlE991lGASHoBfWbelyBPLsUlwY1GwNDJo3jSJO04KZ33K2bwfV9YBauFfnzvynJ" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


                            

</head> 
<body>
<nav class="navbar navbar-expand-lg navbar-light">
	<a class="navbar-brand" href="<c:url value="showMainPage"/>"><b>Red Bear`s</b></a>  		
	<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">
		<div class="navbar-nav">
		
			<sec:authorize access="authenticated" var="authenticated" />
			
			   <c:forEach items="${groupCategory}" var="element">
			   	
			   	<c:url var="openLink" value="/subcategory" >
				   
				        <c:param name="categoryId" value="${element.id}"/>
				   
				</c:url>
				   
				   <a href="${openLink}" class="nav-item nav-link">${element.title}</a>
 			   </c:forEach>	
			
			  <c:if test="${userShort!=null}">  
			
			         <c:if test="${userShort.role.role == 'ROLE_ADMIN'}">
						<div class="nav-item dropdown">
							<a href="#" class="nav-item nav-link dropdown-toggle" data-toggle="dropdown"><spring:message code="local.menu.admin.action"/></a>
							<div class="dropdown-menu">					
								<a href="#" class="dropdown-item"><spring:message code="local.menu.admin.addRole"/></a>
								<a href="<c:url value="goToAddProduct"/>" class="dropdown-item"><spring:message code="local.menu.admin.addProduct"/></a>
			                </div>
			            </div>
	                </c:if> 
	                
           </c:if>  
            
        </div>
		<div class="navbar-nav ml-auto action-buttons">
			<div class="navbar-form-wrapper">
				<form class="navbar-form form-inline" action="Controller">
					<div class="input-group search-box">								
						<input type="text" name="searchProduct" id="search" class="form-control" placeholder=" ">
 						<div class="input-group-append">
							<span class="input-group-text">
                               <button class="search-button" ><i class="material-icons">&#xE8B6;</i></button>
							</span>
						</div>
					</div>
					
                </form>
            </div>
			<a href="<c:url value="showFvorites"/>" class="nav-item nav-link"><i class="far fa-heart fa-lg"></i></a>
			<a href="<c:url value="showCart"/>" class="nav-item nav-link"><i class="fas fa-shopping-bag fa-lg"></i></a>
			
 <c:choose>
		 <c:when test="${authenticated}">
			<div class="nav-item dropdown">
				<a href="#" data-toggle="dropdown" class="nav-item nav-link dropdown-toggle user-action"><img src="<c:url value="resources/img/ac2.png"/>" class="avatar" alt="Avatar">${userShort.name}<b class="caret"></b></a>
				<div class="dropdown-menu">
					<a href="<c:url value="showUserInfo"/>" class="dropdown-item"><i class="fas fa-user"></i><spring:message code="local.profile"/></a>
					<a href="<c:url value="showOrderHistory"/>" class="dropdown-item"><i class="fas fa-box"></i> <spring:message code="local.orders"/></a>
					<div class="divider dropdown-divider"></div>
					<a href="<c:url value="logout"/>" class="dropdown-item"><i class="fas fa-sign-out-alt"></i> <spring:message code="local.signOut"/></a>
				</div>
			</div>
		</c:when>	
		<c:otherwise>
				<div class="nav-item dropdown">
					 <a href="<c:url value="showSignIn"/>"  class="nav-link dropdown-toggle mr-4 "><spring:message code="local.signIn"/></a>
				</div>		
		</c:otherwise>
		
</c:choose>		
    </div>
		 
 </div>
	
</nav>

</body>
</html>                            