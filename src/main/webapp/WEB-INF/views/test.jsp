<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 605
  Date: 2024-05-07
  Time: 오후 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--<c:forEach var="entry" items="${map}">
    <h2>Day ${entry.key}</h2>
    <ul>
        <c:forEach var="itemWrapper" items="${entry.value}">
            <c:choose>
                <c:when test="${itemWrapper.type == 'hotel'}">
                    <li>Hotel: ${itemWrapper.item.hotelName} - ${itemWrapper.item.destinationName}</li>
                </c:when>
                <c:when test="${itemWrapper.type == 'attraction'}">
                    <li>Attraction: ${itemWrapper.item.attractionName} - ${itemWrapper.item.attractionDescription}</li>
                </c:when>
                <c:when test="${itemWrapper.type == 'restaurant'}">
                    <li>Restaurant: ${itemWrapper.item.restaurantName} - ${itemWrapper.item.restaurantDescription}</li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</c:forEach>--%>
<c:forEach var="entry" items="${map}">
    <h2>Day ${entry.key}</h2>
    <ul>
        <c:forEach var="itemWrapper" items="${entry.value}">
            <c:choose>
                <c:when test="${itemWrapper.type == 'hotel'}">
                    <li>Hotel: ${itemWrapper.item.hotelName} - ${itemWrapper.item.destinationName}</li>
                    <c:when test="${itemWrapper.type == 'hotelImages'}">
                        <li>Hotel Image: ${itemWrapper.item.imgName}</li>
                    </c:when>
                </c:when>
                <c:when test="${itemWrapper.type == 'attraction'}">
                    <li>Attraction: ${itemWrapper.item.attractionName} - ${itemWrapper.item.attractionDescription}</li>
                </c:when>
                <c:when test="${itemWrapper.type == 'restaurant'}">
                    <li>Restaurant: ${itemWrapper.item.restaurantName} - ${itemWrapper.item.restaurantDescription}</li>
                </c:when>
            </c:choose>
        </c:forEach>
    </ul>
</c:forEach>
</body>
</html>
