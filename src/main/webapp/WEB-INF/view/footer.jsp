<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
      <link rel="stylesheet" type="text/css" href="<spring:url value="resources/footer.css"/>"/>

</head>
<body>
<footer class="footer_area section_padding_130_0">
      <div class="container"><hr>
        <div class="row">

          <div class="col-12 col-sm-6 col-lg-4">
            <div class="single-footer-widget section_padding_0_130">

              <div class="footer-logo mb-3"></div>
              <p><spring:message code="local.titlePage"/></p>

              <div class="copywrite-text mb-5">
                   <c:url var="openLink" value="/changeLocale">
                        <c:param name="local" value="en"/>
                   </c:url>
                   <a class="ml-1" href="${openLink}">EN </a>
                   
                  <c:url var="openLink" value="/changeLocale">
                        <c:param name="local" value="ru"/>
                   </c:url>
                    <a class="ml-1" href="${openLink}">RU </a>
                </p>
              </div>

              <div class="footer_social_area">
                 <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Facebook">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Pinterest">
                   <i class="fab fa-pinterest"></i>
               </a>
               <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="instagram">
                  <i class="fab fa-instagram"></i>
              </a>
              <a href="#" data-toggle="tooltip" data-placement="top" title="" data-original-title="Twitter">
                 <i class="fab fa-twitter"></i>
              </a>
            </div>
            </div>
          </div>
          
          <div class="col-12 col-sm-6 col-lg">
            <div class="single-footer-widget section_padding_0_130">
              <h5 class="widget-title"><spring:message code="local.footer.aboutUs"/></h5>

              <div class="footer_menu">
                <ul>
                  <li><a href="#"><spring:message code="local.footer.aboutUs"/></a></li>
                  <li><a href="#"><spring:message code="local.footer.community"/></a></li>
                  <li><a href="#"><spring:message code="local.footer.deliveryAndPayment"/></a></li>                  
                </ul>
                
              </div>
            </div>
          </div>

          <div class="col-12 col-sm-6 col-lg">
            <div class="single-footer-widget section_padding_0_130">
              <h5 class="widget-title"><spring:message code="local.footer.support"/></h5>
              
              <div class="footer_menu">
                <ul>
                  <li><a href="#"><spring:message code="local.footer.faq"/></a></li>
                  <li><a href="#"><spring:message code="local.footer.support"/></a></li>
                  <li><a href="#"><spring:message code="local.footer.privacy"/></a></li>
                </ul>
              </div>
            </div>
          </div>

          <div class="col-12 col-sm-6 col-lg">
            <div class="single-footer-widget section_padding_0_130">
              <h5 class="widget-title"><spring:message code="local.footer.contacts"/></h5>
              <div class="footer_menu">
                <ul>
                  <li><a href="#"></a></li>
                </ul>
              </div>              
            </div>
          </div>
        </div>
      </div>
    </footer>

</body>
</html>